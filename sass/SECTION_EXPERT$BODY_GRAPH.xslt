<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">

        <div class="widgetBlock whiteBlock">
                        <div class="widgetCaption showHide">Выдано заключений в 2016 году</div>
                        <div class="widgetBody" style="text-align: center; padding-bottom: 10px;">
                            <img src="data:image/png;base64,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" />
                        </div>
                    </div>

    </xsl:template>
</xsl:stylesheet>