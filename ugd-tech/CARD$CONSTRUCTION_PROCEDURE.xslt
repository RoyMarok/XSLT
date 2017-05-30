<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
   <xsl:output method="html" encoding="utf-8" indent="no"/>
	<xsl:variable name="DATA">
      <xsl:copy-of select="/"/>
    </xsl:variable>

	<xsl:variable name="STYLES">
    </xsl:variable>

    <xsl:template match="/">

<div class="headerBlock">
	<div class="headerBlock__content tabs_content">
		<xsl:if test="//DEV_PROC_OPERATOR//DEV_PROC_OPERATOR = 1">
		<xsl:variable name="procedureid">
			<xsl:value-of select="//CONSTRUCTION_PROCEDURE//ID"/>
		</xsl:variable>
		<div class="gears_settings">
			<ul class="showSubMenu">

				<li class="openWinBtn">
					<a href="getCardHtml.action?cardId=FORM$CONSTRUCTION_PROCEDURE&amp;documentId={$procedureid}">Редактировать процедуру</a>
				</li>
				<li class="openWinBtn">
					<a href="getCardHtml.action?cardId=FORM$PROCEDURE_VARIANT&amp;PROC_ID={$procedureid}">Добавить вариант процедуры</a>
				</li>
				<li class="openWinBtn brunchlinktochange">
					<a href="" data-link-base="getCardHtml.action?cardId=FORM$PROCEDURE_VARIANT&amp;documentId">Редактировать вариант процедуры</a>
				</li>
                <li class="openWinBtn">
					<a href="javascript:void(0);" data-link-to-confirm="submit/simpleSubmit.action?action=CON_PROC$DELETE&amp;PROC_ID={$procedureid}" class="warning_proc">Удалить процедуру</a>
				</li>
                <li class="openWinBtn brunchlinktochange">
					<a href="" data-link-base="submit/simpleSubmit.action?action=PROC_BRANCH$DELETE&amp;BRANCH_ID">Удалить вариант процедуры</a>
				</li>
			</ul>
		</div>
		</xsl:if>
		<h1><xsl:value-of select="//CONSTRUCTION_PROCEDURE//CODE"/>.<xsl:value-of select="//CONSTRUCTION_PROCEDURE//PROC_NAME"/></h1>
        <xsl:if test="//BASE_DOCS//BASE_DOC">
            <div class="headerBlock__baseDoc">основание: <xsl:for-each select="//BASE_DOCS//BASE_DOC"><xsl:value-of select="DOC_NAME"/>&nbsp;<xsl:value-of select="DOC_NUMBER"/>&nbsp;от <xsl:value-of select="DOC_DATE"/>&nbsp;<xsl:if test="DOC_ARTICLE">статья <xsl:value-of select="DOC_ARTICLE"/></xsl:if> | </xsl:for-each> </div>
		</xsl:if>
	</div>
</div>

