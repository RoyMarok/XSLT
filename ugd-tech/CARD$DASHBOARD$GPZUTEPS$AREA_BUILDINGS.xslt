<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="no"/>
<xsl:template match="/">
    <style type="text/css">
        #CHART_AREA_BUILDINGS .chartBody {
            width: 250px;
            height: 250px;
            position: relative;
            float: left;
        }
        #CHART_AREA_BUILDINGS .chartItem {
            border-radius: 100%;
            position: absolute;
            left: 0;
            top: 50%;
            transform: translate(0, -50%);
        }
        #CHART_AREA_BUILDINGS .chartLegend {
            padding: 0 0 0 290px;
        }
        #CHART_AREA_BUILDINGS .chartLegend .chartLegendItem {
            cursor: pointer;
        }
        #CHART_AREA_BUILDINGS.hovered .chartItem, 
        #CHART_AREA_BUILDINGS.hovered .chartLegendItem {
            opacity: 0.3;
        }
        #CHART_AREA_BUILDINGS.hovered .chartItem.hovered, 
        #CHART_AREA_BUILDINGS.hovered .chartLegendItem.hovered {
            opacity: 1;
            z-index: 10;
        }
        #CHART_AREA_BUILDINGS .chartLegend .bigLabel {
            font-size: 30px;
            color: #000;
            white-space: nowrap;
        }
        #CHART_AREA_BUILDINGS .chartLegend .subLabel {
            color: #8C9CAF;
            margin-bottom: 20px;
        }
        #CHART_AREA_BUILDINGS .chartLegend .subLabel i {
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;
            width: 8px;
            height: 8px;
            border-radius: 100%;
        }
        @media screen and (min-width: 1000px) and (max-width: 1300px) {
            #CHART_AREA_BUILDINGS .chartBody {
                width: 200px;
                height: 200px;
            }
            #CHART_AREA_BUILDINGS .chartLegend {
                padding-left: 240px;
            }
            #CHART_AREA_BUILDINGS .chartLegend .bigLabel {
                font-size: 24px;
            }
        }
    </style>
    
    <div id="CHART_AREA_BUILDINGS">
        <div class="chartBody"></div>
        <div class="chartLegend"></div>
    </div>
        
    <script type="text/javascript">
        (function($) {
            var $container = $('#CHART_AREA_BUILDINGS'),
                $chartBody = $('.chartBody', $container),
                $chartLegend = $('.chartLegend', $container),
                styles = {
                    tep_gpzu_land_area: { //Площадь земельного участка
                        background: '#EFF6FD'
                    },
                    tep_gpzu_total_built_area: { //Общая площадь застройки
                        background: '#BEDAF6'
                    }/*,
                    tep_gpzu_area_existing_buildings: { //Площадь существующей застройки
                        background: '#8CBEEE' //F59192
                    }*/
                },
                data = [
                    <xsl:for-each select="//DB_GPZUTEPS_AREA_BUILDINGS/ROW_SET/ROW"><xsl:if test="position() != 1">, </xsl:if>{
                        attrId: '<xsl:value-of select="ATTR_ID"/>',
                        name: '<xsl:value-of select="NAME"/>',
                        sumText: '<xsl:value-of select="SUM"/>',
                        sumValue: +'<xsl:value-of select="SUM_NUM"/>'.replace(',', '.').replace(/[^\d\.]/g, '')
                    }</xsl:for-each>
                ],
                maxValue = 0,
                i;
        <![CDATA[
        
            $chartBody.closest('.chart').removeAttr('style');
                
            data.sort(function(a, b) {
                return b.sumValue - a.sumValue;
            });
            
            for (var i=0; i<data.length; i++) {
                var tmpValue = +data[i].sumValue;
                if (tmpValue > maxValue) maxValue = tmpValue;
                data[data[i].attrId] = data[i];
            }
            
            /*//Если [Площадь существующей застройки] > [Общая площадь застройки] - первый круг краснеет (#F59192)
            if (data['tep_gpzu_area_existing_buildings'].sumValue > data['tep_gpzu_total_built_area'].sumValue) {
                styles['tep_gpzu_area_existing_buildings']['background'] = '#F59192';
                //И границы графика по возможности должны покраснеть (#F59192)
                $chartBody.closest('.chart').css('borderColor', '#F59192');
            }
            //Если [Площадь существующей застройки] > [Площадь земельного участка] - второй круг обводится красным пунктиром (1px dashed #CC0000)
            if (data['tep_gpzu_area_existing_buildings'].sumValue > data['tep_gpzu_land_area'].sumValue) {
                styles['tep_gpzu_land_area']['border'] = '1px dashed #CC0000';
            }*/
            
            console.log(data);
            
            for (var i=0; i<data.length; i++) {
                makeChartItem(data[i]);
                //makeLegendItem(data[i]);
            }
            for (var p in styles) if (styles.hasOwnProperty(p)) {
                makeLegendItem(data[p]);
            }
            addEvents();
            
            function makeChartItem(item) {
                var $item = $('<div class="chartItem"></div>')
                        .attr('data-attr-id', item.attrId)
                        .css(styles[item.attrId] || { background: '#ccc' }),
                    maxDiam = Math.sqrt(maxValue / Math.PI);
                
                if (maxValue > 0) {
                    var w = Math.sqrt(item.sumValue / Math.PI) / (maxDiam / 100) + '%';
                    $item.css({
                        width: w,
                        height: w
                    });
                }
                
                return $item.appendTo($chartBody);
            }
            function makeLegendItem(item) {
                var $item = $('<div class="chartLegendItem"></div>').attr('data-attr-id', item.attrId);
                
                $item.append('<div class="bigLabel">' + item.sumText + ' м<sup>2</sup></div>');
                $item.append('<div class="subLabel">' + 
                    '<i style="background: ' + (styles[item.attrId].background || '#ccc') + '"></i>' + 
                    item.name + '</div>');
                
                return $item.appendTo($chartLegend);
            }
            
            function addEvents() {
                $('.chartLegendItem', $container)
                    .mouseenter(function() {
                        var $t = $(this),
                            attrId = $t.data('attrId'),
                            $target = $('.chartItem[data-attr-id="' + attrId + '"]', $container);
                        
                        $t.add($target).add($container).addClass('hovered');
                    })
                    .mouseleave(function() {
                        var $t = $(this),
                            attrId = $t.data('attrId'),
                            $target = $('.chartItem[data-attr-id="' + attrId + '"]', $container);
                        
                        $t.add($target).add($container).removeClass('hovered');
                    });
            }
        ]]>
        })(jQuery);
    </script>
    
<XML style="display: none" class="AREA_BUILDINGS"><xsl:copy-of select="."/></XML>
</xsl:template>
</xsl:stylesheet>