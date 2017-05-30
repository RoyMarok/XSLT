<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8"/>

    <xsl:template match="/">

     {B{CARD$BODY_STYLE}E}

      <style>
        .newWindowData {
          cursor: pointer;
        }
        .tableCardStyle td:first-child{
          padding-left: 40px;
          position: relative;
        }
        .expander {
          display: inline-block;
          width: 30px;
          height: 30px;
          position: absolute;
          left: 10px;
          top: 0px;
          background-image: url(/portal_static/img/ps/toggle_plus.gif);
          background-position: left;
          background-repeat: no-repeat;
          cursor: pointer;
        }
        .expander.expand {
          background-image: url(/portal_static/img/ps/toggle_minus.gif);
        }
      </style>
<style>
#tabsContentArea{
    padding: 0;
    /*margin-top: -16px;*/
    font-family: 'PTSans', Arial, sans-serif;
}
.tableCardStyle th:first-child,
.tableCardStyle th:last-child
{
    width: 3%;
}
.tableCardStyle th:nth-child(2){
    width: 6%;
}
.tableCardStyle th:nth-child(3){
    width: 32%;
}
.tableCardStyle th:nth-child(4){
    width: 10%;
}
.tableCardStyle th:nth-child(5){
    width: 14%;
}
.tableCardStyle th:nth-child(6){
    width: 30%;
}
.tableCardStyle th:nth-child(7){
    width: 2%;
}
.tableCardStyle th{
    text-align: left;
    font-size: 12px;
    color: #58666E;
    background-color: #F9FAFB;
    border: none;
    padding: 10px 0;
    padding-right: 10px;
    border-top: 1px solid white;
}
.tableCardStyle td{
    border: none;
    border-top: 1px solid transparent;
    border-bottom: 1px solid #F0F0F0;
    padding-left: 0;
    padding-top: 16px;
    padding-bottom: 20px;
    font-size: 14px;
    background-color: white;
    padding-right: 10px;
}
.tableCardStyle tr:last-child td{
    border-bottom: 1px solid transparent;
}
.tableCardStyle td:nth-child(7){
    padding-right: 0;
}