<xsl:if test="//PROCEDURE_BRANCHS//PROCEDURE_BRANCH//ID != ''">
<div class="procedureTabs tabs_content">
	<div class="procedureTabs__tabSelect">
		<xsl:for-each select="//PROCEDURE_BRANCHS//PROCEDURE_BRANCH">
			<xsl:variable name="active">
				<xsl:if test="CURRENT_BRANCH = 1">
					active
				</xsl:if>
			</xsl:variable>
			<div class="procedureTabs__thisTab {$active}"><span class="procedureTabs__tabLink" data-tab-link="{ID}"><xsl:value-of select="CODE"/>. <xsl:value-of select="BRANCH_NAME"/></span></div>
		</xsl:for-each>
	</div>
	<div class="procedureTabs__tabContent">
		<xsl:for-each select="//PROCEDURE_BRANCHS//PROCEDURE_BRANCH">
			<xsl:sort select="SORT_NUMBER"/>
			<div class="procedureTabs__tab" data-tab-id="{ID}">
				<xsl:if test="PROC_BRANCH_PARAMS_GROUPS != ''">
					<div class="procedureTabs__info">
						<xsl:for-each select="PROC_BRANCH_PARAMS_GROUPS//PROC_BRANCH_PARAMS_GROUP">
							<xsl:value-of select="GROUP_NAME"/><br/>
						</xsl:for-each>
					</div>
				</xsl:if>
                <xsl:if test="PROC_BRANCH_REGULATION_DOCS//PROC_BRANCH_REGULATION_DOC or PROC_BRANCH_BASE_DOCS//PROC_BRANCH_BASE_DOC">
				<div class="procedureTabs__baseAndReg">

                    <xsl:if test="PROC_BRANCH_REGULATION_DOCS//PROC_BRANCH_REGULATION_DOC">
                    <div class="procedureTabs__reglamentDoc procedureTabs__leftSide">порядок: <br/>
					<ul>
					<xsl:for-each select="PROC_BRANCH_REGULATION_DOCS//PROC_BRANCH_REGULATION_DOC">
						<xsl:variable name="doc">
							<xsl:value-of select="DOC_NAME"/>
							<xsl:if test="DOC_NUMBER">&nbsp;№<xsl:value-of select="DOC_NUMBER"/></xsl:if>
							<xsl:if test="DOC_DATE">&nbsp;от&nbsp;<xsl:value-of select="DOC_DATE"/></xsl:if>
							<xsl:if test="DOC_ARTICLE">&nbsp;статья&nbsp;<xsl:value-of select="DOC_ARTICLE"/></xsl:if>
						</xsl:variable>
						<li>

							<xsl:choose>
								<xsl:when test="DOC_LINK">
									<a href="{DOC_LINK}"><xsl:value-of select="$doc"/></a>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$doc"/>
								</xsl:otherwise>
							</xsl:choose>

						</li>
					</xsl:for-each>
					</ul>
					</div>
                    </xsl:if>

                    <xsl:if test="PROC_BRANCH_BASE_DOCS//PROC_BRANCH_BASE_DOC">
					<div class="procedureTabs__baseDoc procedureTabs__rightSide">основание: <br/>
					<ul>
					<xsl:for-each select="PROC_BRANCH_BASE_DOCS//PROC_BRANCH_BASE_DOC">
						<xsl:variable name="doc">
							<xsl:value-of select="DOC_NAME"/>
							<xsl:if test="DOC_NUMBER">&nbsp;№<xsl:value-of select="DOC_NUMBER"/></xsl:if>
							<xsl:if test="DOC_DATE">&nbsp;от&nbsp;<xsl:value-of select="DOC_DATE"/></xsl:if>
							<xsl:if test="DOC_ARTICLE">&nbsp;статья&nbsp;<xsl:value-of select="DOC_ARTICLE"/></xsl:if>
						</xsl:variable>
						<li>

							<xsl:choose>
								<xsl:when test="DOC_LINK">
									<a href="{DOC_LINK}"><xsl:value-of select="$doc"/></a>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$doc"/>
								</xsl:otherwise>
							</xsl:choose>

						</li>
					</xsl:for-each>
					</ul>
					</div>
                    </xsl:if>
				</div>
                </xsl:if>
				<div class="procedureTabs__details">
					<div class="procedureTabs__header">Порядок проведения</div>
					<div class="procedureTabs__contentTable">
						<div class="procedureTabs__contentTableRow">
							<div class="procedureTabs__leftSide procedureTabs__leftSide_spaceFiller"><span>ОИВ, осуществляющий проведение</span></div>
							<div class="procedureTabs__rightSide">

							<xsl:for-each select="PROC_RESPONSIBLE_AUTHORITIES//PROC_RESPONSIBLE_AUTHORITY">
								<div><strong><xsl:value-of select="NAME"/></strong></div>
							</xsl:for-each>

							</div>
						</div>
						<div class="procedureTabs__contentTableRow">
							<div class="procedureTabs__leftSide procedureTabs__leftSide_spaceFiller"><span>Инициатор процедуры</span></div>
							<div class="procedureTabs__rightSide"><xsl:value-of select="PROC_INITIATORTYPE"/></div>
						</div>
						<div class="procedureTabs__contentTableRow">
							<div class="procedureTabs__leftSide procedureTabs__leftSide_spaceFiller"><span>Срок проведения</span></div>
							<div class="procedureTabs__rightSide"><span class="daysDuration"><xsl:value-of select="DAYS_DURATION"/></span>  &nbsp; <xsl:value-of select="DAY_TYPE"/></div>
						</div>
						<div class="procedureTabs__contentTableRow">
							<div class="procedureTabs__leftSide procedureTabs__leftSide_spaceFiller"><span>Стоимость</span></div>
							<div class="procedureTabs__rightSide"><xsl:value-of select="PROC_PAYMENT"/> <br/><xsl:value-of select="COST"/></div>
						</div>
						<div class="procedureTabs__contentTableRow">
							<div class="procedureTabs__leftSide procedureTabs__leftSide_spaceFiller"><span>Способ подачи документов</span></div>
							<div class="procedureTabs__rightSide">
								<ul>
								<xsl:for-each select="PROC_DOCS_SUBMISSION_TYPES//PROC_DOCS_SUBMISSION_TYPE">
									<li>
										<xsl:attribute name="class">
											<xsl:if test="ISCHECKED = 1">
												checked
											</xsl:if>
										</xsl:attribute>
										<xsl:value-of select="NAME"/>
									</li>
								</xsl:for-each>
								</ul>
							</div>
						</div>
						<div class="procedureTabs__contentTableRow">
							<div class="procedureTabs__leftSide procedureTabs__leftSide_spaceFiller"><span>Результат проведения процедуры</span></div>
							<div class="procedureTabs__rightSide"><xsl:value-of select="RESULT_DOC_NAME"/></div>
						</div>
						<xsl:if test="DESCRIPTION">
						<div class="procedureTabs__contentTableRow">
							<div class="procedureTabs__leftSide procedureTabs__leftSide_spaceFiller"><span>Дополнение</span></div>
							<div class="procedureTabs__rightSide"><xsl:value-of select="DESCRIPTION"/></div>
						</div>
						</xsl:if>
					</div>
				</div>
				<xsl:if test="PROC_REQUIRED_DOCS//PROC_REQUIRED_DOC">
				<div class="procedureTabs__details">
					<div class="procedureTabs__header">Перечень документов для проведения процедуры</div>
					<div class="procedureTabs__contentTable">
						<div class="procedureTabs__contentTableRow procedureTabs__contentTableRow_smallTHead">
							<div class="procedureTabs__leftSide">Наименование документа</div>
							<div class="procedureTabs__rightSide">Где получить документ</div>
						</div>
						<xsl:for-each select="PROC_REQUIRED_DOCS//PROC_REQUIRED_DOC">
						<div class="procedureTabs__contentTableRow procedureTabs__contentTableRow_rowHighLight">
							<div class="procedureTabs__leftSide procedureTabs__leftSide_counter"><xsl:value-of select="DOC_NAME"/></div>
							<div class="procedureTabs__rightSide">
                            <xsl:for-each select="PROCEDURES//PROCEDURE">
                                <xsl:value-of select="NAME"/><br/>
                            </xsl:for-each>
							<xsl:if test="CON_PROC_LINK">
								<br/><a>
								<xsl:attribute name="href">
									<xsl:value-of select="CON_PROC_LINK"/>
								</xsl:attribute>
								Описание процедуры
								</a>
							</xsl:if>
							</div>
						</div>
						</xsl:for-each>
					</div>
				</div>
				</xsl:if>
				<xsl:if test="PROC_REFUSAL_REASONS//PROC_REFUSAL_REASON or PROC_STOP_REASONS//PROC_STOP_REASON">
				<div class="procedureTabs__details">
					<div class="procedureTabs__header">Отказ / приостановка процедуры</div>
					<div class="procedureTabs__contentTable">
					<xsl:if test="PROC_REFUSAL_REASONS//PROC_REFUSAL_REASON">
						<div class="procedureTabs__contentTableRow">
						<div class="procedureTabs__leftSide procedureTabs__leftSide_spaceFiller"><span>Причины отказа</span></div>
						<xsl:for-each select="PROC_REFUSAL_REASONS//PROC_REFUSAL_REASON">

							<div class="procedureTabs__rightSide"><strong><xsl:value-of select="NAME"/></strong>
							<xsl:if test="COMMENT">
								<br/><span class="comment"><xsl:value-of select="COMMENT"/></span>
							</xsl:if>
							</div>
						</xsl:for-each>
						</div>
					</xsl:if>
					<xsl:if test="PROC_STOP_REASONS//PROC_STOP_REASON">
						<div class="procedureTabs__contentTableRow">
							<div class="procedureTabs__leftSide procedureTabs__leftSide_spaceFiller"><span>Причины приостановки</span></div>
						<xsl:for-each select="PROC_STOP_REASONS//PROC_STOP_REASON">
							<div class="procedureTabs__rightSide"><strong><xsl:value-of select="NAME"/></strong>
							<xsl:if test="COMMENT">
								<br/><span class="comment"><xsl:value-of select="COMMENT"/></span>
							</xsl:if>
							</div>
						</xsl:for-each>
						</div>
					</xsl:if>
					</div>
				</div>
				</xsl:if>
			</div>
		</xsl:for-each>
	</div>
