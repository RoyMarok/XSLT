<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
        <style type="text/css">
            .cardWrapper {padding: 2px 17px;}
            .flexWrapper {display: flex;}
            .cardLeftSide {width: auto; flex-grow: 1; margin: 9px 5px;}
            .cardRightSide {width: 356px; margin: 9px 5px 9px 10px; flex-shrink: 0;}

            .cardTapeItem {margin: 0 0 9px; border: 1px solid #e4e4e4; background: #fff; padding: 10px 0;border-radius: 3px;}
            .cardTapeItem .icon-star {width: 27px; height: 27px; background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAAUVBMVEUAAADA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0ODA0OCSMGfmAAAAGnRSTlMAtE4E4ar02q2CfVk18/Dlo5mPimZdQS4VE1e5LwIAAABUSURBVAjXRY1HDoAwDATXgUAave//H4pwIjKnGckFStxRsVK9GbvmD0MalW2Z3UB2ztoV58RCm4Bbssuj6/3nfTnR6lD2iwyeTBqBETjoNcToLwFeV3sE6t/25fgAAAAASUVORK5CYII=') center center no-repeat; visibility: hidden; cursor: pointer;}
			.cardTapeItem:hover .icon-star {visibility: visible;}
			.cardTapeItem.favorite .icon-star {background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAAY1BMVEUAAADhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulP/127wyF/71Gr2z2Xqw1vnwFj3z2ajQLf9AAAAGnRSTlMAq/y0TgTh9NqCfVkwFPPw5bejmY+KZl1BOAHPpvIAAABgSURBVAjXRY1JEoAgEAMzgLjvOwPq/1+pTlnSp/QhCYRyQYR0zEmbJr+Y4zAS5nGgJlwpEU3YOg7uIbDdgVrzK6xrqWfeOZ99E9YzewuhOlWRq7MSKVQJrCoX0Ua+euAGXNIEzQeFJ8QAAAAASUVORK5CYII=');visibility: visible;}
			.cardTapeItem.favorite:hover {
				background-color: #FFFAE6;
				border-color: #FEEB9F;
			}
            .cardTapeItem table td {vertical-align: top;}
            .cardTapeItem p {margin: 5px 0;}
            .cardTapeItemCaption {font-weight: bold; font-size: 16px;}
            .gray {color: #7C8FA4;}
            .cardTapeItemStatus {color: #fff; background: #ccc; text-align: center; font-size: 11px; line-height: 18px;}
            .cardTapeItemStatus.red {background: #CC0000;}
            .cardTapeItemStatus.green {background: #8BC24A;}

            .cardTapeItem .td-icon {width: 27px; text-align: center;}
            .cardTapeItem .td-status {width: 120px; padding: 0 20px;}

			.cardButtonList {margin: 20px 381px 0 15px;}
			.cardButton {float: left; margin: 5px 16px; font-size: 16px; color: #7C8FA4; background-position: left center; background-repeat: no-repeat; position: relative;}
			.cardButton > span {padding-left: 25px; cursor: pointer;}
			.cardButton.right {float: right;}
			.cardButton:hover > span {color: #235DC1;}
			.cardButton.active {color: #000; cursor: default;}
			.cardButtonFilters {background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARBAMAAADJQ1rJAAAAJ1BMVEUAAAB8j6Te4+i2wMzv8fSotcP19vjU2uHL09vFzte8xtGbqbqClKjqdv5cAAAAAXRSTlMAQObYZgAAAEFJREFUCNdjQIBAQTCQZmBYCGEJMzAwQ1gBQGlDEEMUpJAZKgQSBAtBBQ0gLBZBQQXSWGxwFkMhnMUBZzHMcQASAM/tB+GaFgSqAAAAAElFTkSuQmCC');}
			.cardButtonFilters:hover {background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARBAMAAADJQ1rJAAAALVBMVEUAAAAkJCTHx8fk5OSCgoJpaWltbW3u7u62tranp6ednZ2NjY2GhoZVVVUqKiqBy+M8AAAAAXRSTlMAQObYZgAAAEJJREFUCNdjQIBEQTCQZWDYCGHJMDCwQFgJQGlHEEMUyIAIBoD1OIKFoIIOEBazoKACaSx2OIuhEc7ihLMY1hkACQAIPAheh14gxwAAAABJRU5ErkJggg==');}
			.cardButtonDocs {background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARAgMAAABGA69pAAAACVBMVEUAAAB8j6SbqbqrC4dIAAAAAXRSTlMAQObYZgAAACRJREFUCNdjgADW0AgwGQYiGVgbwGQCmIwAkQwiZJChoSFQEgAP3AWgu31iDAAAAABJRU5ErkJggg==');}
			.cardButtonDocs:hover, .cardButtonDocs.active  {background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARAgMAAABGA69pAAAACVBMVEUAAAABAQE0NDR0Hz6+AAAAAXRSTlMAQObYZgAAACRJREFUCNdjgADW0AgwGQYiGVgbwGQCmIwAkQwiZJChoSFQEgAP3AWgu31iDAAAAABJRU5ErkJggg==');}
			.cardButtonEvents {background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARBAMAAADJQ1rJAAAAIVBMVEUAAAB8j6Tl6e2kscCLnK/09vjb4ObAydO1v8uTo7R/kqabbnAWAAAAAXRSTlMAQObYZgAAACtJREFUCNdjQABBKEBhQaSoxgIZygyzg8kRSIAlqibB3CABc41IAoxlCqEAdKoFIhC/VvcAAAAASUVORK5CYII=');}
			.cardButtonEvents:hover, .cardButtonEvents.active  {background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARBAMAAADJQ1rJAAAAKlBMVEUAAAAaGhqysrIkJCTv7+/k5OTd3d2YmJhiYmJSUlI+Pj47OzsrKysbGxvZzoqeAAAAAXRSTlMAQObYZgAAAC1JREFUCNdjQABBKEBhQaSoxgIZGgWzg8kQSIAleg/B3CDpAGUJF8DctQ1CAQCYlwZ9jc6x+QAAAABJRU5ErkJggg==');}
			.cardButtonActions {background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAMAAAAMs7fIAAAAUVBMVEUAAAB9j6T09ffa3+XU2uGKm66Ck6jl6e3P1t7L0tvi5uurt8WotMKaqLiXpbaGl6vt7/Lo7O/f5OnGztfBydOwu8iir76RobKPn7G2wMygrbyMWOj1AAAAAXRSTlMAQObYZgAAAIlJREFUGNNNj9sSgyAMRLPITbF4rdr+/4eWJa3lvGTnsJMMohgPv8hNMDIAiCKdCgvXpWIOe2GjWNFiucI1ws8sdYxTnjh6VsKzpFQS5zEY8bUh5AIRkEc1Y83acdVkNYvl06uIneW4/m6dY9Zb5MQfZ2qlQUsbsL+5o3dIUrHh+/c5yo0pJmj8ADpGA8J0AUxjAAAAAElFTkSuQmCC');}
			.cardButtonActions:hover, .cardButtonActions.active  {background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAMAAAAMs7fIAAAAY1BMVEUAAAAzMzM4ODnc3eGvsLO3uLunqKrDxMehoaRwcHFcXF1WV1dEREVAQEDS09bMzdDKys7Gx8q/wMOam52UlJd3eHlyc3RoaGlQUFFNTU5HR0c8PDy1tbijpKaFhYd+f4BkZGW8ZPMgAAAAAXRSTlMAQObYZgAAAI1JREFUGNNNj9kWwiAMRJOQ0lboXrWL2/9/pYxRy30hZ7hnAmS4naWjP72jkpk9UWGBynY7p+SqK08IRuEMRcWWBXsLqcDYhAZHBWVAxyVNT3SVjuRjEFgxCjE4EagZmBMJBEs6xdUjBTNkP/52LXWwXWDhg+hMybjDmVjmFzqqiHcB7b9/bz0dpGSw6Q3KWwSACsaitgAAAABJRU5ErkJggg==');}
			.rDropTarget {display: none; position: absolute; top: 100%; left: 0; margin-top: 10px; background: #fff; box-shadow: 0 2px 10px 0 #999; padding: 10px;}
			.right .rDropTarget {left: auto; right: 0;}
			.rDropTarget .line {width: auto;}
			.rDropTarget .line label {line-height: inherit; font-size: 13px; margin-bottom: 10px;}
			.rDropTarget button {padding: 0 30px; line-height: 33px; border: 0; text-align: center; background: none;}
			.rDropTarget button + button {margin-left: 10px;}
			.rDropTarget button.blue {color: #fff; background-color: #309ADC;}
			.rDropTarget button.blue:hover {background-color: #2F91FB;}
			.rDropTarget button.clear {padding: 0 20px 0 40px; color: #333; background: #fff url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAAMCAMAAACDd7esAAAAOVBMVEUAAAB/f39/f3+AgICAgICAgIB/f3+AgICAgIB/f39/f3+AgICAgICAgICAgICAgIB/f39/f3+AgIBjvq3KAAAAEnRSTlMABAvDq44YoZeAbvfn18ezUEywuMBjAAAATklEQVQI1zXKSxaAMAhD0UBrbes/+1+sBI+M7gNgs0Hj09F5NLHwwiBPF7kAC1nax4yNrKIiaEmr4eI/9wgTtaz51cXcrBiizmE8QcVtLwcLA5R0r3YMAAAAAElFTkSuQmCC') 15px center no-repeat;}
			.rDropTarget button.clear:hover {background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAAMCAMAAACDd7esAAAAPFBMVEUAAADfI0bfI0bUKj/fIkXfH0reI0bfI0XeIkbeI0beI0XeI0XeIkbfI0XfIkbeI0bfI0bdIUbfHz/fI0ZQr4OrAAAAE3RSTlMAw6sMjhiXgG7359fHs6OfUEwIOIYvNwAAAEtJREFUCNc9ylcWgCAUA9GhYy/Z/16Fh/p35yRQEwChBrKW1Om0UaQ1dCpClFwatJgkDyN+4ptd+Di3eOlub6889hY7xdjjgMsIJw8AoAORD3QpywAAAABJRU5ErkJggg=='); box-shadow: 0 0 0 1px #999 inset;}

			.widgetBlock {margin: 0 0 12px 0; border-radius: 3px;}
			.widgetBlock.whiteBlock {background: #fff; border: 1px solid #E8E8EA;}
			.widgetBlock.blueBlock {background: #017FBD;}
			.widgetBlock .widgetCaption {color: #7C8FA4; padding: 15px 40px 15px 20px; font-size: 15px; position: relative;}
			.widgetBlock.blueBlock .widgetCaption {color: #fff;}
			.widgetBlock .widgetCaption.showHide {cursor: pointer;}
			.widgetBlock .widgetCaption.showHide:before {
				content: '';
				display: block;
				position: absolute;
				top: 50%;
				right: 20px;
				margin-top: -3px;
				width: 9px;
				height: 6px;
				background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAGBAMAAADj6an2AAAAHlBMVEX///+rq6u7u7uwsLD6+vrv7+/q6urV1dXQ0NDFxcUS8tXRAAAAKUlEQVQI12NoDmBwUmCYaMqiaMDgJJwkHMDAoihoysAA5AQASZZSBgYAa+kE9PpKIJEAAAAASUVORK5CYII=') 0 0 no-repeat;
			}
			.widgetBlock .widgetCaption.showHide.closed:before {
				transform: rotate(180deg);
				-webkit-transform: rotate(180deg);
				-moz-transform: rotate(180deg);
				-ms-transform: rotate(180deg);
			}
			.widgetBlock .paddingBlock {
				padding: 10px 20px;
			}

			.appealInfo {
				flex: 1 auto;
				text-align: center;
				color: #fff;
			}
			.appealInfo .bigText {
				font-size: 36px;
				font-weight: bold;
			}
			.appealInfo + .appealInfo {
				border-left: 1px solid #00689D;
			}

			.calendar .month {margin:10px 0;  overflow: hidden;}
			.calendar .month h3 {font-size:14pt; text-align:center; float:left;  margin-top:-3px; position:absolute; z-index:0; width:175px; margin-left:50px; margin-right:50px; font-weight: normal; }
			.calendar .month  span { border-bottom: 1px dashed;display:block; color:#1372C5; position:relative; cursor:pointer; z-index:0}
			.calendar .month .left {float:left; text-align:left;  margin-left: 3px;}
			.calendar .month .right {float:right; text-align:right;  margin-right: 5px;}

table.calendar_tasks {
  border-collapse: collapse;
  margin: 0;
}
table.calendar_tasks td, table.calendar_tasks th {
  border: 1px solid #efefef;
  padding: 0px;
  text-align: left;
  vertical-align:top;
  width:38px;
  height:38px;
  color:#808080;
}
table.calendar_tasks td.have_task {cursor:pointer}
table.calendar_tasks td .day_block { height:40px;}
table.calendar_tasks td.today .day_block {border:1px solid #3ECCF1}
table.calendar_tasks tr td:last-child, table.calendar_tasks tr td:last-child,table.calendar_tasks tr td + td + td + td  +td + td {background-color:#f8f8f8}

table.calendar_tasks th {
  font-weight: normal;
  border-width:0;
  font-size:8.5pt;
  font-family:Tahoma;
  color:black;
  height:19px
}

table.calendar_tasks .day {
  margin:0px 3px;
  font-size:9pt;
  font-family:Tahoma;
  }
table.calendar_tasks .task {float:left; width:4px; height:4px; margin-left:2px; margin-bottom:2px; background-color:#67b6f2}
table.calendar_tasks .tasks .open {background-color:#67b6f2}
table.calendar_tasks .tasks .closed  {background-color:#c7e5ab}
table.calendar_tasks .tasks .expired  {background-color:#3ECCF1}
table.calendar_tasks .tasks .aborted  {background-color:#dedede}
table.calendar_tasks .tasks .other {  background: url("/portal_static/img/privateOffice/plus.png")}
.hide{
    display: none;
}
a.taskActionButton{
    display: inline-block;
    padding: 10px;
    background-color: #8bc24a;
    color: white;
    text-decoration: none;
    margin-right: 10px;
    margin-top: 10px;
    transition: all .3s;
    border-radius: 3px;
    cursor: pointer;
}
a.taskActionButton.forAction{
    /*background-color: #6839AB;*/
}
a.taskActionButton.forForm{
    /*background-color: #EFC62E;*/
}


a.taskActionButton:hover{
    background-color: #017fbd;
    color: white;
    text-decoration: none;
    transition: all .3s;
}
.cardTapeItemAddInfo{
    border-top: 1px solid #ECEDF1;
    padding: 10px 0;
    margin-top: 15px;
}
.buttonGlobalMetadata {
    display: none;
}
.popup{
    padding: 20px;
    text-align: center;
    font-family: 'PTSans', "Helvetica CY", "Nimbus Sans L", sans-serif;
    padding-top: 55px;
}
.popup p{
    margin-bottom: 20px;
}
.form_button{
    width: auto;
    padding: 3px 15px;
    margin-left: 10px;
    background: white;
    font-weight: normal;
    font-size: 16px;
    border: 0;
    text-shadow: none;
    line-height: 32px;
    text-align: center;
    cursor: pointer;
    transition: all .3s ease;
    border: 1px solid #D9DBDD;
    vertical-align: top;
}
.form_button:hover {
    background-color: #0092ff;
    border-color: #0092ff;
    color: white;
}
#cboxLoadedContent{
    padding: 0;
    background-image:none;
}
#cboxContent{
    margin-bottom: 0px;
}
.rightBlock{
  float: right;
}
@-moz-document url-prefix() {
    .rightBlock {
        margin-top: -32px;
    }
}
.line .rightBlock input.form_button{
    background: white;
    color: #0086bd;
    border: 1px solid #0086bd;
}
.line .rightBlock input.form_button:hover{
    background: #44b2f7;;
    color: white;
    border: 1px solid #44b2f7;;
}
.readOnly+span.overTrop, .line .inputWrap input.date.readOnly + img{
                background-color: #f2f2f2;
            }
            #cboxClose {
    border: none;
    top: 10px;
}
        </style>

        <div class="cardWrapper">
			<div class="cardButtonList">
				<!--div class="cardButton cardButtonFilters rDropWrapper right">
					<span class="rDrop">Фильтры</span>
					<div class="rDropTarget">
						<div style="width: 400px; padding: 10px 0;">
							<div class="line checkbox"><label class="checkbox"><input type="checkbox" /><i class="tick"></i><span class="overTrop"></span>Показать все</label></div>
							<div class="line checkbox"><label class="checkbox"><input type="checkbox" /><i class="tick"></i><span class="overTrop"></span> Прием заявления на получение Решения об утверждении ПД</label></div>
							<div class="line checkbox"><label class="checkbox"><input type="checkbox" /><i class="tick"></i><span class="overTrop"></span> Согласование и утверждение проекта Решения об утверждении ПД в «бумажном» виде</label></div>
							<div class="line checkbox"><label class="checkbox"><input type="checkbox" /><i class="tick"></i><span class="overTrop"></span> Внутреннее согласование проекта Решения об утверждении ПД</label></div>
						</div>
						<div style="padding:10px 0 0 25px;">
							<button class="blue">Применить</button>
							<button class="clear">Сбросить</button>
						</div>
					</div>
				</div-->

				<!--div class="cardButton cardButtonDocs tabButton"><span>Мои документы</span></div>
				<div class="cardButton cardButtonEvents tabButton active"><span>Мои события</span></div>
				<div class="cardButton cardButtonActions tabButton"><span>Мои действия</span></div-->

				<div class="clear"></div>
			</div>
            <div class="flexWrapper">
                <div class="cardLeftSide">
                    <div class="cardTape">

                    </div>
                </div>
                <div class="cardRightSide">
                    <!--div id="widgetCalendar" class="ajaxNeed" data-xslt="SECTION_EXPERT$BODY_CALENDAR"/-->
                    <!--div id="widgetAppeal" class="ajaxNeed" data-xslt="SECTION_EXPERT$BODY_APPEAL"/-->
                    <!--div id="widgetExpRecord" class="ajaxNeed" data-xslt="SECTION_EXPERT$BODY_EXPERT_RECORD"/-->
                    <!--div id="widgetGraph" class="ajaxNeed" data-xslt="SECTION_EXPERT$BODY_GRAPH"/-->
                </div>
            </div>
        </div>

		<link type="text/css" rel="stylesheet" href="/portal_static/css/ps/ricos-drop.css" />
		<script type="text/javascript" src="/static/JQueryPlugins/jquery.ricos-drop.js"></script>
		<script type="text/javascript">
        {B{FRM$XML_LAYOUT$V0.1-VALIDATE_SCRIPT}E}
 <![CDATA[
        function dateRender(date){
            var date = (date)?date:new Date();
            var monthRender = (+date.getMonth()+1).toString();
            var dateRender = date.getDate().toString();
            var dateFinalRender = ((dateRender.length<2)?'0'+dateRender:dateRender)+'.'+((monthRender.length<2)?'0'+monthRender:monthRender)+'.'+date.getFullYear();
            /*console.log(dateRender, dateRender.length, '0'+dateRender);*/
            return dateFinalRender;
            }
        function dateParseRu(dateStr) {
            var dateStr = (dateStr)?dateStr:dateRender(new Date());
            var DateArr = dateStr.split('.').reverse();
            return new Date(DateArr[0], DateArr[1]-1, DateArr[2]);
        }
        function defaultSuccessModal(message){
            var message = (message)?message:'Задача успешно выполнена';
            $('#good').remove();
            /*modalExecs++;
            console.log('modalExecs: '+modalExecs);*/
            $('body').append('<div style="display: none"><div id="good" class="popup"><h2 style="font-size: 32px; text-align: center; font-weight: bold; margin-top: 18px;">'+message+'</h2></div></div>');
            $.colorbox({inline:true, href:"#good",  width:"500px", height: "300px"});
        }
        function defaultErrorModal(data, message){
            var message = (message)?message:'Ошибка';
            var data = (data)?data:{status:'', statusText:'', responseText:''};
            $('#bad').remove();
            $('body').append('<div style="display: none"><div id="bad" class="popup"><h2 style="font-size: 32px;    font-family: sans-serif; text-align: center; font-weight: bold; margin-top: 18px;">'+message+'</h2></div></div>');
            $('#bad').append('<p>'+data.status+' '+data.statusText+'</p>');
            $('#bad').append('<pre>'+data.responseText+'</pre>');
            $.colorbox({inline:true, href:"#bad",  width:"500px", height: "500px"});
            console.log(data);
        }

			$(function() {
				$('.widgetBlock .showHide').click(function() {
					$(this).toggleClass('closed').next().stop().slideToggle(300);
				});

				$('.cardButtonFilters').ricosDrop({
					targetPosition: 'right bottom'
				});

                $(document).on('click', '.forForm', function(){
                    window.open($(this).attr('data-action'), '', 'resizable=1,scrollbars=1,width='+($(this).attr('data-width') || 1024)+',height='+($(this).attr('data-height') || 1400));
                });
                $(document).on('click', '.forAction', function(){
                    var thisHref = $(this).attr('data-action');
                    $.ajax({
                        url: thisHref,
                        type : 'GET',
                    })
                    .success(function(data){
                        defaultSuccessModal();
                    })
                    .error(function(data){
                        defaultErrorModal();
                    })
                });



                $.ajax({
                    url: 'getCardHtml.action',
                    type: 'GET',
                    data: {
                        cardId: 'SECTION_EXPERT$BODY_TASK'
                    }

                }).success(function(data){
                    $('.cardTape').html(data);
                    var today = new Date();
                    $('.cardTape .td-status .cardTapeItemCaption').each(function(indx, elm){
                        var dateText = $(elm).text();
                        console.log(today);
                        console.log(dateRender());
                        console.log(dateText);
                        console.log(dateParseRu(dateText));
                        if(dateText==dateRender()){
                            $(elm).siblings('.green').removeClass('hide');
                        }else if (dateParseRu(dateText)<today){
                            $(elm).siblings('.red').removeClass('hide');
                        }
                    });
                    $('.taskActionButton').each(function(indx, elm){
                        var thisHref = $(elm).attr('href');
                        if (/getCardHtml\.action/g.test(thisHref)){
                                $(elm).addClass('forForm')
                                $(elm).attr('data-action', thisHref);
                                $(elm).removeAttr('href');
                            }
                        if (/\/customactions\//g.test(thisHref)){
                                $(elm).addClass('forAction')
                                $(elm).attr('data-action', thisHref);
                                $(elm).removeAttr('href');
                            }
                    });
                });

                $('.ajaxNeed').each(function(indx, elm){
                    if ($(elm).attr('data-xslt')){
                        $.ajax({
                            url: 'getCardHtml.action',
                            type: 'GET',
                            data: {
                                cardId: $(elm).attr('data-xslt')
                            }
                        }).success(function(data){
                            $(elm).html(data);
                        });
                    }
                });



				/*$('.showHide').click(function() {
					var $t = $(this),
						$container = $t.parent(),
						$target = $container.find('.showHideTarget');

					$(document).click(function(e) {
						if($(e.target).closest($container).length) return;
						$target.hide();
						e.stopPropagation();
					});

					$target.toggle();
				});*/
			});
            ]]>
		</script>

        <XML class="body" style="display:none;"><xsl:copy-of select="."/></XML>

    </xsl:template>
</xsl:stylesheet>
