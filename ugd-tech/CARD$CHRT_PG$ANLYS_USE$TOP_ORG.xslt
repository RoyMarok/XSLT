<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="show">
            <div class="tabWrapper">
                <div class="tabDescr">Показать:</div>
                <div class="tabSelector" data-target="oiv">ОИВ</div>
                <div class="tabSelector" data-target="invest">Застройщики</div>
                <!--xsl:if test="count(//ANLYS_USE_TOP_ORG//OIV/ORG) &gt; 0"><div class="tabSelector" data-target="oiv">ОИВ</div></xsl:if>
                <xsl:if test="count(//ANLYS_USE_TOP_ORG//INVEST/ORG) &gt; 0"><div class="tabSelector" data-target="invest">Застройщики</div></xsl:if-->
            </div>
            <xsl:if test="count(//ANLYS_USE_TOP_ORG//OIV/ORG) &gt; 0">
            <ul class="ft-cc-group oiv">
                <xsl:for-each select="//ANLYS_USE_TOP_ORG//OIV/ORG">
                    <li>
                        <div class="ft-cc-group-inner">
                            <div class="ft-cc-info"><xsl:value-of select="ORG"/></div>
                            <div class="ft-cc-enters"><xsl:value-of select="CNT"/></div>
                        </div>
                    </li>
                </xsl:for-each>
            </ul>
            </xsl:if>
            <xsl:if test="count(//ANLYS_USE_TOP_ORG//INVEST/ORG) &gt; 0">
            <ul class="ft-cc-group invest">
                <xsl:for-each select="//ANLYS_USE_TOP_ORG//INVEST/ORG">
                    <li>
                        <div class="ft-cc-group-inner">
                            <div class="ft-cc-info"><xsl:value-of select="ORG"/></div>
                            <div class="ft-cc-enters"><xsl:value-of select="CNT"/></div>
                        </div>
                    </li>
                </xsl:for-each>
            </ul>
            </xsl:if>
            <xsl:if test="count(//ANLYS_USE_TOP_ORG//INVEST/ORG) = 0">
            <div class="emptyRange ft-cc-group invest" >
                <img src="/portal_static/img/icons/empty_dashboard.png" alt=""/>
                <p>В данном диапазоне данных нет, выберите другой</p>
            </div>
            </xsl:if>
            <xsl:if test="count(//ANLYS_USE_TOP_ORG//OIV/ORG) = 0">
            <div class="emptyRange ft-cc-group oiv" >
                <img src="/portal_static/img/icons/empty_dashboard.png" alt=""/>
                <p>В данном диапазоне данных нет, выберите другой</p>
            </div>
            </xsl:if>
        <script>
            (function($) {
                $(document).on('click', '.tabSelector', function(){
                    $(this).parents('.show').find('.ft-cc-group').hide();
                    $(this).parents('.show').find('.'+$(this).attr('data-target')).show();
                    $(this).parents('.tabWrapper').find('.active').removeClass('active');
                    $(this).addClass('active');
                });
                $('.tabSelector').eq(0).click();
            })(jQuery);
        </script>
        </div>
        <XML>
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>