</div>
</xsl:if>

<xml style="display: none">
  <xsl:copy-of select="*"/>
</xml>
<script src="https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js"/>
<script>
function makeLastLink(inId){
	if (inId){
		$('.brunchlinktochange').show();
		$('.brunchlinktochange a').each(function(indx, elm){
            $(elm).attr('href', $(elm).attr('data-link-base')+'='+inId);
        });

	} else {
		$('.brunchlinktochange').hide();
	}
}
function monthReplace(inStr){
    inStr = inStr.replace(/Январь/g, 'января');
    inStr = inStr.replace(/Февраль/g, 'февраля');
    inStr = inStr.replace(/Март/g, 'марта');
    inStr = inStr.replace(/Апрель/g, 'апреля');
    inStr = inStr.replace(/Май/g, 'мая');
    inStr = inStr.replace(/Июнь/g, 'июня');
    inStr = inStr.replace(/Июль/g, 'июля');
    inStr = inStr.replace(/Август/g, 'августа');
    inStr = inStr.replace(/Сентябрь/g, 'сентября');
    inStr = inStr.replace(/Октябрь/g, 'октября');
    inStr = inStr.replace(/Ноябрь/g, 'ноября');
    inStr = inStr.replace(/Декабрь/g, 'декабря');
    return inStr;
}
$(function(){
	if (isNaN(parseInt($('.daysDuration').text()))){
		var $durationClone = $('.daysDuration').clone();
		$('.daysDuration').parent('.procedureTabs__rightSide').html($durationClone);
	}
	$('.procedureTabs__thisTab').click(function(){
		$(this).parent().children().removeClass('active');
		$(this).addClass('active');
		var tabLinkId = $(this).find('.procedureTabs__tabLink').attr('data-tab-link');
		console.log(tabLinkId);
		$('.procedureTabs__tabContent .procedureTabs__tab').fadeOut('fast');
		$('.procedureTabs__tabContent .procedureTabs__tab[data-tab-id="'+tabLinkId+'"]').fadeIn('slow');
		makeLastLink(tabLinkId);
	});
	if ($('.procedureTabs__thisTab.active').length == 0) {
		$('.procedureTabs__thisTab').eq(0).addClass('active');
		$('.procedureTabs__tabContent .procedureTabs__tab:not(:first-child)').hide();
		var tabLinkId = $('.procedureTabs__thisTab.active').find('.procedureTabs__tabLink').attr('data-tab-link');
		makeLastLink(tabLinkId);
		} else{
			var tabLinkId = $('.procedureTabs__thisTab.active').find('.procedureTabs__tabLink').attr('data-tab-link');
			$('.procedureTabs__tabContent .procedureTabs__tab').hide();
			$('.procedureTabs__tabContent .procedureTabs__tab[data-tab-id="'+tabLinkId+'"]').show();
			makeLastLink(tabLinkId);
			console.log(tabLinkId);
		}

	$('.headerBlock__baseDoc').text($('.headerBlock__baseDoc').text().slice(0, -3));

	$('.gears_settings').on('touchstart', function(){
		$(this).removeClass('active');
		$(this).addClass('active');
	}).on('touchend', function(){
		$(this).removeClass('active');
	});

	$(':not(.gears_settings), :not(.gears_settings ul.showSubMenu)').on('touchstart', function(){
		$('.gears_settings').removeClass('active');
	}).on('touchend', function(){
		$('.gears_settings').removeClass('active');
	});
    $('.warning_proc').click(function(){
        if (confirm('Удаление процедуры удалит все ветки')){
            $(this).attr('href', $(this).attr('data-link-to-confirm'));
            $(this).removeClass('warning_proc').click();
        }
    });
    setTimeout(function(){
        if ($('.headerBlock__baseDoc').length>0){
            $('.headerBlock__baseDoc').html(monthReplace($('.headerBlock__baseDoc').html()));
        }
        if ($('.procedureTabs__baseAndReg').length>0){
            $('.procedureTabs__baseAndReg').html(monthReplace($('.procedureTabs__baseAndReg').html()));
        }
    }, 1000);


});
</script>

