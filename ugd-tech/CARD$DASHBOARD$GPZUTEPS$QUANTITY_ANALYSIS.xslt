<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="utf-8" indent="no"/>
<xsl:template match="/">

    <style>
        #QUANTITY_ANALYSIS .chartTabs {
            display: inline-block;
            list-style-type: none;
            white-space: nowrap;
            vertical-align: middle;
        }
        #QUANTITY_ANALYSIS .chartTabs li {
            display: inline-block;
            padding: 0 10px;
            margin: 0 10px;
        }
        #QUANTITY_ANALYSIS .chartTabs li.active {
            background: #EDF1F2;
            border-radius: 3px;
        }
        #QUANTITY_ANALYSIS .chartTabs li a {
            color: #000;
            text-decoration: none;
        }
        #QUANTITY_ANALYSIS .chartItem {
            display: inline-block;
            /*width: 50%;*/
            padding: 0 20px 0 70px;
            position: relative;
            margin: 10px 0;
            min-height: 56px;
            vertical-align: top;
            text-decoration: none;
        }
        #QUANTITY_ANALYSIS .chartItem:before {
            content: '';
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            width: 56px;
            height: 56px;
            background-color: #EEF2F4;
            background-repeat: no-repeat;
            background-position: center center;
            border-radius: 100%;
        }
        #QUANTITY_ANALYSIS .chartItem.iconGpzu:before {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAhCAMAAACcLxmXAAAAdVBMVEUAAAAAAAD///8AAAAgdLoFAAACAgIhdbsfcbb3+v35+fkmeLy+1uswfr/j7vfa6PSdweFqotE0gcH5/P3y9/uItdpZmMxDisU9hsHt9Pn39/fP4fDN4PCzz+eqyuWixeKVvd6OuNxclsiJqcRDfa4REREODg42D5DxAAAAAnRSTlMAZtJCCVUAAADKSURBVDjLxdPnDoIwFIZh+7VQKxtkuLf3f4nWYkgqpKf+IL4hjOTJaUhh8d9YyN09WQ85qB6+MJwRciuY9NU8WTAQfZHIsQpgNQ1z5QXLA5BeA3tpPoZlCmTlkpxYbIBjIigY1RXURXsNXW8dxYBqpBDExPsOQJUnJASwVkDWydHS/AumbaO0riUxMdarthmAuHPCmzQbs39Lny1MTvDbayHPioCDLAzkVpNQFAaaQ5+oD3e4p36FYaLJAX+fCN2We0J8IONUbDFDLyfaDk3EBgCOAAAAAElFTkSuQmCC');
        }
        #QUANTITY_ANALYSIS .chartItem.iconArea:before {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkBAMAAAATLoWrAAAAElBMVEUAAAAwMDD///8wMDAlgc61tbXigKdZAAAAAnRSTlMAxZ2d+wcAAABWSURBVCjPYxgUgNEYAgQQQsxKEGBAQMjYGIhQhUycgQi/EEIj3GqE8XAGFiGERjgDYTyMgSmEVeOgtdEYAzAYKaFBZexCEACjlRBCSniFgtEtNGXABAChRESaNjXH3QAAAABJRU5ErkJggg==');
        }
        #QUANTITY_ANALYSIS .bigLabel {
            font-size: 30px;
            color: #000;
            white-space: nowrap;
        }
        #QUANTITY_ANALYSIS .subLabel {
            color: #8C9CAF;
        }
        @media screen and (min-width: 1000px) and (max-width: 1300px) {
            #QUANTITY_ANALYSIS .bigLabel {
                font-size: 24px;
            }
        }
    </style>

    <div id="QUANTITY_ANALYSIS">
        <xsl:call-template name="tabBody">
            <xsl:with-param name="gpzu1" select="//DB_GPZUTEPS_QUAN_ANALYSIS/ROW_SET/ROW[NICK='active']/CNT"/>
            <xsl:with-param name="gpzu1_link" select="//DB_GPZUTEPS_QUAN_ANALYSIS/ROW_SET/ROW[NICK='active']/LNK_CNT"/>
            <xsl:with-param name="area1" select="//DB_GPZUTEPS_QUAN_ANALYSIS/ROW_SET/ROW[NICK='active']/SUM"/>
            <xsl:with-param name="area1_link" select="//DB_GPZUTEPS_QUAN_ANALYSIS/ROW_SET/ROW[NICK='active']/LNK_SUM"/>
            <xsl:with-param name="gpzu2" select="//DB_GPZUTEPS_QUAN_ANALYSIS/ROW_SET/ROW[NICK='notactive']/CNT"/>
            <xsl:with-param name="gpzu2_link" select="//DB_GPZUTEPS_QUAN_ANALYSIS/ROW_SET/ROW[NICK='notactive']/LNK_CNT"/>
            <xsl:with-param name="area2" select="//DB_GPZUTEPS_QUAN_ANALYSIS/ROW_SET/ROW[NICK='notactive']/SUM"/>
            <xsl:with-param name="area2_link" select="//DB_GPZUTEPS_QUAN_ANALYSIS/ROW_SET/ROW[NICK='notactive']/LNK_SUM"/>
        </xsl:call-template>
    </div>

<XML style="display: none;" class="QUANTITY_ANALYSIS"><xsl:copy-of select="."/></XML>
</xsl:template>
<xsl:template name="tabBody">
    <xsl:param name="gpzu1">0</xsl:param>
    <xsl:param name="gpzu1_link"></xsl:param>
    <xsl:param name="area1">0</xsl:param>
    <xsl:param name="area1_link"></xsl:param>
    <xsl:param name="gpzu2">0</xsl:param>
    <xsl:param name="gpzu2_link"></xsl:param>
    <xsl:param name="area2">0</xsl:param>
    <xsl:param name="area2_link"></xsl:param>

    <div class="chartCaption">Действующих</div>
    <a class="chartItem iconGpzu" href="{$gpzu1_link}" target="_blank">
        <div class="subLabel">Количество ГПЗУ</div>
        <div class="bigLabel"><xsl:value-of select="$gpzu1"/></div>
    </a>
    <a class="chartItem iconArea" href="{$area1_link}" target="_blank">
        <div class="subLabel">Площадь</div>
        <div class="bigLabel"><xsl:value-of select="$area1"/> м<sup>2</sup></div>
    </a>

    <div class="chartCaption">Отмененных</div>
    <a class="chartItem iconGpzu" href="{$gpzu2_link}" target="_blank">
        <div class="subLabel">Количество ГПЗУ</div>
        <div class="bigLabel"><xsl:value-of select="$gpzu2"/></div>
    </a>
    <a class="chartItem iconArea" href="{$area2_link}" target="_blank">
        <div class="subLabel">Площадь</div>
        <div class="bigLabel"><xsl:value-of select="$area2"/> м<sup>2</sup></div>
    </a>
</xsl:template>
</xsl:stylesheet>
