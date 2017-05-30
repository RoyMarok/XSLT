<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="show">
            <div class="blockGroup">
                <div class="docElm"><div class="img ">
                    <div class="basedImg appeal_reg"></div></div><div class="text">Зарегистрировано<div class="bigNumber"><xsl:value-of select="//CNT_REG"/></div></div></div>
                <div class="docElm"><div class="img ">
                    <div class="basedImg appeal_done"></div></div><div class="text">Выполнено<div class="bigNumber"><xsl:value-of select="//CNT_COMPLETE"/></div></div></div>
                <h3 class="topLine">В работе</h3>
                <div class="docElm"><div class="img ">
                    <div class="basedImg appeal_line1"></div></div><div class="text">1 линия<div class="bigNumber"><xsl:value-of select="//CNT_1LINE"/></div></div></div>
                <div class="docElm"><div class="img ">
                    <div class="basedImg appeal_line2"></div></div><div class="text">2 линия<div class="bigNumber"><xsl:value-of select="//CNT_2LINE"/></div></div></div>
            </div>

        </div>

        <XML>
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>
