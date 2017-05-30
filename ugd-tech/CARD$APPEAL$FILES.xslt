<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="listLimited">
        <xsl:for-each select="//ROOT//CC_APPEAL_FILES//ROW">
            <div class="listLimited_element"><a class="file" data-filetype="{FILE_EXTENSION}" data-filesize="{FILE_SIZE}" target="_blank" href="/elib/getFile.action?cardId={ID}" onclick="fileBaloon.folder.portal = '/ugd'; fileBaloon.toggle(this, '{ID}', 0, 0); return false"><xsl:value-of select="FILE_NAME"/></a></div>
        </xsl:for-each>
        </div>
        <xml style="display: none">
          <xsl:copy-of select="/"/>
        </xml>

    </xsl:template>
</xsl:stylesheet>
