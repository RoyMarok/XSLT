<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="no"/>
<xsl:template match="/">
    <div id="CHART_GPZU_COUNT" style="height: 270px;"></div>
    
    <script type="text/javascript">
        (function($) {
            var $container = $('#CHART_GPZU_COUNT'),
                $body = $('body'),
                data = [<xsl:for-each select="//DB_GPZUTEPS_COUNT/ROW_SET/ROW"><xsl:sort select="YEAR"/><xsl:if test="position() != 1">, 
                    </xsl:if>{
                    year: '<xsl:value-of select="YEAR"/>',
                    countAll: +'<xsl:value-of select="CNT_ALL"/>',
                    countActive: +'<xsl:value-of select="CNT_ACTIVE"/>',
                    urlAll: '<xsl:value-of select="LNK_ALL"/>',
                    urlActive: '<xsl:value-of select="LNK_ACTIVE"/>'
                }</xsl:for-each>],
                params = {
                    chart: { type: 'column' },
                    title: { text: '' },
                    xAxis: {
                        categories: []
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: ''
                        }
                    },
                    legend: {
                        itemStyle: {
                            fontWeight: 'normal',
                            fontFamily: $body.css('fontFamily'),
                            fontSize: '13px'
                        },
                        symbolWidth: 8,
                        symbolHeight: 8
                    },
                    tooltip: {<![CDATA[
                        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                            '<td style="padding:0"><b>{point.y:,.0f} док-в</b></td></tr>',
                        footerFormat: '</table>',
                        shared: false,
                        useHTML: true
                    ]]>},
                    series: [
                        {
                            name: 'действующие',
                            color: '#82A2CD', 
                            data: [],
                            links: [],
                            cursor: 'pointer'
                        }, 
                        { 
                            name: 'выпущенные', 
                            color: '#597BA8',
                            data: [],
                            links: [],
                            cursor: 'pointer'
                        }
                    ],
                    credits: { enabled: false }
                };
            
            <![CDATA[
                Highcharts.setOptions({
                    lang: {
                        numericSymbols: null //otherwise by default ['k', 'M', 'G', 'T', 'P', 'E']
                    }
                });
                
                for (var i=0; i<data.length; i++) {
                    params.xAxis.categories.push(data[i].year);
                    params.series[0].data.push(data[i].countActive);
                    params.series[0].links.push(data[i].urlActive);
                    params.series[1].data.push(data[i].countAll);
                    params.series[1].links.push(data[i].urlAll);
                }
                
                for (var i=0; i<params.series.length; i++) {
                    params.series[i].point = {
                        events: {
                            click: function() {
                                var lnk = this.series.userOptions.links[this.index];
                                if (lnk) window.open(lnk, '_blank');
                            }
                        }
                    };
                }
                
                var chart = Highcharts.chart('CHART_GPZU_COUNT', params);
            ]]>
        })(jQuery);
    </script>
    
<XML style="display: none;" class="CHART_GPZU_COUNT"><xsl:copy-of select="."/></XML>
</xsl:template>
</xsl:stylesheet>