.tableCardStyle td:first-child,
.tableCardStyle td:last-child
{
    border-top: 1px solid transparent;
    border-bottom: 1px solid transparent;
}
.tableCardStyle tr:hover td{
    background-color: #F8F8F8;
    border-color: #F0F0F0;
}
.autoValue{
    color: #A1A1A1;
}
.informer .rDrop{
    cursor: pointer;
    width: 21px;
    height: 16px;
    background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHbSURBVDhPjZOtbxtBEMXv1gcC/AlqF5pUCgiwpRRUcqUGREl5/4BWqpSwkkYqqFRQ2EiVVQcE9Q8oaEBAWUlAQECAQVgNDGzJkj/BSTnb/b29tXXnFuRJq51582ZnbnfO9zYwm80eR1H02hhzgFsVt1wuu77vX8/n87NSqdQRt0LqgNFo9AHhJ9aWo1LgoIhYK5fLnbBH4tYHTKfTHwheOdcCf4Cwi1mLmRjwV/l8fp9YaESocjJZgsVi8aRQKDxCWKf1EvRpHKWq7zf41K/W1jcj+ANp21ZyGIYvK5XKTH4Sk8nkC9v72PM88upGF7ZKdhiUy+Ww3+9nSfg+Ho9/qogCdHVuFQ5BEBz5iH5jv4ipGHTR1vdh7mKHrOfFYvGGPeCu7mOVRUd3YJ8qCZJ32JTc5jmfKlk83bzVnkBVBwSxnQbJUSaT2efJ2q7yZw7+5sJrGIKpwVgB8U02m+3JprJe6SPcZrGukdA5m9jW/Wiheee4FOCvDU/RVLuOS+KWGdjTQnjpuBTIaxrNNoKW4x4Mki84/MqOMk7gWm3YKIDr4f9yrp55/VrE7piJZxQfrf8FyC2NJ/uxo/4L4hckv1Gy/H9+5+FwWNOEITzEXVW1vzNcU207DnjeX6cQ9+0mI+fkAAAAAElFTkSuQmCC') center center no-repeat;

}
.informer .rDrop:hover, .informer.showed .rDrop{
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAIWSURBVDhPjVIxaBRREJ35+xNTiJeAAUGFNHYpEtBCSGGKYOxSBEEwJAeCCha5Q+UwB8vCJYVKlmBSpErh2aiFhYXdNSlSBLSwsFPQk4ApjFiE7N8dZ/7++9kVCx/c7Z83f2bezHyEvxA+3jpjtF5AwKtsjuQsfAPEnQDURlS78cVxFqUES6vPG3wxZHLAUSUQkEHC9eDg7IMomjTC+QRLcfsVG7POtOCAfSRbfcxROQi2g4NkKoqqh0psqVwK5gsmyy4s1+aGW/W58QCSIa711Hml7EQ6qGN7tD339X32siV7f/+16N7139YuoBm/eMIX7jsTMoBxnQ/suGcC2Icfw4fh+suT2VHyLAMa1Ca5Gz2s7pks3dRK+QQK6LZy0/ZAhJm00n2fJkcdQlpgudOJVufEd+LX+dIGgHBaZtBb1TEQRvn/Isv5mGF2aaU+vyt0Uunekq8HwohmydqvogBZmTZmqsXSw7Cj06HvIVHWkKgiuAUoy3Lg1nalbzmbU18bQNRkTlunA/GKsbnajvn2ouM82PmTk3+wZ6RRDj5tHQWw+tcqwGBN5DrOQ4Jb9ZuT8lOk3jq6DEzXlLxteZ6O+m+wwjfLi/PbdiJ2SJVuh8tOWC+D5e0pwnf5ma6wr7At+hSAuRzVqtJmjjDcGsifJ95x1D8hlTUmVQkW2yfo4VHcHpMXJo+kV1Wmzecd6Vlk24sWAH8A6rrJN/fq9esAAAAASUVORK5CYII=');
}
.tableListHeader{
    padding: 10px 0;
}
.informer{
    display: inline-block;
    vertical-align: bottom;
    /*margin-left: 5px;*/
}
.rDropTarget{
    background-color: black;
    color: white;
    opacity: .8;
    border-radius: 3px;
    padding: 20px;
}
.rDropTarget .arrow:after{
    border-color: black transparent;
}
.tableCardStyle tr .pen{
    background: none;
    width: 23px;
    height: 23px;
}
.tableCardStyle tr:hover .pen{
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAXCAYAAADgKtSgAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAgxJREFUeNq0lTtLA0EQgGc2Giz8ARYWlpYWERRsLO0stBDNw8JO0EQjGgOJkEQQ85BYCsGcYKFgaRmLFAqWFiktLSwtlOR2nD1z56lnvDvwIOSyZL+d+XZ2FokI/usR8I9Pn59JiGh8p0qnIcTABv96DrTb+b2t5Sc1btpAP1oUfLdyOgVSXPP74McotQLtzrRawGT61kI6jn2CjSVH9f6+RuagNmQ5V1F4+aSP6lOpYn21sBE5lkDxbznxAv01XxtqqhBCVFNlbb0QD1ck0QoBdayMAMY8w9Pl+mzX8QMTmgKwvFvWsoVE+AQJFswFWPeelYcrcEmbI4RzJLzlSJMo8IonDnVDreQSS3H1H4kwrLKxqsULmEjmWfzF1400MIe5+GLSUuOmWtyADR0k7zyd0HRRW3IDVr5zifCla7iqBC5SrSeY6AWB5n8DOzpXYFUJbO0JCMMA8soJDELO5NejTccD5rShJrjnyfwD7LihFphrWJI+bkTuA/zDeaqoTXTBN4FgcKaQiN5LHaftC9jBmUxtwN5DesJRwEBX0m2n/RZSr/ubiy12tmMH59YiTZVyNht7zSZjRvfr1VW/V8s2t6eG2Ud4YlVFLwVNulXx52WRLp01SFKIS/BF6dnfjLR830Qk4ZW76aNtfIQzeNR1nFd6/PZ89HRB/OLXvPY89Rb7kznShr1G/i7AAGUYLV7hGT72AAAAAElFTkSuQmCC');
    background-repeat: no-repeat;
}

