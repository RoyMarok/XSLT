<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
<xsl:output method="html" indent="yes" undeclare-prefixes="yes" />
<xsl:variable name="DATA">
    <ROOT xmlns="">
        <TEST_VALUE>NULL</TEST_VALUE>
        <xsl:copy-of select="/"/>
    </ROOT>
</xsl:variable>
<xsl:variable name="STYLES">
{B{SCRIPT$DATE_RANGE_Style}E}
<style>
body {
    margin: 0;
    font-family: 'PTSans', Arial, sans-serif;
    background-color: #fff;
}
.sf-wrapper {

}
.sf-container {
    width: 550px;
    /*height: 830px;*/
    border-radius: 3px;
    position: absolute;
    left: 0;
    right: 0;
    margin: 0 auto;
    border: 1px solid #cdd6df;
}

.sf-container form{
        margin: 0 42px;
}
.sf-header {
    height: 50px;
    background-color: #319adc;
    font-size: 22px;
    color: #fff;
    position: relative;
    padding-left: 42px;
    line-height: 50px;
}
.sf-header .search-icon {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAWZJREFUeNqslbFKxEAURZOAKUS22n8w4IKFpRFtRPwH8QtSLGy/7BeoH7F2wXJ1Ky1kLU0h0cbaZitFBZWM98EdCHGymazz4JBhcufy8mbexPcMoZTq4BGDCAQgB7e+7796ywQM18EIvKu/IXOnoGfj5ZdMZcEYbIIMTMEMFMz+AIhmDvaR/YNtphn4BkPQNWi6YECNaDdsjEf83KGFNqH2oknYYf3uTZnWrBHtF1it0wSsnwimqNvccp+l/itgb5FxxPGsxQHS2miRccBx0cK4KK2vNc45jlsYa23uevOyps3TwjOez4GF6TH4ARObDHrgheZJg6lo3kC8bEtfgTtu1DY4ZEt/gjXwBHasjqi0qXQU61cNmZtIpuCRc9fgkt0YGjO2uDZvkN2HvjfwSMFuadk53h95/w1mWo2+C+NEmeOkWpa2xiEY1/wQEheZ9w3mqeci+Pn6d/YMtlwZh6x5qk1/BRgADEq2QqZIIPMAAAAASUVORK5CYII=');
    width: 22px;
    height: 22px;
    position: absolute;
    top: 14px;
    left: 10px;
}
.sf-header .sf-close-btn {
    border: none;
    background: none;
    color: #fff;
    font-size: 34px;
    cursor: pointer;
    padding: 0;
    margin: 0;
    position: absolute;
    right: 23px;
    top: 18px;
    line-height: 0px;
    width: 16px;
    height: 16px;
    background-image: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRkZGRkZGIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA5NiA5NiIgeD0iMHB4IiB5PSIwcHgiPjx0aXRsZT5jb2xsZWN0aW9uPC90aXRsZT48cmVjdCB4PSIxOS4xNyIgeT0iNDUuNSIgd2lkdGg9IjU4LjQ2IiBoZWlnaHQ9IjUuMDQiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xOS43OCA0OC4yOSkgcm90YXRlKC00NSkiLz48cmVjdCB4PSI0NS44OCIgeT0iMTguOCIgd2lkdGg9IjUuMDQiIGhlaWdodD0iNTguNDYiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xOS43OCA0OC4yOSkgcm90YXRlKC00NSkiLz48L3N2Zz4=);
    background-repeat: no-repeat;
    background-size: 32px;
    background-position: 50%;
    transition: all .3s;
}
.sf-header .sf-close-btn:hover{
    transform: rotate(180deg);
    transition: all .3s;
    background-size: 40px;
}
.sf-container  .tokenWrapper, .sf-container ul.token-input-list{
    width: 100%;
}
[target="pageEditor"]{
    display: none;
}
.sf-container .line.full{
    width: 100%;
}
.sf-container .line .inputName{
    width: 100%;
    float: none;
    text-align: left;
}
.sf-container .line .inputWrap{
    margin-left: 0;
}
.sf-container .line.checkbox .inputWrap{
    margin-top: -25px;
}
.sf-container .line.checkbox .inputWrap label{
    font-size: 13px;
}
.checkbox-wrap{
    display: inline-block;
}
.checkbox-wrap:not(:last-child){
    margin-right: 30px;
}
.sf-container .line.full .tokenWrapper{
    width: 100%!important;
}