<style>
/*! normalize.css v4.1.1 | MIT License | github.com/necolas/normalize.css */
html{font-family:sans-serif;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}body{margin:0}article,aside,details,figcaption,figure,footer,header,main,menu,nav,section,summary{display:block}audio,canvas,progress,video{display:inline-block}audio:not([controls]){display:none;height:0}progress{vertical-align:baseline}template,[hidden]{display:none}a{background-color:transparent;-webkit-text-decoration-skip:objects}a:active,a:hover{outline-width:0}abbr[title]{border-bottom:none;text-decoration:underline;text-decoration:underline dotted}b,strong{font-weight:inherit}b,strong{font-weight:bolder}dfn{font-style:italic}h1{font-size:2em;margin:0.67em 0}mark{background-color:#ff0;color:#000}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sub{bottom:-0.25em}sup{top:-0.5em}img{border-style:none}svg:not(:root){overflow:hidden}code,kbd,pre,samp{font-family:monospace, monospace;font-size:1em}figure{margin:1em 40px}hr{box-sizing:content-box;height:0;overflow:visible}button,input,select,textarea{font:inherit;margin:0}optgroup{font-weight:bold}button,input{overflow:visible}button,select{text-transform:none}button,html [type="button"],[type="reset"],[type="submit"]{-webkit-appearance:button}button::-moz-focus-inner,[type="button"]::-moz-focus-inner,[type="reset"]::-moz-focus-inner,[type="submit"]::-moz-focus-inner{border-style:none;padding:0}button:-moz-focusring,[type="button"]:-moz-focusring,[type="reset"]:-moz-focusring,[type="submit"]:-moz-focusring{outline:1px dotted ButtonText}fieldset{border:1px solid #c0c0c0;margin:0 2px;padding:0.35em 0.625em 0.75em}legend{box-sizing:border-box;color:inherit;display:table;max-width:100%;padding:0;white-space:normal}textarea{overflow:auto}[type="checkbox"],[type="radio"]{box-sizing:border-box;padding:0}[type="number"]::-webkit-inner-spin-button,[type="number"]::-webkit-outer-spin-button{height:auto}[type="search"]{-webkit-appearance:textfield;outline-offset:-2px}[type="search"]::-webkit-search-cancel-button,[type="search"]::-webkit-search-decoration{-webkit-appearance:none}::-webkit-input-placeholder{color:inherit;opacity:0.54}::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}

div{
	vertical-align: top;
	position: relative;
	box-sizing: border-box;
}

a, a:hover, a:visited{
	color: #4364C8;
	text-decoration: none;
	transition: color .3s;
}
a:hover{
	color: #3651a1;
	color: #e13168;
	transition: color .3s;
}

#secondMenu, #headerButtons, #tabs-container
{
	display: none;
}

div.envelope{
	max-width: inherit;
    padding: 0;
}
html{
	font-family: 'PT Sans Regular', 'PT Sans', sans-serif;
	font-size: 100%;
	color: #333;
	background-color: #F7F7F7;
}
.procedureTabs{
	 font-size: 1rem;

}
ul{
	list-style-type: none;
	margin: 0;
	padding: 0;
}
.tabs_content{
	width: 1350px;
	width: 1310px;
	margin: 0 auto;
}
.headerBlock{
	background-color: #4A5666;
	color: white;
	padding-top: 30px;
	padding-bottom: 40px;
	min-width: 1310px;
}
.headerBlock__content{
	padding-left: 20px;
}
.headerBlock h1{
	font-size: 1.5rem;
	text-transform: uppercase;
}
.headerBlock__baseDoc{
	font-size: 0.8125rem;
}
.procedureTabs__header{
	font-size: 1.25rem;
	margin-bottom: 25px;
	font-weight: 700;
}
.procedureTabs__thisTab{
	width: 340px;
	padding: 14px;
	padding-left: 38px;
	border-radius: 3px 0 0 3px;
	background-color: transparent;
	cursor: pointer;
	font-size: 0.8125rem;
	transition: all .25s;
}
.procedureTabs__thisTab:hover{
	background-color: #EDF0F5;
	transition: all .25s;
}
.procedureTabs__thisTab.active{
	background-color: white;
	border-width: 1px;
    border-style: solid;
    border-color: #E6E7EB;
	font-weight: 700;
	z-index: 20;
	border-right: none;
	transition: none;
}
.procedureTabs__thisTab:before{
	content: '';
	background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJAAAACQBAMAAAAVaP+LAAAAG1BMVEUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACUUeIgAAAACHRSTlMASPgItbkJgNXr+lQAAAD+SURBVGje7c4xCgJBEETREcFYvIGZ4QaKBzDZfJO9gCfwBqLQxzZxqIFioHfLzPppNfQrzjnnnHPOOef+sd2jv12Hku/+6l5v52kBaI5bb7vEe8iDIiqJQRHTAlBUEoMCpAQIJAaBlACBRCCQEiCQGJQnjRGVxKDvk5LpEJXUA8WxZNqcKqkHeu6LQmJQniSAiCSAmMQghbQdAZJIZwItIwkgIhFIIBFoBUkAEYlA60gEEkgtSCK1IIXUgiRSC5JIDUgjiSCQABJJAGkkgEQSQBoJIJEEkEYCSCQBJJIAUkkAiSSAVBJAIgkglQSQSAJIJO2Lc84555xzzjn3qz5xoBK48EfmQwAAAABJRU5ErkJggg==') no-repeat;
	position: absolute;
	width: 21px;
	height: 21px;
	opacity: 0.3;
	transform: rotate(270deg);
	transition: all .25s;
	background-size: contain;
	margin-left: -28px;
	margin-top: -3px;
}
.procedureTabs__thisTab.active:before{
	opacity: .6;
	transform: rotate(180deg);
	transition: all .25s;
}

.inactive{
	color: #D8DDE5;
}
.procedureTabs__tabSelect{
	display: inline-block;
    margin-right: -4px;
    margin-right: 0;
}
.procedureTabs__tabContent{
	padding: 14px;
	overflow: hidden;
	border-radius: 3px;
	-moz-box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.35);
    -webkit-box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.35);
    box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.35);
	background-color: white;
	width: 968px;
	margin-top: -33px;
	display: inline-block;

}
.procedureTabs__info{
	background-color: #FFFAE6;
	padding: 20px;
	margin: -14px;
	margin-bottom: 0;
	font-size: 0.8125rem;
}
.procedureTabs__info+.procedureTabs__details{
    margin-top: 14px;
}
.procedureTabs__baseAndReg{
	padding: 17px;
	min-height: 85px;
	font-size: 0.8125rem;
}
.procedureTabs__reglamentDoc,
.procedureTabs__baseDoc
{
	padding-left: 63px;
}
.procedureTabs__reglamentDoc:before{
	content: '';
	position: absolute;
	width: 48px;
	height: 48px;
	background-image: url('data:image/png;base64,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');
	margin-left: -63px;
}
.procedureTabs__baseDoc:before{
	content: '';
	position: absolute;
	width: 48px;
	height: 48px;
	background-image: url('data:image/png;base64,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');
	margin-left: -63px;
}
.procedureTabs__reglamentDoc:before,
.procedureTabs__baseDoc:before{
	transition: all .3s ease;
	border-radius: 50%;
	border: 1px solid rgba(0,0,0,0);
	background-repeat: no-repeat;
}
.procedureTabs__reglamentDoc:hover:before,
.procedureTabs__baseDoc:hover:before{
	transition: all .3s ease;
	/*border: 1px solid rgba(0,0,0,1);
	box-shadow: 0 0 10px rgba(0,0,0,0.5);*/
}
.procedureTabs__details{
	width: 940px;
	/*box-sizing: border-box;*/
    border-width: 1px;
    border-style: solid;
    border-color: #E6E7EB;
    border-radius: 3px;
	padding: 1.25rem;
}
.procedureTabs__details+.procedureTabs__details{
	margin-top: 14px;
}
.procedureTabs__contentTable {
	counter-reset: number_list;
}
.procedureTabs__contentTableRow:not(:last-child){
	margin-bottom: 20px;
}
.procedureTabs__contentTableRow.procedureTabs__contentTableRow_smallTHead{
	color: #A1ADBB;
	font-size: 0.8125rem;
	margin-bottom: 5px;
}
.procedureTabs__contentTableRow_smallTHead .procedureTabs__leftSide{
	padding-left: 28px;
}
.procedureTabs__contentTableRow.procedureTabs__contentTableRow_rowHighLight{
	cursor: pointer;
	padding: 14px 0;
	margin-bottom: 0;
	transition: all .25s;
}
.procedureTabs__contentTableRow_rowHighLight:hover{
	background-color: #EEF3F6;
	transition: all .25s;
}

