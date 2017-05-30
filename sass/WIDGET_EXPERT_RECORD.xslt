<div class="expertRecord">
    <div id="expert_record"></div>
    <!--Необходимо подключить библиотеку raphael-->
<!--script type="text/javascript"><![CDATA[
$.fn.expertClock = function(date) {

  var $t = this,
      t = $t[0],
      signDefColor = '#C9C9C9',
      $legend = $t.next('.legend'),
      sectorList = [],
      getBodyScrollTop = function() {
        return self.pageYOffset || (document.documentElement && document.documentElement.scrollTop) || (document.body && document.body.scrollTop);
      },
      draw_clock = function (cb){
        
        if (!!t.clockInterval) {
          clearInterval(t.clockInterval);
        }
  
        var canvas = Raphael(t, 200, 200);
        canvas.customAttributes.segment = function (x, y, r, a1, a2) {
          var flag = (a2 - a1) > 180,
              clr = (a2 - a1) / 360;
          a1 = (a1 % 360) * Math.PI / 180;
          a2 = (a2 % 360) * Math.PI / 180;
          return {
            path: [["M", x, y], ["l", r * Math.cos(a1), r * Math.sin(a1)], ["A", r, r, 0, +flag, 1, x + r * Math.cos(a2), y + r * Math.sin(a2)], ["z"]]
          };
        };
          
        var clock = canvas.circle(100,100,95),
            clockStrokeImitate = canvas.circle(100, 100, 93);
        clock.attr({"fill": "#FBFBFB","stroke":"#C9C9C9","stroke-width":"2"});
        clockStrokeImitate.attr({"fill": signDefColor,"stroke-width":"0"});
        
        
        var hour_sign,
            statFill = { //Расцветки для секторов
              ENABLED: '', //free
              BUSY: '', //busy
              RESERVED: '', //reserve
            },
            statNames = {
              ENABLED: 'Свободно',
              BUSY: 'Встреча',
              RESERVED: 'Резерв'
            },
            legendItemTpl = '<div class="legendItem"><b style="background-color: {COLOR};"></b> {NAME}</div>',
            gradus = [180, 450],
            fillStart = null,
            gradStart = null,
            sectors = [], 
            tmpTime, tmpIndex,
            data = {
              start: null,
              tmp: null
            },
            newSector, tmpTimeFill, i,
            setLink = function(el, id) {
              if (!id) return false;
              
              var tpl = '#';
                  
              el.attr({href: tpl.replace('{id}', id), target: 'blank'});
            },
            updateTipPosition = function(el, x, y) {
              var t = el,
                  b = $(window),
                  w = t.outerWidth(true),
                  h = t.outerHeight(true),
                  bw = b.width(),
                  bh = b.height(),
                  p = {
                    min: 5,
                    max: 15
                  },
                  css = {},
                  scrollTop = getBodyScrollTop();
                      
                css.left = x + p.max + w < bw ? x + p.max + 'px' : x - p.min - w + 'px';
                css.top = y + p.max + h < bh ? y + p.max + scrollTop + 'px' : y - p.min - h + scrollTop + 'px';
                
                el.css(css);
            },
            setTooltip = function(t, content) {
              if (!t || !content) return false;
              if ( !!content.split && !content.trim() ) return false;
              //console.log(content);
              var currentId = 'tip' + (new Date()).getTime(),
                  $tipBlock = $('<div class="expertTooltip" id="' + currentId + '">' + content + '</div>');
              
              $tipBlock.css({
                position: 'absolute'
              }).hide().appendTo('body');
              
              t.mouseover(function() {
                $tipBlock.show();
              });
              t.mouseout(function() {
                $tipBlock.hide();
              });
              t.mousemove(function(e) {
                updateTipPosition($tipBlock, e.clientX, e.clientY);
              });
              
            };
        
        if (sectorList.length) {
          
          for (i=0; i<sectorList.length; i++) {
            tmpTime = sectorList[i]['S_BEGIN'].split(':');
            tmpIndex = (tmpTime[0] - 9) * 2 + tmpTime[1]/30; 
            if (tmpIndex < 0) {
              continue;
            } else if (tmpIndex * 15 + 180 >= 450) {
              break;
            } else {
              if (tmpIndex > sectors.length) {
                for (var j=sectors.length; j<tmpIndex; j++) {
                  sectors.push(null);
                }
              }
              if (!!sectorList[i]['SLOT_COLOR']) {
                statFill[sectorList[i]['FK_NSI_APP_STATUS']] = sectorList[i]['SLOT_COLOR'];
              }
              sectorList[i]['color'] = statFill[sectorList[i]['FK_NSI_APP_STATUS']];
              sectorList[i]['info'] = sectorList[i]['SLOT_INFO'];
              sectors.push(sectorList[i]);
            }
          }
          
        
          for (i=gradStart=gradus[0], z=0, data['start'] = sectors[z]; i<gradus[1]; i+=15, z++) {
            data['tmp'] = sectors[z];
            if (!data['start']) {
              data['start'] = sectors[z];
              gradStart = i;
              if (!data['tmp']) continue;
            }
                  
            if (!!data['start'] && ((!!data['tmp'] && (data['tmp']['color'] != data['start']['color'] || data['tmp']['info'] != data['start']['info'])) || !data['tmp'])) { //Смена цвета, переход на новый сектор
              canvas.path().attr({segment: [100, 100, 93, gradStart-1, i+1], "stroke-width":'0',fill: '#fff'});
              newSector = canvas.path().attr({segment: [100, 100, 93, gradStart, i], stroke: '#fff'/*data['start']['color']*/, "stroke-width":'0',fill: data['start']['color']});
              setTooltip(newSector, data['start']['SLOT_INFO']);
              setLink(newSector, data['start']['FK_SLOT_REQUEST']);
              data['start'] = data['tmp'];
              gradStart = i;
            }
            if (i+15 == gradus[1]) { //Последний сектор
              canvas.path().attr({segment: [100, 100, 93, gradStart-1, i+15], "stroke-width":'0',fill: '#fff'});
              newSector = canvas.path().attr({segment: [100, 100, 93, gradStart, i+14], stroke: data['start']['color'], "stroke-width":'0',fill: data['start']['color'], tip: 'test'});
              setTooltip(newSector, data['start']['SLOT_INFO']);
              setLink(newSector, data['start']['FK_SLOT_REQUEST']);
            }
          }
        }
        
        var whiteFaceCircle = canvas.circle(100, 100, 80);
        whiteFaceCircle.attr({"fill":"#fff","stroke":"#fff","stroke-width":"1"});
        
        
        $legend.empty();
        for (var sf in statFill) if (statFill.hasOwnProperty(sf)) {
          if (!!statFill[sf]) $legend.append(legendItemTpl.replace('{NAME}', statNames[sf]).replace('{COLOR}', statFill[sf]));
        }
        $legend.append(legendItemTpl.replace('{NAME}', 'Запись невозможна').replace('{COLOR}', signDefColor));
          
        for(var i=0; i<12; i++){
          if (!(i%3)) continue;
          var start_x = 100+Math.round(74*Math.cos(30*i*Math.PI/180));
          var start_y = 100+Math.round(74*Math.sin(30*i*Math.PI/180));
          hour_sign = canvas.circle(start_x, start_y, 2);
          hour_sign.attr({"fill":"#C9C9C9", "stroke-width":"0"});
        }
          
        var fontAttr = {
            fill: '#7F7F7F',
            "font-family": "Arial",
            "font-size": "15px"
        };
        canvas.text(30,100,"9").attr(fontAttr);
        canvas.text(100,30,"12").attr(fontAttr);
        canvas.text(168,100,"15").attr(fontAttr);
        canvas.text(100,170,"18").attr(fontAttr);
          
        hour_hand = canvas.path("M100 100L100 55");
        hour_hand.attr({stroke: "#7A7A7A", "stroke-width": 4});
        minute_hand = canvas.path("M100 100L100 35");
        minute_hand.attr({stroke: "#ADADAD", "stroke-width": 4});
        
        hour_hand_end = canvas.circle(100, 55, 2);
        hour_hand_end.attr({"fill": "#7A7A7A", "stroke-width":"0"});
        
        var pin = canvas.circle(100, 100, 6);
        pin.attr({"fill": "#7A7A7A", "stroke-width":"0"});
        cb();
        t.clockInterval = setInterval(cb,1000);
          
      },
      update_clock = function() {
        var clearTransforms = function(el) {
          var arr = el.transform(),
              len = arr.length;
              
          if (!!len) arr.splice(1, len-2);
        };
        
        hour_hand.rotate(-(30 * hours + (minutes / 2.5)), 100, 100);
        hour_hand_end.rotate(-(30 * hours + (minutes / 2.5)), 100, 100);
        minute_hand.rotate(-(6 * minutes), 100, 100);
        now = new Date();
        hours = now.getHours();
        minutes = now.getMinutes();
        seconds = now.getSeconds();
        hour_hand.rotate(30 * hours + (minutes / 2.5), 100, 100);
        hour_hand_end.rotate(30 * hours + (minutes / 2.5), 100, 100);
        minute_hand.rotate(6 * minutes, 100, 100);
        
        clearTransforms(hour_hand);
        clearTransforms(hour_hand_end);
        clearTransforms(minute_hand);
        
      };

  var hours = 0;
  var minutes = 0;
  var seconds = 0;
  
  draw_clock(update_clock);
};

$(function() {
    $('#expert_record').empty().expertClock($(this).val());
});
]]></script-->
</div>