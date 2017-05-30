<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output method="xml" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <div class="listLimited">
        <xsl:for-each select="//ROOT//CC_APPEAL_SRCH_KB_ARTICL//ARTICLE">
            <div class="issue by_type listLimited_element">
                <!--div class="title"><xsl:value-of select="NAME"/></div-->
                <div class="content"><a href="" data-link="{LNK}" target="_blank"><xsl:value-of select="NAME"/></a><div class="theme"><xsl:value-of select="ARTICLE_HEAD"/></div></div>
                <xsl:if test="count(TAGS//TAG) &gt; 1">
                <div class="tagLine">
                    <xsl:for-each select="TAGS//TAG">
                        <!--a style="background-color: #{NORMAL_COLOUR_BG}; color: #{NORMAL_COLOUR_FONT}" href="" data-link="{LNK}" onmouseenter="this.style.backgroundColor = '#{HOVER_COLOUR_BG}'; this.style.color = '#{HOVER_COLOUR_FONT}'" onmouseleave="this.style.backgroundColor = '#{NORMAL_COLOUR_BG}'; this.style.color = '#{NORMAL_COLOUR_FONT}'" target="_blank" class="tag">
                            <xsl:value-of select="NAME"/>
                        </a-->
                        <a href="" data-link="{LNK}" target="_blank" class="tag">
                            <xsl:value-of select="NAME"/>
                        </a>
                    </xsl:for-each>
                </div>
                </xsl:if>
            </div>
        </xsl:for-each>
        <!--xsl:if test="count(//ROOT//CC_APPEAL_KB_ARTICL_BY_TYPE//ARTICLE) &lt; 1">
            <xsl:for-each select="//ROOT//CC_APPEAL_KB_ARTICL_BY_TEGS//ARTICLE">
                <div class="issue by_teg listLimited_element">
                 <div class="content"><a href="" data-link="{LNK}" target="_blank"><xsl:value-of select="NAME"/></a><div class="theme"><xsl:value-of select="ARTICLE_HEAD"/></div></div>
                <xsl:if test="count(TAGS//TAG) &gt; 1">
                <div class="tagLine">
                        <xsl:for-each select="TAGS//TAG">

                        <a href="" data-link="{LNK}" target="_blank" class="tag">
                            <xsl:value-of select="NAME"/>
                        </a>
                    </xsl:for-each>
                </div>
                </xsl:if>
            </div>
            </xsl:for-each>
        </xsl:if-->
        </div>
        <xml style="display: none">
          <xsl:copy-of select="/"/>
        </xml>

    </xsl:template>
</xsl:stylesheet>