.tableCardStyle td span {
	padding: initial;
}
.tableCardStyle td span.autoValue {
	padding-right: 5px;
}
/* Tooltip UGDIII-1041 */
.tooltip {
  display: inline-block;
  background: #7C8FA4;
  color: #fff;
  cursor: help;
  width: 17px;
  height: 17px;
  border-radius: 50%;
  position: relative;
  text-align: center;
  transition: opacity .3s;
  -webkit-transform: translateZ(0); 
  -webkit-font-smoothing: antialiased;
  opacity: .6;
}
.tooltip:hover {
  opacity: 1;
}
.tooltip::before {
  content: '?';
  font-size: 14px;
  font-weight: bold;
}
.tooltip__content {
  background: #fff;
  bottom: 100%;
  color: #333;
  display: block;
  right: -20px;
  margin-bottom: 10px;
  opacity: 0;
  pointer-events: none;
  position: absolute;
  width: auto;
  border: 1px solid #c4d0db;
  -webkit-transform: translateY(10px);
     -moz-transform: translateY(10px);
      -ms-transform: translateY(10px);
       -o-transform: translateY(10px);
          transform: translateY(10px);
  -webkit-transition: all .25s ease-out;
     -moz-transition: all .25s ease-out;
      -ms-transition: all .25s ease-out;
       -o-transition: all .25s ease-out;
          transition: all .25s ease-out;
  -webkit-box-shadow: 0px 5px 25px rgba(202, 211, 220, 1);
     -moz-box-shadow: 0px 5px 25px rgba(202, 211, 220, 1);
      -ms-box-shadow: 0px 5px 25px rgba(202, 211, 220, 1);
       -o-box-shadow: 0px 5px 25px rgba(202, 211, 220, 1);
          box-shadow: 0px 5px 25px rgba(202, 211, 220, 1);
}
.tooltip__content:before,
.tooltip__content:after {
  content: '';
  display: block;  
  position: absolute;
  top:100%;
  width: 0;
  height: 0;
  border-style: solid;
  border-color: transparent;
}
.tooltip__content:before {
  right: 20px;
  border-width: 8px;
  border-top-color: #c4d0db;
}  

.tooltip__content:after {
  right: 21px;
  border-width: 7px;
  border-top-color: #fff;
}
  
.tooltip:hover .tooltip__content {
  opacity: 1;
  pointer-events: auto;
  -webkit-transform: translateY(0px);
     -moz-transform: translateY(0px);
      -ms-transform: translateY(0px);
       -o-transform: translateY(0px);
          transform: translateY(0px);
}
.tooltip__content table tr td {
    padding: 10px 25px 10px 25px!important;
    margin: 0px;
}
.tooltip__content table tr td div {
  margin-bottom: 5px;
}
.MJXc-display {
  margin: 0;
}
.MathJax_Display {
  margin: 0;
}
/* TODO: Добавить селекторы-модификаторы .tooltip--position для разных положений тултипа */

