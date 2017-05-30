
<xsl:template name="common_header">

<div class="headerWrap" id="header">
	<div class="headerNav">
		<xsl:call-template name="tmpl_header"/>
		<div class="goToPageUp">
			<span title="Наверх" onclick="window.scroll(0,0);" class="simpleBtn"><img src="/portal_static/img/icons/arrowTop.png" /></span>
		</div>
		<div class="buttonGroup">
			<ul>
				<li>
					<span><div class="contactBlock">
							<div class="smallText">Техническая поддержка по электронным услугам</div>
							<div class="iconText mailText"><a href="mailto:help.uslugi@mdi.ru">help.uslugi@mdi.ru</a></div>
							<div class="iconText phoneText">+7 (499) xxx-xx-xx</div>
						</div>
					</span>
				</li>
			</ul>
		</div>
	</div>
</div>

</xsl:template>
