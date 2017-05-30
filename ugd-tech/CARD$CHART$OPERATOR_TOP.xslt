<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="show top1">
            <div class="tableListHeader">
                    <div class="ft-cc-group-inner">
                        <div class="ft-cc-photo"></div>
                        <div class="ft-cc-info"></div>
                        <div class="ft-cc-appeal-time">Среднее время<div class="informer time">
                            <div class="rDrop"></div>
                            <div class="rDropTarget "  style="display: none;">Среднее время обработки обращения</div>
                        </div></div>
                        <div class="ft-cc-appeal-processed">Количество<div class="informer processed">
                            <div class="rDrop"></div>
                            <div class="rDropTarget "  style="display: none;">Количество обработанных обращений</div>
                        </div></div>
                    </div>
                </div>
            <ul class="ft-cc-group">

                <xsl:for-each select="//APPEAL_OPERATOR_TOP//ROW">
                    <li data-id="{ID}">
                        <div class="ft-cc-group-inner">

                            <div class="ft-cc-photo">
                              <span>
                                <xsl:if test="FOTO_ID">
                                  <xsl:attribute name="style">background-image: url(/ugd/getThumb.action?cardId=<xsl:value-of select="FOTO_ID"/>)</xsl:attribute>
                                </xsl:if>
                              </span>
                            </div>
                            <div class="ft-cc-info">
                                <span><xsl:value-of select="FIO"/></span>
                                <span class="ft-cc-info-org"><xsl:value-of select="ROLE_MODEL//MANAGEMENTS_NAME"/></span>
                            </div>
                            <div class="ft-cc-appeal-time">

                            <xsl:if test="DAY != 0"><div><span class="days"><xsl:value-of select="DAY"/></span></div></xsl:if>
                            <xsl:if test="HOUR != 0"><xsl:value-of select="HOUR"/> ч </xsl:if>
                            <xsl:if test="MINUTE != 0"><xsl:value-of select="MINUTE"/> мин</xsl:if>
                            </div>
                            <div class="ft-cc-appeal-processed"><xsl:value-of select="CNT"/></div>
                        </div>
                    </li>
                </xsl:for-each>
            </ul>
        <script>
            (function($) {
                $('.top1 .informer.time').ricosDrop({action: 'hover'});
                $('.top1 .informer.processed').ricosDrop({action: 'hover'});
                $('.days').each(function(indx, elm){
                    $(this).siblings('span').remove();
                    $(this).after('<span> '+lastDigitToWord($(this).text())+' </span>');
                });

            })(jQuery);
        </script>
        </div>
        <XML>
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>
