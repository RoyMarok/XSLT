<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="show">
            <div class="blockGroup">
                <div class="docElm"><div class="img blue">
                    <img src="/portal_static/img/icons/dashboard/doc-income.png" alt=""/></div><div class="text">Поступивших документов<div class="bigNumber"><xsl:value-of select="//CNT_RECEIVED"/></div></div></div>
                <div class="docElm"><div class="img purple">
                    <img src="/portal_static/img/icons/dashboard/doc-linked.png" alt=""/></div><div class="text">Привязанных документов<div class="bigNumber"><xsl:value-of select="//CNT_LNK"/></div></div></div>
                <div class="docElm"><div class="img green">
                    <img src="/portal_static/img/icons/dashboard/gpzu-issued.png" alt=""/></div><div class="text">Выпущенных ГПЗУ<div class="bigNumber"><xsl:value-of select="//CNT_GPZU"/></div></div></div>
                <div class="docElm"><div class="img yellow">
                    <img src="/portal_static/img/icons/dashboard/gpzu-linked.png" alt=""/></div><div class="text">ГПЗУ привязанных к объектам<div class="bigNumber"><xsl:value-of select="//CNT_LNK_GPZU"/></div></div></div>
            </div>
        </div>
        <XML>
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>