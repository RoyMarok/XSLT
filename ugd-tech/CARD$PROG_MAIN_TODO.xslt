<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">

      <xsl:variable name="PROG" select="//PROG_MAIN_TODO/XMLDOC/MENU" />
      <div class="filterBlock"><div class="filterLabel">Показаны:</div><div class="tagLine"></div><div class="filterButton blueButton" data-fancybox="" data-src="#modalFilter">Поиск по мероприятиям</div></div>
      <xsl:apply-templates select="//PROG_MAIN_TODO/XMLDOC" />

      <script>
      <xsl:text disable-output-escaping="yes">
      <![CDATA[

        $(function(){
          colors();

        });

        function colors() {
          var today = new Date(),
              todayUnix = Date.parse(today);

          $('.pd-item').each(function(){
            var $this = $(this),
                status = $this.data('statusnick'),
                date = $this.data('dateend'),
                dateUnix = Date.parse(date);

            switch (status) {
              case 'PROJECT': $this.addClass('pd-item-blue'); break;
              case 'IN_PROGRESS': $this.addClass((todayUnix <= dateUnix) ? 'pd-item-blue' : 'pd-item-red'); break;
              case 'READY': $this.addClass('pd-item-green'); break;
              default: $this.addClass('pd-item-defaultColor');
            }

          });
        }
        ]]>
        </xsl:text>
      </script>
      <xml style="display: none">
        <xsl:copy-of select="*"/>
      </xml>

    </xsl:template>

    {B{CARD$TEMPLATE}E}

    <xsl:template match="MENU">
            <xsl:apply-templates select="SECTION" />
    </xsl:template>

    <xsl:template match="SECTION">
        <div class="pd-section">
          <xsl:if test="IS_PROG_TODO = 1">
            <xsl:attribute name="class">
              <xsl:text>pd-item</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="data-dateEnd">
              <xsl:value-of select="ACTUAL_END"/>
            </xsl:attribute>
            <xsl:attribute name="data-statusNick">
              <xsl:value-of select="STATUS_NICK"/>
            </xsl:attribute>
          </xsl:if>

            <xsl:choose>
              <xsl:when test="IS_PROG_TODO = 0">
              <h2 data-count="{count(SECTION)}" class="pd-heading pd-heading-collapsed">
                <xsl:value-of select="NAME"/>
              </h2>
              <div class="pd-items pd-hidden">
                <xsl:apply-templates select="SECTION" />
              </div>
              </xsl:when>
              <xsl:otherwise>
                  <div class="pd-item-head">
                    <div class="pd-item-num">
                      <xsl:value-of select="NUM"/>
                    </div>
                    <div class="pd-item-name">
                      <xsl:value-of select="NAME"  disable-output-escaping="yes"/>
                    </div>
                  </div>
                  <div class="pd-item-body">
                    <xsl:if test="ACTUAL_END">
                      <div class="pd-actual-end">
                        <xsl:call-template name="date_transform">
                          <xsl:with-param name="old_date" select="ACTUAL_END"/>
                        </xsl:call-template>
                      </div>
                    </xsl:if>
                    <ul class="pd-item-peoples">
                      <xsl:if test="VICE_FIO">
                        <li><xsl:value-of select="VICE_FIO" /></li>
                      </xsl:if>
                      <xsl:if test="DEPARTMENT_CHIEF_FIO">
                        <li class="pd-item-chief"><xsl:value-of select="DEPARTMENT_CHIEF_FIO" /></li>
                      </xsl:if>
                      <xsl:if test="EXECUTOR_FIO">
                        <li>
                          <xsl:value-of select="EXECUTOR_FIO" />
                          <xsl:for-each select="COWORKINGS/COWORKING">
                               <br /><xsl:value-of select="text()" />
                          </xsl:for-each>
                        </li>
                      </xsl:if>
                    </ul>
                    <div class="pd-item-period"><xsl:value-of select="EXEC_PERIOD_NAME" /></div>
                    <ul class="pd-item-comments">
                    <xsl:for-each select="COMMENTS/COMMENT">
                      <li>
                        <a class="pd-get-modal" href="/ugd/getCardHtml.action?cardId=CARD$PROG_TODO_INDICATORS&amp;documentId={ID}">
                          <xsl:value-of select="VALUE" />
                        </a>
                      </li>
                    </xsl:for-each>
                    </ul>
                  </div>
              </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>

</xsl:stylesheet>
