<script type="text/javascript">
$(document).ready(function () {
    var monthRu=['Января','Февраля','Марта','Апреля','Мая','Июня','Июля','Августа','Сентября','Октября','Ноября','Декабря'];
    function getWeekRange() {
      var day1 = new Date(),
      day2 = new Date(),
      currentDay = day1.getDate() - 7,
      currentDayWeek = day1.getDay();

      day1.setDate(currentDay - currentDayWeek + 1);
      day2.setDate(currentDay + 7 - currentDayWeek);

	    return {
		    start: day1.getDate(),
		    end: day2.getDate(),
        month1: day1.getMonth(),
        month2: day2.getMonth()
      };
    } 
    var graphDates = getWeekRange();
    var weekString = "";
    if(graphDates.month1 != graphDates.month2){
      weekString = 'Неделя ' + graphDates.start +' '+ monthRu[graphDates.month1].toLowerCase()+ '-' + graphDates.end + ' ' + monthRu[graphDates.month2].toLowerCase();
    }else{
      weekString = 'Неделя ' + graphDates.start + '-' + graphDates.end + ' ' + monthRu[graphDates.month1].toLowerCase();
    }
    $('.active.s_week').text(weekString);
    function splitNums(delimiter, str)
      {  
            str = str.toString();
            str = str.replace(/(\d+)(\.\d+)?/g,
                  function(c,b,a){return b.replace(/(\d)(?=(\d{3})+$)/g, '$1'+delimiter) + (a ? a : '')} );
 
           return str;
      }

    $('.counts .big').each(function(){
      if($(this).text().indexOf(' ')==-1){
            var sub = $(this).text().split('.');
            $(this).text(splitNums(' ',sub[0]/1000 + 0.5|0))
        }
      });
    $(".imgObj").each(function () {
        var widthImg = $(this).width();
        heightImg = $(this).height();
        if (widthImg > heightImg) {
            $(this).height(140);
        }
        else {
            $(this).width(140);
        }
    });
    


    $("#subSecondMenu ul li").click(function () {
        $("#subSecondMenu ul li").removeClass('active');
        $(this).addClass('active');
        var tab = $(this).attr('tab');
        if (tab != undefined)
        {
          $(".resources").hide();
          $("#" + tab).show();
          $(".nextMunu li").removeClass("active");
        }
        console.log(isLoadTabs);
        if (isLoadTabs == false)
        {
          tabInfo.showLoading();          
        }
    });
    
    $("body").on("click", ".bigBlock", function () {
        var tab = $(this).attr('tab');
        $("#subSecondMenu ul li").removeClass('active');
        $('a[tab="test"]')
        $("#subSecondMenu ul li[tab='" + tab + "']").addClass("active");
       
       if (tab != undefined)
        {
          $(".resources").hide();
          $("#" + tab).show();
          $(".nextMunu li").removeClass("active");  
          if (isLoadTabs == false){
            tabInfo.showLoading();          
          } else {
            loadDataPage(tab);
          }
        }
       
    });
    
    s_week=[[
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_week']">
      <xsl:value-of select="RV"/>,
    </xsl:for-each>  
    ],  
    [
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_week']">
      <xsl:value-of select="SQ"/>,
    </xsl:for-each>  
    ],  
    [
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_week']">
      <xsl:value-of select="BEG"/>,
    </xsl:for-each>  
    ],
    [
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_week']">
      <xsl:value-of select="MGSN"/>,
    </xsl:for-each>  
    ]];
    
    
    
    /*s_month=[[
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_month']">
      <xsl:value-of select="RV"/>,
    </xsl:for-each>  
    ],  
    [
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_month']">
      <xsl:value-of select="SQ"/>,
    </xsl:for-each>  
    ],  
    [
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_month']">
      <xsl:value-of select="BEG"/>,
    </xsl:for-each>  
    ],
    [
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_month']">
      <xsl:value-of select="MGSN"/>,
    </xsl:for-each>  
    ]];
    
    
    s_year=[[
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_year']">
      <xsl:value-of select="RV"/>,
    </xsl:for-each>  
    ],  
    [
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_year']">
      <xsl:value-of select="SQ"/>,
    </xsl:for-each>  
    ],  
    [
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_year']">
      <xsl:value-of select="BEG"/>,
    </xsl:for-each>  
    ],
    [
    <xsl:for-each select="//STATIC/ROW_SET/ROW[NICK='s_year']">
      <xsl:value-of select="MGSN"/>,
    </xsl:for-each>  
    ]];*/
    
      
   


    var stack = 0,
        bars = false,
        lines = true,
        steps = false;
    plots = [];
    $(window).resize(function(){
      for(var i=0; i &lt; plots.length; i++){
        plots[i].destroy();
      }
      $(".s_week .placeholder1").each(function (index) {
        graphPlot(this,s_week[index],index);
       });
    });
    $(".s_week .placeholder1").each(function (index) {
        graphPlot(this,s_week[index],index);
    });
    function graphPlot(el, arr, index) {
        var l0 = arr;
        var l2 = [0, 0, 0, 0, 0, 0, 0, 0];
        var id = $(el).attr('id');
        plots[index] = $.jqplot(id,[l0, l2], {

            axesDefaults: {
                pad: 1.05
            },

            series: [
                {
                   markerOptions: {shadow:false, size: 6, fill:true, fillColor:'rgba(255, 255, 255, 1)' },
                   shadow:false,
                   color:"rgba(70,188,244,1)"
                
                },
                {
                    showMarker: false,
                    show: false
                }
            ],
            fillBetween: {
                // series1: Required, if missing won't fill.
                series1: 0,
                // series2: Required, if  missing won't fill.
                series2: 1,
                // color: Optional, defaults to fillColor of series1.
                color: "rgba(165, 222, 252, 0.7)",
                // baseSeries:  Optional.  Put fill on a layer below this series
                // index.  Defaults to 0 (first series).  If an index higher than 0 is
                // used, fill will hide series below it.
                baseSeries: 0,
                // fill:  Optional, defaults to true.  False to turn off fill.
                fill: true
            },
            seriesDefaults: {
                rendererOptions: {
                    smooth: false
                }
            },
            grid: {

                aboveData: false,
                color: "#CCCCCC",
                backgroundColor: "white",
                drawBorder: false,
                borderWidth: {
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0
                },
                borderColor: "#868686",
                minBorderMargin: 5,
                autoHighlight: true,
                drawGridlines: true,
                shadow: false
            },

            axes: {
                yaxis: {min: 10, showTicks: false, rendererOptions: {drawBaseline: false}},
                xaxis: { showTicks: false, min: 0.5, max: 8.5, tickOptions: {show: false}, rendererOptions: {drawBaseline: false}}
            }
        });
    }
    $("a.showMore").click(function(){
      $(this).parent().find('.moreLinks').show();
    });
    $('.rcolumn ul li').mouseleave(function(){$(this).find('.moreLinks').hide()});
   
       $('#mainForm_new').on('submit',function(e){
    
                var searchVal = $('#searchline').find('input').val();  
                
                if (searchVal == 'Адрес объекта' || searchVal == '') return false;
                             
                window.location.href = 'tabInfo.action?tab=UGD&amp;a=E3048FDD9BB34FC3A276C9F755062167&amp;f=8aff850c4030dfba014033634afc0025:'+searchVal+':0:0:49:0#tab::id=0/tree::rel=4/filter::id=E3048FDD9BB34FC3A276C9F755062167/vitrina::viewId=E3048FDD9BB34FC3A276C9F755062167&amp;offset=0&amp;limit=50&amp;find=840';                
                return false;
            
    });
    $('#messageInfo .closeInfo').click(function(){
      $(this).parent().fadeOut(500);
    });
    
});

</script>