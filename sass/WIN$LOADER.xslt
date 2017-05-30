<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cfm="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml">    
    <xsl:output method="html"/>   

    <xsl:template match="/">
       
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <!--meta http-equiv="Content-Type" content="text/html; charset=UTF-8"-->    
      <title>Загрузчик файлов</title>
    
    <!-- Скрипты -->
    <script type="text/javascript" src="/static/JQuery/1.8.3/jquery.min.js"></script>
    
    <script type="text/javascript"><![CDATA[

        $(document).ready(function(){
            //персчитываем размер iframe(elFinder)
            var on_resize = function(){
                var height = $(window).height() - $('#header-wrap').outerHeight(true) - 1;
                $('#elib-elFinder').height(height);
            };
            on_resize();
            $(window).bind('resize',on_resize);
        });
      ]]></script>

    <!-- Стили -->
    {B{WIN$LOADER_STYLE}E}
</head>
<body>
    <!-- Данные -->
    <xml style="display: none;"><xsl:copy-of select="*"/></xml>

    <!-- Содержимое -->
    <div id="header-wrap">

        <div id="header">
            <h1 class="logo"><a href="index.html">СААС<!--xsl:value-of select="//HEADER"/--></a> &gt; Загрузка файлов проектной документации</h1>
        </div>

        <table id="bar">
            <tr>
                <td>
                    <xsl:if test="//ROW[NAME='iventoryVisibility']/VALUE = 'true'">
                        <input class="roundedButtons" onclick="window.location='inventory.html?docKey={//DOC_KEY/ROW_SET/ROW/DOC_KEY}';" type="button" value="Опись" style="float:right;margin-right:15px;"/>
                    </xsl:if>
                    <xsl:if test="//ROW[NAME='downloadPDVisibility']/VALUE = 'true'">
                        <input class="roundedButtons" onclick="window.location='/elib/getFileOrArchive.action?sqlNick=FORMS_DOC_FILES&amp;archive=true&amp;archiveName=PD&amp;with_ecp=0&amp;document_id={//DOC_KEY/ROW_SET/ROW/DOC_KEY}';" type="button" value="Выгружать ПД" style="float:right;margin-right:15px;"/>
                        <input class="roundedButtons" onclick="window.location='/elib/getFileOrArchive.action?sqlNick=FORMS_DOC_FILES&amp;archive=true&amp;archiveName=PD&amp;with_ecp=1&amp;document_id={//DOC_KEY/ROW_SET/ROW/DOC_KEY}';" type="button" value="Выгрузить ПД с ЭП" style="float:right;margin-right:15px;"/>
                    </xsl:if>
                    <xsl:if test="//ROW[NAME='openUploadVisibility']/VALUE = 'true'">
                        <input class="roundedButtons" onclick="openUpload();" type="button" value="Открыть загрузку" style="float:left;margin-left:15px;"/>
                    </xsl:if>
                    <xsl:if test="//ROW[NAME='status']/VALUE != 1">
                       <input class="roundedButtons" type="button" onclick="closeUpload();" value="Завершить загрузку" style="float:right;margin-right:15px;"/>
                    </xsl:if>
                </td>
            </tr>
        </table>
    </div>
    
    <iframe id="elib-elFinder" src="/elib/elFinderAction.action?entity={//DOC_KEY/ROW_SET/ROW/DOC_KEY}&amp;extensionSet=*.pdf.sig,*.rtf.sig,*.doc.sig,*.docx.sig,*.xls.sig,*.xlsx.sig,*.dwg.sig,*.dwx.sig,*.jpeg.sig,*.xml.sig"></iframe>

</body>
</html>
    
    </xsl:template> 
</xsl:stylesheet>