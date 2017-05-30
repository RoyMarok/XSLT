<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>
    <xsl:variable name="DATA" select="//FA_AGREEMENT_LIST//AGREEMENT_LIST"/>
    
    <xsl:template match="/">
    
    
    <link rel="stylesheet" href="/static/TokenInput/latest/token-input.css"/>
    <link rel="stylesheet" href="/static/typeForm/css/form.css"/>
    <link rel="stylesheet" href="/static/multiselect/multiselect.css"/>
    
    <link rel="stylesheet" href="/portal_static/css/ps/theme/ui.datepicker.css" />
    <link rel="stylesheet" href="/autoform/css/spbren/custom-theme/jquery-ui.custom.css" />
    <link rel="stylesheet" href="/portal_static/css/form-customize.css"/>

    <style>
        body {
            margin: 0;
            font-family: 'PTSans', Arial, sans-serif;
            background-color: #fff;
        }
        .fa-wrapper {
            width: 100%;
            display: -webkit-flex;
            display: -ms-flex;
            display: flex;
            font-size: 14px;
        }
        .fa-container {
            width: 780px;
            margin: 20px 0 0 100px;
            border: 1px solid #d7d8db;
        }
        .fa-container .formWrapper {
            min-height: inherit;
            margin: 0;
            padding: 0;
        }
        .fa-header {            
            padding: 35px 35px 5px 35px;
        }
        .fa-header h2 {
            font-weight: normal;
            margin-top: 0;
            padding: 0;
        }


        .fa-body {            
            padding: 0 35px 35px 35px;
        }
        .control-group {            
            margin-bottom: 15px;
        }

        .fa-attached-file {
            margin-left: 19px;
            height: 16px;
        }
        .fa-linked-doc a,
        .fa-attached-file a {
            color: #0144dd;
            text-decoration: none;
        }
        .fa-linked-doc a:hover,
        .fa-attached-file a:hover {
            color: #c00;
            border-bottom: 1px solid #c00;
        }
        .fa-linked-doc a::after {
            content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPBAMAAADJ+Ih5AAAAGFBMVEX///9fmezw8PA2eMihw/M5eMeiwvOnxO40va+0AAAAPklEQVQI12PAChIFBUXADAEGBkYII9QYymAAMxwFBZiZQQwhpYIAKEOZgQHCMCoUFAMzlBSBFDaGI9gCBAAAc7wGGRqx47YAAAAASUVORK5CYII=');
            display: inline-block;
            margin-left: 4px;
            position: absolute;
        }

        .fa-attached-file.pdf-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/pdf.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.bmp-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/image.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.xls-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/x_office_spreadsheet.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.doc-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/document.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.pptx-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/image_x_eps.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.rar-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/zip.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.txt-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/text_plain.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.xml-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/xml.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.other-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/application_octet_stream.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }
        
        .control-group textarea{
            border: 1px solid #d9dbdd;
            min-height: 72px;
            width: 100%;
            padding: 7px 7px 7px 10px;
            font-family: 'PTSans', Arial, sans-serif;
            resize: vertical;
        }
        .control-group textarea:hover {
            border-color: #41a3e0;
        }
        .control-group ul.token-input-list {
            width: 708px;
        }
        .control-group h2 {
            font-weight: normal;
            margin: 0 0 10px 0px;
            padding: 0;
        }
        .fa-container .formWrapper ul.token-input-list li,
        .fa-container .formWrapper ul.token-input-list li input:first-child {
            height: 38px;
        }
        .fa-container .formWrapper ul.token-input-list li.token-input-token {
            padding: 5px 10px;
        }
        .control-group .tokenWrapper b {
            top: 12px;
        }

        
        .fa-footer {
            border-top: 1px solid #d7d8db;
            padding: 22px 35px 22px 35px;
            background-color: #fafbfc;
        }
        .fa-button {
            display: inline-block;
            margin-right: 10px;
            border-radius: 3px;
            border: 1px solid transparent;
            /* min-width: 150px; */
            padding: 7px 10px;
            background: transparent;
            font-size: 16px;
            position: relative;
            cursor: pointer;
            text-decoration: none;
        }
        .fa-button:hover {
            background-color: #fff;
            border-color: #ccc;
        }
        .fa-button:before {
            content: '';
            display: block;
            background-repeat: no-repeat;
            background-position: center center;
            height: 100%;
            position: absolute;
            left: 10px;
            top: 0;
            opacity: .7;
        }
        .fa-button-primary {
            color: #fff;
            background-color: #319ADC;
        }
        .fa-button-primary:hover {
            background-color: #0072ff;
            border-color: transparent;
        }
        .fa-button-cancel {
            padding-left: 30px;
        }
        .fa-button-cancel:before {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAOCAMAAADDoWbgAAAAM1BMVEUAAAB/f3+AgICAgIB/f39/f3+AgICAgICAgICAgICAgICAgIB/f3+AgICAgIB/f3+AgIBsJ/mfAAAAEHRSTlMADKvDBBjXuvOjjYII48sokG78nwAAAFJJREFUCNddzlEKwCAMA1CrVjd1W+5/2jUFQeqH4ZVAm8KTKZ5rqv0dhawZzeKGkUD3IUmw4rzg/U0i6GyujaYFyJUbiCSk6SUS+VjoMJDjCzf/QmwDXrc94cYAAAAASUVORK5CYII=');
            width: 13px;
        }

        .fa-single-person {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            height: 34px;
            margin-bottom: 10px;
        }

        .fa-person-photo {
            width: 34px;
            height: 34px;
        }
        .fa-person-photo img {
            width: 34px;
            height: 34px;
            border-radius: 100px;
        }

        .fa-person-initials {
            line-height: 34px;
            margin-left: 12px;
            font-size: 16px;
            width: 300px;
        }

        .fa-calendar.line {
            width: 115px;
            margin: 2px 0 0 0;
            clear: none;
            padding: 0;
        }
        .fa-calendar.line .inputWrap {
            position: static;
            margin: 0;
            padding: 0;
        }
        .fa-calendar .date {
            font-size: 15px;
        }

        .fa-delete-person .line {
            width: 32px;
            height: 32px;
            padding: 0;
            margin: 2px 0 0 0;
        }

        .fa-no-image {
            background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAMAAAANmfvwAAAAh1BMVEUAAADY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+WKk5iPmJ2NlpvU2+Grs7nDy9G+xsuttrugqa7N1Nqyur+VnqOSm6DW3eOjrLGcpaqXoKXJ0de6wseosLadpqvP192aoqh4jQezAAAAFXRSTlMA+uy0s6BgIhbyy35aPcxZ83w+ejxHN123AAABYklEQVQ4y42U2XLCMAxFnZUQdlpvsbMCAUL///vaNLIsmtLpfZPnjCVdyWZEWZrkYRCEeZJm7Ddt4oCjgngzAxYR/6Fo8Uzslnym5ZoSKw4yg7gYhFaeeIMjfRajztoxB8wCB6dKTKpOjtlBpa4OK5ws1jPVjL0UiBS+r5F4x1AiIjlq9CfGqEek90jMWOY97RBpic8ZS32kEFHcK2WJDypEPgiSsNwHN0QaguQs9AFad9EECVlAohqQKycKKKKv92lGV00Rn6huWlUXUsl7LdumJomgXF2q79mYxnAztl24m7bQtB6mFLwRJZ/SDcAkYF0Js9GmNRpcLk5gXRbQCd6sullnsZkGAGNEWwtRXFxQwhjZhiJfgN+ayi0Di+iqdLbFpRlviXAxH7as+k4qJaRQSnZ9VdqHX0y25i+FT+nwiliRp/YnAbn2c2C//v+zRx1jujrxcQbAF7Qdv6Dt8xf0CQt3TYPhEUP4AAAAAElFTkSuQmCC');
        }

        .ui-datepicker .ui-datepicker-title {
            color: #fff;
        }
        .token-input-dropdown ul li {
            font-size: 16px;
        }
        div.token-input-dropdown ul li.token-input-selected-dropdown-item {
            background-color: #319adc;
            color: #fff;
        }
        /* Custom checkbox */
       

        .control {
            font-size: 15px;
            position: relative;
            display: block;
            padding-left: 30px;
            cursor: pointer;
            line-height: 26px;
        }
        .control input {
            position: absolute;
            z-index: -1;
            opacity: 0;
        }
        .control__indicator {
            position: absolute;
            top: 2px;
            left: 0;
            width: 20px;
            height: 20px;
            background: #fff;
            border: 1px solid #D9DBDD;
            box-sizing: border-box;
            overflow: hidden;
        }
        /* hover */
        .control:hover input ~ .control__indicator {
            background: #fff;
            border: 1px solid #e0e0e0;
        }
        /* checked */
        .control input:checked ~ .control__indicator {
            background: #fff; 
            border: 1px solid #319adc;
        }
        /* check mark */
        .control__indicator:after {
            position: absolute;
            content: '';
        }        
        /* checkbox tick */
        .control--checkbox .control__indicator:after {
            transform: rotate(45deg);
            display: block;
            margin-top: -3px;
            margin-left: 7px;
            width: 0;
            height: 0;
            box-shadow: 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0 inset;
        }
        /* show check mark */
        .control input:checked ~ .control__indicator:after {
            color: #319adc;          
            box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px;
            -webkit-animation: checkbox-on 0.3s forwards;
            -o-animation: checkbox-on 0.3s forwards;
            animation: checkbox-on 0.3s forwards;
        }

        /* checkbox animation */        
        @-webkit-keyframes checkbox-on {
            0% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 15px 2px 0 11px; }
            50% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px 2px 0 11px; }
            100% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px; }
        }
        @keyframes checkbox-on {
            0% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 15px 2px 0 11px; }
            50% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px 2px 0 11px; }
            100% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px; }
        }





    </style>
    <div class="fa-wrapper">

        <div class="fa-container">
            <xsl:if test="$DATA/TEXT">
                <p><xsl:value-of select="$DATA/TEXT"/></p>
            </xsl:if>
            <form action="submit/simpleSubmit.action" method="POST" class="formWrapper" id="formWrapper" xfTag="AGREEMENT_LIST">

                <input id="xml" type="hidden" name="XML" />
                <input type="hidden" name="action" value="functional_agreement.save_agreement_list" />
                <input type="hidden" xfTag="TYPE" value="{$DATA//TYPE}" />
                <!-- <div class="fa-header">
                    <h2 class="fa-header"></h2>
                </div> -->
                <div class="header">
                   <h1>
                      <span>НАПРАВИТЬ НА СОГЛАСОВАНИЕ</span>
                   </h1>           
                </div>                
                <div class="fa-body">

                    <div class="control-group fa-linked-doc">                        
                        <xsl:value-of select="$DATA//ATTR[NAME = 'AGREE_DOC_NAME']/VALUES/VALUE" disable-output-escaping="yes" />
                    </div>

                    <div class="control-group fa-attached-file">                        
                        <xsl:value-of select="$DATA//ATTR[NAME = 'AGREE_FILES']/VALUES/VALUE" disable-output-escaping="yes" />
                    </div>

                    <div xfTag="FILES">
                        <input type="hidden" class="fileID" xfTag="ID" value="" />
                    </div>

                    
                    <div class="control-group" xfTag="DOCUMENTS">
                        <input type="hidden" value="{$DATA//DOCUMENTS/ID}" xfTag="ID" />
                        <h2>Выбрать согласующих</h2>
                    </div>

                    <!-- <div >
                        <input type="hidden" value="{$DATA//FILES/ID}" xfTag="ID" />
                    </div> -->

                    <div class="control-group" id="personsList" xfTag="AGREEMENTS">
                    </div>

                    <div class="control-group">                        
                        <div class="_token_input_wrapper" >
                            <input type="text" class="tokenInput" data-identifier="{$DATA//ATTR[NAME = 'AGREE_LIST_ALIGNER']/VALUES/VALUE}" data-load-names="true" data-token-limit="1" data-info="inputName"/>
                             <span class="hidden tokenValues">
                                 <xsl:choose>
                                     <xsl:when test="ID = ''">
                                         <span class="tokenItem">
                                             <span class="tokenId"></span>
                                             <span class="tokenValue"></span>
                                         </span>
                                     </xsl:when>
                                     <xsl:otherwise>
                                       <span class="tokenItem">
                                           <span class="tokenId">
                                               <xsl:value-of select="ID"/>
                                           </span>
                                           <span class="tokenValue"></span>
                                       </span>
                                     </xsl:otherwise>
                                 </xsl:choose>
                             </span>
                       </div>
                    </div>

                    <div class="control-group">
                        <label class="control control--checkbox">Параллельное согласование
                            <input xfTag="IS_PARALLEL" type="checkbox" name="isParallel" checked="checked" value="true" />
                            <div class="control__indicator"></div>
                        </label>
                    </div>

                    <div class="control-group">
                        <textarea xfTag="TEXT" placeholder="Добавьте комментарий к документу...">
                            <xsl:value-of select="$DATA//TEXT" />
                        </textarea>
                    </div>

                </div>

                <div class="fa-footer">
                    <button type="button" data-action="submit" class="fa-button fa-button-primary">Отправить</button>
                    <button type="button" data-action="cancel" class="fa-button fa-button-cancel" onclick="window.close();">Отменить</button>
                </div>
            </form>

            <script id="personRow" type="text/template">
                <div class="fa-single-person" xfTag="AGREEMENT">
                    <div class="fa-person-photo">
                       
                    </div>
                    <div class="fa-person-initials">
                        
                    </div>
                    <div class="fa-calendar line">
                        <span class="inputWrap">
                            <input type="text" class="date" xfTag="DEADLINE"/>
                            <img class="ui-datepicker-trigger" src="/portal_static/img/searchForm/calIco.png" />
                        </span>
                    </div>
                    <div class="fa-delete-person buttonsWrap" onclick="$(this).parent().remove()">
                        <div class="line addRemLine">
                            <span class="addRem rem" title="Убрать строку">
                                <span></span>
                            </span>
                        </div>
                    </div>
                    <input type="hidden" xfTag="ALIGNER" />
                </div>
            </script>


        </div>
    </div>




    <xml style="display: none">
        <xsl:copy-of select="*"/>
    </xml>
    <script src="/static/HSF/latest/hsf.js"></script>
    <script src="js/jquery/jquery-1.11.0.min.js"></script>    
    <script src="/static/typeForm/typeForm.js"></script>
    <script src="/static/TokenInput/latest/jquery.tokeninput.js"></script>
    <script src="/static/typeForm/formHelper.js"></script>
    <script src="js/jquery/jquery-ui-1.10.4.custom.min.js"></script>
    <script src="js/ui.datepicker-ru.js"></script>


                        

    {B{FRM$XML_GENERATION$V0}E}
        
    
    <script>              
        <![CDATA[     
        window.datePickerFormat = {
          dateFormat:      "dd.mm.yy",
          showOn:          "button",
          buttonImage:     "/portal_static/img/searchForm/calIco.png",
          buttonImageOnly: true,
          changeYear:      true,
          changeMonth:     true,
          duration:        '',
          showButtonPanel: true,
          gotoCurrent:     false,
          beforeShow:      window.typeForm.showPicker,
          onClose:         window.typeForm.hidePiker
        };
                           
        $(function(){
            
            $('.date').datepicker();


            $('.tokenInput').each(function() {
             initTokenInput($(this));
            });

            $('input[name="isParallel"]').on('change', function(){
                if($(this).val() == 'true') {
                    $(this).val('false');
                } else {
                    $(this).val('true');
                }
            });

            $(document).on('change', '[data-token-inited="true"]', function() {
                var $this = $(this),
                    $tokenWrapper = $this.closest('.tokenWrapper'),
                    value = $tokenWrapper.find('.token-input-token input:hidden').val(),
                    personsContainer = $('#personsList'),
                    personTmpl = $( $('#personRow').html() ),
                    identifier = $this.data('identifier');
                    
                   


                $.post('/components/multiselect.action?identifier='+identifier+'&term='+value)
                    .done(function(data){
                        var personData = data[0],
                            personPhotoId = personData.extraFields.foto_id,
                            personName = personData.extraFields.name_short,                                                       
                            img = $('<img />').attr('src', 'getThumb.action?cardId='+personPhotoId);

                        if( img.attr('src') == 'getThumb.action?cardId=null') {
                            personTmpl.find('.fa-person-photo').empty().addClass('fa-no-image');
                        } else {
                            personTmpl.find('.fa-person-photo').empty().append(img);
                        }
                        
                        personTmpl.find('.fa-person-initials').empty().text(personName);
                        personTmpl.find('[xfTag="ALIGNER"]').val(value);

                        personsContainer.append(personTmpl);

                        $('.date').datepicker();

                    })
                    .error(function(error){
                        alert(error);
                    });

                    reInitTokenInput($('.tokenInput'));
            });

            $('#formWrapper').on('submit', function(e) {
                //e.preventDefault();
                $('#xml').val(xf_generateXML('formWrapper'));

                //console.log( $('#xml').val(xf_generateXML('formWrapper')) );
                
            });

         


            $('.fa-button-primary').on('click', function(e){
                e.preventDefault();
                $('#formWrapper').submit();

                // e.stopPropagation();

                // var $this = $(this);
                //     action = $this.data('action'),
                //     xml = xf_generateXML('formWrapper');



                // $('#xml').val(xml);

                // if(action == 'submit') {

                //     $.post('submit/simpleSubmit.action?action=functional_agreement.save_agreement_list', $('#formWrapper').serializeArray())
                //     .done(function(data) {
                //         console.log(data);
                //     })
                //     .error(function(error) {
                //         alert(error);
                //     })
                //     .always(function(){
                //         console.log($('#formWrapper').serializeArray());
                //     });

                // } else {
                //     return false;
                // }


            });

            $('.fa-attached-file').each(function() {
                var $t = $(this);
                var a = ['cardId', 'fileName', 'fileSize', 'fileType'];
                var b = $t.html().split('==');
                var z = {};
                for (var i=0; i<a.length; i++) {
                    z[a[i]] = b[i];
                }
                var $a = $('<a></a>').attr('href', '/elib/getFile.action?cardId=' + z.cardId);                
                
                $('.fileID').val(z.cardId);
                
                if(z.fileName !== undefined) {
                    $a.html(z.fileName);
                    $t.empty().append($a);
                   
                }               

                switch(z.fileType) {
                    case 'pdf':
                        $a.parent().addClass('pdf-file');
                        break;
                    case 'zip':
                        $a.parent().addClass('rar-file');
                        break;
                    case 'rar':
                        $a.parent().addClass('rar-file');
                        break;
                    case 'bmp':
                        $a.parent().addClass('bmp-file');
                        break;
                    case 'xls':
                        $a.parent().addClass('xls-file');
                        break;
                    case 'docx':
                        $a.parent().addClass('doc-file');
                        break;
                    case 'pptx':
                        $a.parent().addClass('pptx-file');
                        break;
                    case 'txt':
                        $a.parent().addClass('txt-file');
                        break;
                    case 'xml':
                        $a.parent().addClass('txt-file');
                        break;
                    default:
                         $a.parent().addClass('other-file');
                }

            });


        });
        ]]>
    </script>
    </xsl:template>
</xsl:stylesheet>