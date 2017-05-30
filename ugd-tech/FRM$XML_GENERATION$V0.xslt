    <script language="JavaScript"><![CDATA[
        // DOM related
        function xf_createDocument() {
            var doc;
            if (document.implementation && document.implementation.createDocument) {
                // This is the W3C standard way to do it
                doc = document.implementation.createDocument(null, null, null);
                console.log("native DOM implementation");
            }
            else { // This is the IE way to do it
                doc = new ActiveXObject("MSXML2.DOMDocument");
                console.log("MSXML2.DOM implementation");
            }
            return doc;
        }

        function xf_serialize(document) {
            var s = new XMLSerializer();

            var str = s.serializeToString(document);

            return str;
        }
        // xml generation routines
        var xf_xfTag = "xfTag";
        var xf_xfNS = "xfNS";
        var xf_xfProcessChildren = "xfProcessChildren";
        var xf_defaultPrefix = "a";
        /**
         * extracts value from control
         * @param doc - target document
         * @param xmlElement - target element
         * @param srcElement - source HTML element
         * @param parentNS - current xml namespace
         */
        function xf_extractValue(doc, xmlElement, srcElement, parentNS) {
            console.log('src tag=' + srcElement.tagName + ' type=' + srcElement.type);
            if (srcElement.tagName.toUpperCase() == 'INPUT') {
                if (srcElement.type.toUpperCase() == 'CHECKBOX' || srcElement.type.toUpperCase() == 'RADIO') {
                    console.log('checkbox.checked=' + srcElement.checked);
                    if (srcElement.checked)
                        xmlElement.appendChild(doc.createTextNode(srcElement.value));
                }
                else {
                    if (srcElement.value)
                        xmlElement.appendChild(doc.createTextNode(srcElement.value));
                }
            } else if (srcElement.tagName.toUpperCase() == "TEXTAREA") {
                    if (srcElement.value)
                        xmlElement.appendChild(doc.createTextNode(srcElement.value));

            } else if (srcElement.tagName.toUpperCase() == "SELECT") {
                if (srcElement.value)
                    xmlElement.appendChild(doc.createTextNode(srcElement.value));

            }else if ($(srcElement).hasClass('_token_input_wrapper')){
                $.each($(srcElement).find('input[type="hidden"]'), function(i,val){
                    console.log('i='+i);
                    console.log('val='+val);
                });
            }

        }

        /**
         * scans DOM structure and builds an xml from input data
         * @param doc - target document
         * @param xmlElement - target element
         * @param srcElement - source HTML element
         * @param parentNS - current xml namespace
         */
        function xf_scan(doc, xmlParent, srcParent, parentNS) {

            // stop process children flag
            var processChildren = srcParent.getAttribute(xf_xfProcessChildren);
            if (processChildren != 0) {
                var children = srcParent.children;

                for (var i = 0; i < children.length; i++) {
                    var srcElement = children[i];

                    // if there is a tag definition then add a tag to result document
                    if (srcElement.hasAttribute(xf_xfTag)) {
                        var xmlTag = srcElement.getAttribute(xf_xfTag);
                        var xmlNS;
                        if (srcElement.hasAttribute(xf_xfNS))
                            xmlNS = srcElement.getAttribute(xf_xfNS);
                        else
                            xmlNS = parentNS;

                        console.log('tag=' + xmlTag + ' xmlNS=' + xmlNS);

                        // если это токен инпут, используем отдельную обработку
                        if ($(srcElement).hasClass('_token_input_wrapper')){
                            $.each($(srcElement).find('input[type="hidden"]'), function(i,val){
                                var xmlElement;
                                if (xmlNS && xmlNS != "")
                                    xmlElement = doc.createElementNS(xmlNS, xf_defaultPrefix + ":" + xmlTag);
                                else
                                    xmlElement = doc.createElement(xmlTag);
                                xmlParent.appendChild(xmlElement);
                                xmlElement.appendChild(doc.createTextNode($(val).val()));
                            });
                        } else if ($(srcElement).hasClass('fileList')){
                            $.each($(srcElement).find('.attachmentFileRow'), function(i,val){
                                var xmlElement;
                                if (xmlNS && xmlNS != "")
                                    xmlElement = doc.createElementNS(xmlNS, xf_defaultPrefix + ":" + xmlTag);
                                else
                                    xmlElement = doc.createElement(xmlTag);
                                xmlParent.appendChild(xmlElement);
                                xmlElement.appendChild(doc.createTextNode($(val)[0].id));
                            });
                        }else{
                            var xmlElement;
                            if (xmlNS && xmlNS != "")
                                xmlElement = doc.createElementNS(xmlNS, xf_defaultPrefix + ":" + xmlTag);
                             else
                                xmlElement = doc.createElement(xmlTag);
                            xmlParent.appendChild(xmlElement);
                            xf_extractValue(doc, xmlElement, srcElement);
                        }
                        xf_scan(doc, xmlElement, srcElement, xmlNS);
                    } else
                        xf_scan(doc, xmlParent, srcElement, parentNS);
                }
            }

        }

        /**
         * generates XML from html controls and layout tags
         * @param rootId - root element id
         * @returns built xml as string
         */
        function xf_generateXML(rootId) {

            var d = xf_createDocument();

            var rootSrcElement = document.getElementById(rootId);

            var xmlTag = rootSrcElement.getAttribute(xf_xfTag);
            var xmlNS = rootSrcElement.getAttribute(xf_xfNS);

            var rootXMLElement;
            if (xmlTag) {

                if (xmlNS && xmlNS != '')
                    rootXMLElement = d.createElementNS(xmlNS, xf_defaultPrefix + ":" + xmlTag);
                else
                    rootXMLElement = d.createElement(xmlTag);
            }
            else
                rootXMLElement = d.createElement('ROOT');

            d.appendChild(rootXMLElement);


            xf_scan(d, rootXMLElement, rootSrcElement, xmlNS);

            var xmlString = xf_serialize(d);

            return xmlString;

        }
        // end
    ]]></script>