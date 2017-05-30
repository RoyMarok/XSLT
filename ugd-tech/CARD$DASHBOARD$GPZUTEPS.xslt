<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        {B{CARD$DASHBOARD$GPZUTEPS_Style}E}

        <script type="text/template" id="loaderTemplate"><xsl:call-template name="loader"></xsl:call-template></script>

        <div class="dashboard">
            <h1>Технико-экономические показатели ГПЗУ</h1>


        <form class="date_form">
            <div class="filterBar">
                <input type="hidden" class="filterVal" name="FDATE_BEGIN" value="{//PARAMETER_MAP//FDATE_BEGIN}"/>
                <input type="hidden" class="filterVal" name="FDATE_END" value="{//PARAMETER_MAP//FDATE_END}"/>
                <div class="calendar filterItem" id="filterDateRange">
                    <div class="date_view"><xsl:value-of select="//PARAMETER_MAP//FDATE_BEGIN"/> - <xsl:value-of select="//PARAMETER_MAP//FDATE_END"/></div>
                    <div class="minimal2calendars">
                        <div class="pickerwrap">
                            <div class="pikers_one"></div>
                            <div class="pikers_two"></div>
                        </div>
                        <input type="button" value="Применить" class="bigBigButton"/>
                    </div>
                </div>
                <div class="filterItem fieldTrigger" id="filterReportType">
                    <label><input type="radio" name="REPORT_TYPE" value="VRI" data-color="#319ADC"/> ВРИ</label>
                    <label><input type="radio" name="REPORT_TYPE" value="FNO" data-color="#597BA8"/> ФНО</label>
                </div>
                <div class="filterItem line superSelect" id="filterPermUse" data-name="FSD_CODE" style="width: 350px;">
                    <span class="inputWrap">
                        <span class="gradWrapper" directory_id="SD_KOD_BUILD">
                            <span class="folderIco" title="Выбрать из справочника"></span>
                            <input class="3CA7648B543C4427A3E7331A7B6F4E93" type="text" value="Вид разрешённого использования"/>
                            <input type="hidden" class="hiddenValues directoryValues"/>
                            <input type="hidden" name="FSD_CODE" itemvalue="3CA7648B543C4427A3E7331A7B6F4E93" ord="id"/>
                        </span>
                    </span>
                </div>
                <div class="filterItem line superSelect" id="filterforBuilding" data-name="FFNO" style="width: 350px;">
                    <span class="inputWrap">
                        <span class="gradWrapper" id="FAEFE0AD8287490FB306FC8ACA1BA0AA" directory_id="FNO_306_PP">
                            <span class="folderIco" title="Выбрать из справочника"></span>
                            <input class="FAEFE0AD8287490FB306FC8ACA1BA0AA" type="text" value="Функциональное назначение объекта"/>
                            <input type="hidden" name="FFNO" itemvalue="FAEFE0AD8287490FB306FC8ACA1BA0AA" ord="id"/>
                            <input type="hidden" name="FAEFE0AD8287490FB306FC8ACA1BA0AA" class="hiddenValues directoryValues" value=""/>
                        </span>
                    </span>
                </div>
            </div>
        </form>

            <div class="dashObjects dashSection">
                <div class="chart">
                    <div class="chartCaption">Застройка земельного участка</div>
                    <div class="ajaxNeed paddingBlock" data-xslt="CARD$DASHBOARD$GPZUTEPS$AREA_BUILDINGS"></div>
                </div>
                <div class="chart">
                    <div class="chartCaption">Реализация ГПЗУ по решениям ГЗК</div>
                    <div class="ajaxNeed paddingBlock" data-xslt="CARD$DASHBOARD$GPZUTEPS$GPZU_ON_GZK"></div>
                </div>
                <div class="chart">
                    <div class="chartCaption">Площадь</div>
                    <div class="ajaxNeed paddingBlock" data-xslt="CARD$DASHBOARD$GPZUTEPS$QUANTITY_ANALYSIS"></div>
                </div>
                <div class="chart">
                    <div class="chartCaption">Количество действующих и выпущенных ГПЗУ</div>
                    <div class="ajaxNeed" data-xslt="CARD$DASHBOARD$GPZUTEPS$COUNT" style="padding-top: 20px;"></div>
                </div>
                <div class="chart">
                    <div class="chartCaption">Площади объектов по действующим и выпущенным ГПЗУ</div>
                    <div class="ajaxNeed" data-xslt="CARD$DASHBOARD$GPZUTEPS$SQUARE" style="padding-top: 20px;"></div>
                </div>
            </div>
        </div>

        {B{CARD$DASHBOARD$GPZUTEPS_Script}E}

        <XML style="display: none;">
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
    <xsl:template name="loader">
        <div class="preloader">
            <svg viewBox="0 0 120 120" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">

            <symbol id="s--circle">
                <circle r="10" cx="20" cy="20"></circle>
            </symbol>

            <g class="g-circles g-circles--v1">
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
                <g class="g--circle">
                    <use xlink:href="#s--circle" class="u--circle"/>
                </g>
            </g>
            </svg>
        </div>
    </xsl:template>
</xsl:stylesheet>
