<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="no"/>
<xsl:variable name="DATA">
<ROOT xmlns="">
    <REAL_GPZU>
        <ROW_SET>
          <ROW>
            <ATTR_ID>agree_gzk</ATTR_ID>
            <NAME>Одобрено на ГЗК</NAME>
            <SUM_NUM>789020902</SUM_NUM>
            <SUM>789 020 902</SUM>
          </ROW>
          <ROW>
            <ATTR_ID>oformed_gpzu</ATTR_ID>
            <NAME>Оформлено ГПЗУ</NAME>
            <SUM_NUM>532040102</SUM_NUM>
            <SUM>532 040 102</SUM>
          </ROW>
          <ROW>
            <ATTR_ID>oformed_pc</ATTR_ID>
            <NAME>Оформлено РС</NAME>
            <SUM_NUM>231750901</SUM_NUM>
            <SUM>231 750 901</SUM>
          </ROW>
          <ROW>
            <ATTR_ID>oformed_pb</ATTR_ID>
            <NAME>Оформлено РВ</NAME>
            <SUM_NUM>789020</SUM_NUM>
            <SUM>789 020</SUM>
          </ROW>
        </ROW_SET>
    </REAL_GPZU>
</ROOT>
</xsl:variable>
<xsl:template match="/">
<style type="text/css">
        #CHART_REALIZE_GPZU .chartBody {
            width: 250px;
            height: 250px;
            position: relative;
            float: left;
        }
        #CHART_REALIZE_GPZU .chartItem {
            border-radius: 100%;
            position: absolute;
            left: 0;
            top: 50%;
            transform: translate(0, -50%);
        }
        #CHART_REALIZE_GPZU .chartLegend {
            padding: 0 0 0 290px;
        }
        #CHART_REALIZE_GPZU .chartLegend .chartLegendItem {
            cursor: pointer;
            transition: all .3s;
        }
        #CHART_REALIZE_GPZU.hovered .chartItem,
        #CHART_REALIZE_GPZU.hovered .chartLegendItem {
            opacity: 0.3;
        }
        #CHART_REALIZE_GPZU.hovered .chartItem.hovered,
        #CHART_REALIZE_GPZU.hovered .chartLegendItem.hovered {
            opacity: 1;
            z-index: 10;
        }
        #CHART_REALIZE_GPZU .chartLegend .bigLabel {
            font-size: 30px;
            color: #000;
            white-space: nowrap;
        }
        #CHART_REALIZE_GPZU .chartLegend .subLabel {
            color: #8C9CAF;
            margin-bottom: 20px;
        }
        #CHART_REALIZE_GPZU .chartLegend .subLabel i {
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;
            width: 8px;
            height: 8px;
            border-radius: 100%;
        }
        #CHART_REALIZE_GPZU .chartItem:hover{
            background-color: #1c88d2!important;
            transition: all .3s;
            cursor: pointer;
        }
        .tiped{
            box-shadow: 0px 1px 8px rgba(0, 51, 102, 0.25);
            color: #7D8FA4;
            font-size: 13px;
            position: absolute;
            bottom: -60px;
            left: 10px;
            width: 230px;
            padding: 10px;
            background-color: white;
            opacity: 0;
            z-index: 200;
            transition: all .3s;
            border-radius: 3px;
        }
        .tiped.show{
            opacity: 1;
            transition: all .3s;
        }
        .tiped .bigLabel{
            font-size: 20px;
            color: #333;
        }
        @media screen and (min-width: 1000px) and (max-width: 1300px) {
            #CHART_REALIZE_GPZU .chartBody {
                width: 200px;
                height: 200px;
            }
            #CHART_REALIZE_GPZU .chartLegend {
                padding-left: 240px;
            }
            #CHART_REALIZE_GPZU .chartLegend .bigLabel {
                font-size: 24px;
            }
        }
    </style>
    <div id="CHART_REALIZE_GPZU">
        <div class="chartBody"></div>
        <div class="chartLegend"></div>
    </div>
     <script type="text/javascript">
        (function($) {
            var colors = ['#EFF6FD', '#DEEDFA', '#ADD1F3', '#8CBEEE']
            var $container = $('#CHART_REALIZE_GPZU'),
                $chartBody = $('.chartBody', $container),
                $chartLegend = $('.chartLegend', $container),
                styles = {<xsl:for-each select="$DATA//ROOT//ROW_SET/ROW"><xsl:if test="position() != 1">, </xsl:if>'<xsl:value-of select="ATTR_ID"/>':{}</xsl:for-each>
                },
                data = [
                    <xsl:for-each select="$DATA//ROOT//ROW_SET/ROW"><xsl:if test="position() != 1">, </xsl:if>{
                        attrId: '<xsl:value-of select="ATTR_ID"/>',
                        name: '<xsl:value-of select="NAME"/>',
                        sumText: '<xsl:value-of select="SUM"/>',
                        sumValue: +'<xsl:value-of select="SUM_NUM"/>'.replace(',', '.').replace(/[^\d\.]/g, ''),
                        tooltip: 'Одобрено на ГЗК (ГПЗУ не оформлено)',
                        tooltipValue: '248 204'
                    }</xsl:for-each>
                ],
                maxValue = 0,
                i;
        <![CDATA[
            var conter =0;
            for (var p in styles){
                if (styles.hasOwnProperty(p)) {
                    styles[p]['background'] = colors[conter];
                    conter++;
                }

            }

            $chartBody.closest('.chart').removeAttr('style');

            data.sort(function(a, b) {
                return b.sumValue - a.sumValue;
            });

            for (var i=0; i<data.length; i++) {
                var tmpValue = +data[i].sumValue;
                if (tmpValue > maxValue) maxValue = tmpValue;
                data[data[i].attrId] = data[i];
            }



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

                var $tooltip = $('<div/>');
                var $tName = $('<div>'+item.tooltip+'</div>');
                var $tValue = $('<div class="bigLabel">'+item.tooltipValue+' м<sup>2</sup></div>');
                $tooltip.addClass('tiped').attr('data-attr-id', item.attrId);
                if (item.tooltipValue.length > 0) $tooltip.html($tName).append($tValue);
                $tooltip.appendTo($chartBody);

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
                $('.chartItem', $container)
                    .mouseenter(function() {
                        var $t = $(this),
                            attrId = $t.data('attrId'),
                            $target = $('.tiped[data-attr-id="' + attrId + '"]', $container);

                        $t.add($target).add($container).addClass('show');
                    })
                    .mouseleave(function() {
                        var $t = $(this),
                            attrId = $t.data('attrId'),
                            $target = $('.tiped[data-attr-id="' + attrId + '"]', $container);

                        $t.add($target).add($container).removeClass('show');
                    });
            }
        ]]>
        })(jQuery);
    </script>
    <XML style="display: none;">
          <xsl:copy-of select="$DATA"/>
        </XML>
</xsl:template>
</xsl:stylesheet>