.grey-line {
    height: 1px;
    background: #dbdbdb;
    width: 548px;
    margin: 25px 0 25px -42px;
}
</style>

</xsl:variable>
<xsl:variable name="LAYOUT">
    <div class="sf-wrapper">
    <div class="sf-container">
        <div class="sf-header">
          <span class="search-icon"></span> Поиск по мероприятиям
            <button class="sf-close-btn"></button>
        </div>
        <layout:form action="/customactions/requestSave.action" xmlTag="request">
            <input type="hidden" name="DDATE_BEGIN" value="{//PARAMETER_MAP//DDATE_BEGIN}"/>
            <input type="hidden" name="DDATE_END" value="{//PARAMETER_MAP//DDATE_END}"/>
            <layout:simple-field label="Мероприятие" class="full" required="0">
                <layout:multiselect value="" limit="1" listSourceID="PERSONS_FROM_ORGANIZATIONS" name="search" xmlTag=":name:" />
            </layout:simple-field>
            <layout:simple-field label="Срок завершения мероприятия" class="full" required="0">
            <div class="calendar"><div class="date_view"></div><div class="minimal2calendars">
            <div class="pickerwrap">
                <div class="pikers_one"></div>
                <div class="pikers_two"></div>
            </div>
            <input type="button" value="Применить" class="bigBigButton"/>
        </div></div>
            </layout:simple-field>
            <layout:simple-field label="Статус" class="full checkBox" required="0">
                <layout:checkbox forceCheckbox="1" label="Выполнено" name="done" xmlTag=":name:" />
                <layout:checkbox forceCheckbox="1" label="Не выполнено" name="done" xmlTag=":name:" />
                <layout:checkbox forceCheckbox="1" label="В работе" name="done" xmlTag=":name:" />
            </layout:simple-field>
            <div class="grey-line"></div>
            <layout:simple-field label="Курирующий заместитель" class="full" required="0">
                <layout:multiselect value="" limit="1" listSourceID="PERSONS_FROM_ORGANIZATIONS" name="search" xmlTag=":name:" />
            </layout:simple-field>
            <layout:simple-field label="Ответственное управление" class="full" required="0">
                <layout:multiselect value="" limit="1" listSourceID="PERSONS_FROM_ORGANIZATIONS" name="search" xmlTag=":name:" />
            </layout:simple-field>
            <layout:simple-field label="Ответственный за мероприятие" class="full" required="0">
                <layout:multiselect value="" limit="1" listSourceID="PERSONS_FROM_ORGANIZATIONS" name="search" xmlTag=":name:" />
            </layout:simple-field>
            <layout:simple-field label="Исполнитель" class="full" required="0">
                <layout:multiselect value="" limit="1" listSourceID="PERSONS_FROM_ORGANIZATIONS" name="search" xmlTag=":name:" />
            </layout:simple-field>
            <layout:simple-field label="Соисполнитель" class="full" required="0">
                <layout:multiselect value="" limit="1" listSourceID="PERSONS_FROM_ORGANIZATIONS" name="search" xmlTag=":name:" />
            </layout:simple-field>
            <layout:simple-field label="" class="full centered" required="0">
                <div class="ft-button ft-button-primary ">Найти</div>
            </layout:simple-field>
        </layout:form>
    </div>
    </div>
</xsl:variable>

{B{FRM$XML_LAYOUT$V0.2}E}

<xsl:template match="/">

        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="customStyles">
              <xsl:copy-of select="$STYLES"/>
            </xsl:with-param>
            <xsl:with-param name="data" select="$DATA"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template>
{B{SCRIPT$DATE_RANGE_Extended}E}
<script>
<![CDATA[

]]>
</script>
 </xsl:template>

</xsl:stylesheet>
