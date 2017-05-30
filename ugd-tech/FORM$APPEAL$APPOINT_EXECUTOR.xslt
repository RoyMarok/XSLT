<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>
{B{FORM$APPEAL$APPOINT_EXECUTOR_TMPL}E}
<xsl:template match="/">
<script src="/ugd/js/jquery/jquery-1.11.0.min.js"/>
    <style>
        .fa-line-form{
            padding: 10px;
            min-width: 200px;
            min-height: 200px;
            max-width: 600px;
        }
    </style>
    <form action="submit/simpleSubmit.action">
        <div class="fa-line-form">
            <input type="hidden" value="contact_center.appoint_executor" name="action"/>
            <input type="hidden" value="" name="EXECUTOR_ID"/>
            <input type="hidden" value="{//DOC_KEY//DOC_KEY}" name="APPEAL_ID"/>
            <xsl:call-template name="executorSelect">
                <xsl:with-param name="data" select="//CC_EMPLOYEES//ROW"/>
            </xsl:call-template>
            <div style="text-align: center;"><button type="button" class="ft-button ft-button-primary">Сохранить</button></div>
        </div>
    </form>

{B{CARD$PRELOADER}E}
<xml style="display: none">
  <xsl:copy-of select="/"/>
</xml>
<script>
<![CDATA[
$(function(){
    $('.ft-people-group li[data-id]').click(function() {
        var $t = $(this), id = $t.attr('data-id');
        $t.addClass('selected').siblings('.selected').removeClass('selected');
        $('[name="EXECUTOR_ID"]').val(id);
    });
    $('.ft-button-primary').click(function(){
        //$(this).parents('form').submit(); //WTF???
        var transferData = {};
        $('form input').each(function(indx, elm){
            transferData[$(elm).attr('name')] = $(elm).val();
        });
        $('.preloader').show();
        $('form').hide();
        $.ajax({
            url: $('form').eq(0).attr('action'),
            data: transferData
        }).success(function(data){
            if (window.opener){
                window.opener.location.reload();
            }
            window.close();
        });

    });
});
]]>
</script>
</xsl:template>
</xsl:stylesheet>