.procedureTabs__leftSide_counter{
	padding-left: 28px;
}
.procedureTabs__leftSide_counter:before {
	counter-increment: number_list;
	content: counter(number_list) ". ";
	position: absolute;
	margin-left: -20px;
}
.procedureTabs__leftSide,
.procedureTabs__rightSide{
	display: inline-block;
}
.procedureTabs__leftSide{
	width: 392px;
	margin-right: 8px;
}
.procedureTabs__rightSide{
	width: 492px;
}
.procedureTabs__rightSide .comment{
	color: #A1ADBB;
}
.procedureTabs__contentTableRow .procedureTabs__rightSide ul li:not(.checked){
	color: #D8DDE5;
}
.procedureTabs__rightSide ul li.checked{
	font-weight: 700;
}
.procedureTabs__rightSide ul li.checked:after{
	content: '';
	width: 14px;
	height: 10px;
	position: absolute;
	background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAKCAMAAACzB5/1AAAAOVBMVEUAAABqvz9gvEZgu0dhu0ZhvEdfv0pgu0dgvEZgvEdhvEdfukZhuEZhvUZhvUZhu0dfukZhu0hhvEfh3BLkAAAAEnRSTlMADMGp6dYY87mziWomn5eAcDz9kY4TAAAAR0lEQVQIHQXBhQHDQAAAIT5utdt/2AIAxjkPALa1JgDbWk18jg3PUk3Dq9bHb6nOwVEt917NMKaq6g2MuaoLwFx9AXDtN+AP71MDad+HQgoAAAAASUVORK5CYII=') no-repeat;
	margin-top: 3px;
    margin-left: 5px;
}
.procedureTabs__leftSide_spaceFiller{
	background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAMAAAABAQMAAAAhLob3AAAABlBMVEUAAADY3eXCC3DiAAAAAXRSTlMAQObYZgAAAApJREFUCNdjaAAAAIIAgd1DavQAAAAASUVORK5CYII=') repeat-x;
	background-position: 0% 84%;
}
.procedureTabs__leftSide_spaceFiller span{
	background-color: white;
	padding-right: 4px;
}