</style>

      <table class="tableCardStyle" style="width:100%;">
        <tr>
            <th></th>
            <th>Атрибут</th>
            <th></th>
            <th>Значение</th>
            <th>Примечание</th>
            <th>Основание</th>
            <th></th>
            <th></th>

        </tr>

        <xsl:for-each select="//ROW[MAIN_FLAG = 'Д' or not(MAIN_FLAG)]">
        <xsl:variable name="attrId" select="ATTR_ID"/>
        <tr>
            <td></td>
            <td class="tepNumber"><xsl:value-of select="ATTR_NAME"/></td>
            <td class="tepName">
              <xsl:if test="count(../ROW[ATTR_ID = $attrId]) &gt; 1">
                <span class="expander">
                  <xsl:attribute name="attrId">
                    <xsl:value-of select="ATTR_ID"/>
                  </xsl:attribute>
                </span>
              </xsl:if>
              <xsl:value-of select="ATTR_NAME"/>
            </td>

            <td>
                <xsl:choose>
                    <xsl:when test="CALCULATED_VALUE != '' ">
                        <xsl:value-of select="CALCULATED_VALUE"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="AUTO_VALUE != ''"><span class="autoValue"><xsl:value-of select="number(AUTO_VALUE)"/></span></xsl:if>
                    </xsl:otherwise>
                </xsl:choose>

            </td>
            <td><xsl:value-of select="NOTE"/></td>
            <td>
                <xsl:choose>


                    <xsl:when test="CALCULATED_VALUE != ''">
                        <div>
                            <xsl:value-of select="DOC_DATA"/>
                            <xsl:value-of select="DOC_TYPE"/>
                        </div>
                        <div>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=</xsl:text>
                                <xsl:value-of select="DOC_KEY"/>
                            </xsl:attribute>
                            <xsl:value-of select="DOC_NUMBER"/>
                        </a>
                        <xsl:choose>
                            <xsl:when test="DOC_DATE != ''">
                                <xsl:text> от </xsl:text>
                                <xsl:value-of select="DOC_DATE"/>
                            </xsl:when>
                        </xsl:choose>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:if test="AUTO_VALUE != ''">
                        <span class="autoValue">Значение расчитано автоматически</span>
                        <xsl:if test="FORMULA_AUTO_VALUE">
                          

            	             <div class="tooltip">
            								<div class="tooltip__content">            									
                              <table>
                                <tr>
                                  <td>Шифры</td><td>Значение</td><td>Формула расчета</td>
                                </tr>
                                <xsl:for-each select="FORMULA_AUTO_VALUE/FORMULA_AUTO_VALUE">
                                  <tr>
                                    <td>
                                      <xsl:for-each select="ATTRS/ATTR"> 
                                        <div> <xsl:value-of select="NAME"/> </div>
                                      </xsl:for-each>
                                    </td>                                    
                                    <td>
                                      <xsl:for-each select="ATTRS/ATTR"> 
                                        <div> <xsl:value-of select="VAL"/> </div>
                                      </xsl:for-each>
                                    </td>
                                    <td> \[ <xsl:value-of select="FORMULA"/> \] </td>
                                  </tr>
                                </xsl:for-each>
                              </table>
            									
                              
                              

            								</div>
            							</div>
                       	</xsl:if>

                      </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>

            </td>
            <td>
                <!--img src="/portal_static/img/icons/pensil.png" class="newWindowData" widthwin="1000" heightwin="700"-->
                <a target="_blank" class="newWindowData" widthwin="1000" heightwin="700">
                    <xsl:attribute name="link">
                        <xsl:text>/ugd/getCardHtml.action?cardId=CARD$REESTRS$GBU_CORRECT_TEP&amp;TEP_NAME=</xsl:text>
                        <xsl:value-of select="URL_ATTR_NAME"/>
                        <xsl:text>&amp;documentId=</xsl:text>
                        <xsl:value-of select="CURRENT_DOC_KEY"/>
                        <xsl:if test="DOC_TYPE_ID != ''">
                            <xsl:text>&amp;DOC_TYPE_ID=</xsl:text>
                            <xsl:value-of select="DOC_TYPE_ID"/>
                        </xsl:if>
                        <xsl:if test="DOC_KEY != ''">
                            <xsl:text>&amp;DOC_KEY=</xsl:text>
                            <xsl:value-of select="DOC_KEY"/>
                        </xsl:if>
                        <xsl:if test="DOC_NUMBER != ''">
                            <xsl:text>&amp;DOC_NUMBER=</xsl:text>
                            <xsl:value-of select="DOC_NUMBER"/>
                        </xsl:if>
                        <xsl:text>&amp;TEPVAL=</xsl:text>
                        <xsl:value-of select="URL_STRING_VALUE"/>
                        <xsl:text>#tab_3</xsl:text>
                    </xsl:attribute>
                    <div class="pen"></div>
                </a>
            </td>
            <td></td>
          </tr>


          <xsl:if test="MAIN_FLAG = 'Д'">
            <xsl:for-each select="../ROW[ATTR_ID = $attrId and MAIN_FLAG = 'Н']">
              <tr>
                <xsl:attribute name="class">
                  <xsl:text>hidden child-</xsl:text>
                  <xsl:value-of select="$attrId"/>
                </xsl:attribute>
                <td><xsl:value-of select="ATTR_NAME"/></td>
                <td><xsl:value-of select="CALCULATED_VALUE"/></td>
        <td style="width: 5%"><xsl:value-of select="AUTO_VALUE"/></td>
                <td><xsl:value-of select="NOTE"/></td>
                <td>
                  <div>
                    <xsl:value-of select="DOC_DATA"/>
                    <xsl:value-of select="DOC_TYPE"/>
                  </div>
                  <div>
                    <a>
                      <xsl:attribute name="href">
                        <xsl:text>getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=</xsl:text>
                        <xsl:value-of select="DOC_KEY"/>
                      </xsl:attribute>
                      <xsl:value-of select="DOC_NUMBER"/>
                    </a>
                    <xsl:choose>
                        <xsl:when test="DOC_DATE != ''">
                          <xsl:text> от </xsl:text>
                          <xsl:value-of select="DOC_DATE"/>
                        </xsl:when>
                       </xsl:choose>
                  </div>
                </td>
                <td>
                  <!--img src="/portal_static/img/icons/pensil.png" class="newWindowData" widthwin="1000" heightwin="700">
                    <xsl:attribute name="link">
                      <xsl:text>/ugd/getCardHtml.action?cardId=RS$GBU_DOC_NORM$FRM&amp;TEP_NAME=</xsl:text>
                      <xsl:value-of select="ATTR_NAME"/>
                      <xsl:text>&amp;DOC_TYPE_ID=</xsl:text>
                      <xsl:choose>
                        <xsl:when test="DOC_TYPE_ID != ''">
                          <xsl:value-of select="DOC_TYPE_ID"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>A6B4E4B805CD4498992FCD42175BCA4E</xsl:text>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:text>&amp;documentId=</xsl:text>
                      <xsl:value-of select="'9CE3FD9488DB3387256EE58BFAF1BD78'"/>
                      <xsl:text>&amp;DOC_KEY=</xsl:text>
                      <xsl:value-of select="DOC_KEY"/>
                      <xsl:text>&amp;OBJECT_ID=</xsl:text>
                      <xsl:value-of select="OBJECT_ID"/>
                      <xsl:text>&amp;DOC_DATE=</xsl:text>
                      <xsl:value-of select="DOC_DATE"/>
                      <xsl:text>&amp;DOC_TYPE=</xsl:text>
                      <xsl:value-of select="DOC_TYPE"/>
                      <xsl:text>&amp;DOC_NUMBER=</xsl:text>
                      <xsl:value-of select="DOC_NUMBER"/>
                      <xsl:text>&amp;TEPVAL=</xsl:text>
                      <xsl:value-of select="STRING_VALUE"/>
                      <xsl:text>#tab_3</xsl:text>

                    </xsl:attribute>
                  </img-->
                </td>
              </tr>
            </xsl:for-each>
          </xsl:if>
        </xsl:for-each>
      </table>

       <script type="text/x-mathjax-config">
		 MathJax.Hub.Config({
		    CommonHTML : {
		        availableFonts : ["TeX", "Latin-Modern",  "STIX-Web", "Asana-Math", "Neo-Euler", "Gyre-Pagella"],
		        preferredFont : "Asana-Math",
		        webFont : "Asana-Math",
		        imageFont : null
		    }
		});
		</script>

    <!-- <script src="https://ugd-test.mos.ru/static/mathjax/MathJax.js" /> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-MML-AM_CHTML" />

      <script type="text/javascript">
        $(function(){
          $('.expander').click(function(e){
            var id = e.target.getAttribute('attrid');
            $('.child-'+id).toggleClass('hidden');
            $(this).toggleClass('expand');
          });
        $('.tepName').each(function(indx, elm){
            $(elm).text($(elm).text().replace(/.*\.\s/, ''));
        });
        $('.tepNumber').each(function(indx, elm){
            $(elm).text($(elm).text().replace(/\.\s.*/, ''));
        });


        })
      </script>
        <xml style="display: none">
            <xsl:copy-of select="/"/>
        </xml>

    </xsl:template>
</xsl:stylesheet>