div.headerNav div.search a.tabName{
	top: 0;
	z-index: 300;
}
div.headerNav div.search .inputTextWrapper{
	position: relative;
}
.gears_settings{
	float: right;
    width: 270px;
    height: 21px;
    cursor: pointer;
	margin-top: 5px;
}
.gears_settings:after{
	content: '';
	display: block;
	background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAVCAMAAABxCz6aAAAAclBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////9eWEHEAAAAJXRSTlMA8eyQgauLhm9pt66fmFs1I/bWzsnEp3p1TBUN5du7uqZJLw8GopT40wAAAJ9JREFUGBllwQdugwAQAMG16dgU95ae7P+/mMOQSIgZJtU6VMxlhg1zhaHg37aE/mQ4fsEtJaRa504uiV7h7sKDkwsb1o7Ot8/GCfdmZ0gIpYP3DkjVNU97NWFQqQeePtSKQa6ueHpVU6A/O9gSUsMqf7BzVLdt5uiF2oU93y70cNFt7iR504aQtNAdDMcOrpsf/hSGgrnMkDFXrkLJ6Bc4ex+U9f0gfQAAAABJRU5ErkJggg==');
	transition: all .5s ease;
	width: 20px;
    height: 21px;
	margin-left: 248px;
}
.gears_settings:hover:after{
	transform: rotate(180deg);
	transition: all .5s ease;
}

.gears_settings:hover ul.showSubMenu,
.gears_settings.active ul.showSubMenu,
ul.showSubMenu:hover{
	display: block;
}
ul.showSubMenu {
    position: absolute;
    list-style: none;
    border: 1px solid #dfe0e1;
    border: none;
    padding: 5px 0px;
    margin-top: 21px;
    /*left: -250px;*/
    background: white;
    z-index: 25;
    box-shadow: 0 3px 5px 0 rgba(0,0,0,0.2);
	min-width: 268px;
}
ul.showSubMenu li {
    white-space: nowrap;
    padding: 0 35px;
    line-height: 33px;
    text-align: left;
	transition: all .25s ease;
}
ul.showSubMenu li:hover{
	background-color: #4A5666;
}
ul.showSubMenu li:hover,
ul.showSubMenu li:hover a
 {
	color: white;
	transition: all .25s ease;
}
.showSubMenu a, .subMenu a {
    color: #595959;
}
</style>
    </xsl:template>
</xsl:stylesheet>
