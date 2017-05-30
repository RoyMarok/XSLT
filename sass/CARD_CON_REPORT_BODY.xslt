<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    <xsl:output method="html" encoding="utf-8" indent="no"/>

	<xsl:variable name="LAYOUT">

		<xsl:if test="//FILES/ROW[1]/FILE_CARD_ID !=''">
			{B{CARD$GALLERY_STYLES}E}
			<link type="text/css" rel="stylesheet" href="/portal_static/css/ps/fileBaloon.css"/>
			<div class="files_block pdoc-right-side">
				<div class="content">
					<xsl:if test="//FILES/ROW[1]/FILE_PAGECOUNT &gt; 0">
					  <p class="sectionTitle">Галерея документа</p>
					  <div class="gallery-right">
						<a href="#" class="main-image" data-images-count="{//FILES/ROW[1]/FILE_PAGECOUNT}" data-id="{//FILES/ROW[1]/FILE_CARD_ID}">
						  <img src="" alt="" rel="galleryRight" page="{//FILES/ROW[1]/FILE_CARD_ID}"/>
						</a>
						<xsl:if test="//FILES/ROW[1]/FILE_PAGECOUNT &gt; 0">
						  <div class="other-images">
							<div class="wrp-images">
							  <xsl:for-each select="//FILES/ROW[1]">
								<div class="wrp-images-group" data-images-count="{FILE_PAGECOUNT}" data-id="{FILE_CARD_ID}"></div>
							  </xsl:for-each>
							</div>
						   </div>
						</xsl:if>
					   </div>
					</xsl:if>

					<div class="preview-wrapper">
						<xsl:for-each select="//FILES/ROW">
							<xsl:call-template name="file_transform">
							  <xsl:with-param name="pageCount" select="FILE_PAGECOUNT"/>
							  <xsl:with-param name="fileName" select="FILE_NAME"/>
							  <xsl:with-param name="cardId" select="FILE_CARD_ID"/>
							  <xsl:with-param name="fileSize" select="FILE_LENGTH"/>
							  <xsl:with-param name="fkID" select="FILE_CARD_ID"/>
							  <xsl:with-param name="ecp" select="FILE_ECP"/>
							</xsl:call-template>
						</xsl:for-each>
					</div>
				</div>
			</div>
		</xsl:if>

		<layout:block>
			<layout:header>
				<layout:element type="text" value="Реквизиты акта"/>
			</layout:header>
			<div class="cat ">
				<div class="key"><span>Номер акта</span></div>
				<div class="value"><xsl:value-of select="//REPORT//DOC_NUMBER"/> от <xsl:value-of select="//REPORT//DOC_DATE"/></div>
			</div>
		</layout:block>


		<layout:block>
			<layout:header>
				<layout:element type="text" value="Стоимость"/>
			</layout:header>
      <xsl:if test="//INVICE_ITEMS != ''">
			<table class="tableCardStyle">
				<thead>
					<tr>
						<th>Предмет счета</th>
						<th>Количество</th>
						<th>Цена</th>
						<th>Стоимость</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="//INVICE_ITEMS//ROW">
						<tr>
							<td class="td-center"><xsl:value-of select="NAME"/></td>
							<td class="td-center"><span class="quantity"><xsl:value-of select="ITEM_COUNT"/></span></td>
							<td class="td-center"><span class="numberFormat priceForPiece" data-format="rub"><xsl:value-of select="ITEM_PRICE"/></span></td>
							<td class="td-center"><span class="numberFormat invoce_item_sum_field" data-format="rub"><xsl:value-of select="INVICE_SUM"/></span></td>
						</tr>
					</xsl:for-each>
					<tr>
						<td class="td-center"><span class="text-bold">ИТОГО</span></td>
						<td class="td-center" colspan="3"><span class="numberFormat doc_sum_field" data-format="rub"><xsl:value-of select="//REPORT//DOC_SUM"/></span></td>
					</tr>
				</tbody>
			</table>
      </xsl:if>
			<div class="cat">
				<div class="key"><span>Стоимость по договору</span></div>
				<div class="value"><span class="numberFormat" data-format="rub"><xsl:value-of select="//REPORT//DOGOVOR_SUM_TOTAL"/></span></div>
			</div>
			<div class="cat">
				<div class="key"><span>В том числе НДС</span></div>
				<div class="value"><span class="numberFormat" data-format="rub"><xsl:value-of select="//REPORT//DOGOVOR_SUM_VAT"/></span></div>
			</div>
		</layout:block>


		<xsl:if test="count(//CONTACT_MEMBERS//ROW) &gt; 0">

		<layout:block>
			<layout:header>
				<layout:element type="text" value="Стороны документа"/>
			</layout:header>

			<table class="tableCardStyle">
				<thead>
					<tr>
						<th>Роль органиации</th>
						<th>Организация</th>
						<th>Представитель</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="//CONTACT_MEMBERS//ROW">
						<tr>
							<td><xsl:value-of select="CM_NSI_COMPANY_ROLE_TEXT"/></td>
							<td>
								<xsl:choose>
									<xsl:when test="CON_NSI_COMPANY_FORM != 'ФЛ'">
										<a href=""><xsl:value-of select="CON_FULL_NAME"/></a><xsl:element name="br"/>
										<b>Юридический адрес: </b> <xsl:value-of select="CON_ADDRESS_LEGAL"/><xsl:element name="br"/>
										<b>Фактический адрес: </b> <xsl:value-of select="CON_ADDRESS_POST"/><xsl:element name="br"/>
										<xsl:element name="br"/>
										<b>ИНН: </b> <xsl:value-of select="CON_INN"/><xsl:element name="br"/>
										<b>КПП: </b> <xsl:value-of select="CON_KPP"/><xsl:element name="br"/>
										<b>ОГРН: </b> <xsl:value-of select="CON_OGRN_NUMBER"/><xsl:element name="br"/>
										<b>ОКПО: </b> <xsl:value-of select="CON_OKPO"/><xsl:element name="br"/>
										<xsl:element name="br"/>
										<b>Отделение банка: </b> <xsl:value-of select="BANK_NAME"/>, <xsl:value-of select="BANK_ADDRESS"/><xsl:element name="br"/>
										<b>Расчетный счет: </b> <xsl:value-of select="BANK_ACCOUNT_SET"/><xsl:element name="br"/>
										<b>Корреспондентский счет: </b> <xsl:value-of select="BANK_ACCOUNT_COR"/><xsl:element name="br"/>
										<xsl:element name="br"/>
										<b>Телефон, факс: </b> <xsl:value-of select="CON_PHONE"/><xsl:element name="br"/>
										<b>Почта: </b> <xsl:value-of select="CON_EMAIL"/><xsl:element name="br"/>
									</xsl:when>
									<xsl:otherwise>
										<b>ФИО: </b> <xsl:value-of select="PERS_NAME"/><xsl:element name="br"/>
										<b>ИНН: </b> <xsl:value-of select="PERS_INN"/><xsl:element name="br"/>
										<b>СНИЛС: </b> <xsl:value-of select="PERS_SNILS"/><xsl:element name="br"/>
										<b>Телефон, факс: </b> <xsl:value-of select="PERS_PHONE"/><xsl:element name="br"/>
										<b>Почта: </b> <xsl:value-of select="PERS_EMAIL"/><xsl:element name="br"/>
										<b>Тип документа: </b> <xsl:value-of select="PERS_NSI_DOCUMENT"/><xsl:element name="br"/>
										<b>Серия: </b> <xsl:value-of select="PERS_SERIAL"/><xsl:element name="br"/>
										<b>Номер: </b> <xsl:value-of select="PERS_DOC_NUMBER"/><xsl:element name="br"/>
										<b>Дата выдачи: </b> <xsl:value-of select="PERS_DOC_DATE"/><xsl:element name="br"/>
										<b>Кем выдан: </b> <xsl:value-of select="PERS_DOC_ORGAN"/><xsl:element name="br"/>
										<xsl:element name="br"/>
										<b>Отделение банка: </b> <xsl:value-of select="BANK_NAME"/>, <xsl:value-of select="BANK_ADDRESS"/><xsl:element name="br"/>
										<b>БИК: </b> <xsl:value-of select="BANK_BIC"/><xsl:element name="br"/>
										<b>Расчетный счет: </b> <xsl:value-of select="BANK_ACCOUNT_SET"/><xsl:element name="br"/>
										<b>Корреспондентский счет: </b> <xsl:value-of select="BANK_ACCOUNT_COR"/><xsl:element name="br"/>
										<xsl:if test="CM_IS_DOCUMENT_PASSED = 1">
											<xsl:element name="br"/>
											<b><i>Проект документа отдан</i></b>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="CON_NSI_COMPANY_FORM != 'ФЛ'">
										<b>ФИО: </b> <a href=""><xsl:value-of select="PERS_NAME"/></a><xsl:element name="br"/>
										<b>Должность: </b> <xsl:value-of select="PERS_POST"/><xsl:element name="br"/>
										<b>Действует на основании: </b> <xsl:value-of select="PERS_DOC_PROXY"/><xsl:element name="br"/>
										<xsl:element name="br"/>
										<b>Телефон, факс: </b> <xsl:value-of select="PERS_PHONE"/><xsl:element name="br"/>
										<b>Почта: </b> <xsl:value-of select="PERS_EMAIL"/>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</layout:block>
		</xsl:if>

		<table class="card-history">
			<tr>
				<td>
					<div class="gray">Дата последнего изменения:</div><layout:element type="line" value="//SYS_LOG//DATA_CHANGED"/>
					<div class="gray">Дата создания:</div><layout:element type="line" value="//SYS_LOG//DATE_CREATED"/>
				</td>
				<td>
					<div class="gray">Изменения внес:</div><layout:element type="line" value="//SYS_LOG//USER_CHANGED"/>
					<div class="gray">Создал:</div><layout:element type="line" value="//SYS_LOG//USER_CREATED"/>
				</td>
			</tr>
		</table>
	</xsl:variable>

	<!-- Шаблон описания элементов -->
    {B{CARD$HTML_TEMPLATE}E}

    {B{CARD$GALLERY_DOCUMENT}E}

    <xsl:template match="/">
		<xml class="body" style="display: none"><xsl:copy-of select="*"/></xml>

		<div class="cardWrapper">
            <xsl:call-template name="Context.setNamespace">
                <xsl:with-param name="namespacePrefix"></xsl:with-param>
                <xsl:with-param name="namespaceURI"></xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="pageBuilder">
                <xsl:with-param name="data" select="/"/> <!-- Передаём XML данные в шаблоны -->
                <xsl:with-param name="layout" select="$LAYOUT"/> <!-- Передаём разметку -->
            </xsl:call-template>

            <div class="clear"></div>
        </div>
        {B{CARD$GALLERY_scripts}E}

		<script type="text/javascript"><![CDATA[
			function getMoneyFormat(value, suffix) {
				var val = value.replace(/[^\.,\d]/g, ''),
					val2 = '',
					spacer = ', ';

				val = val.split(/[\.,]/);
				val2 = spacer + (!!val[1] ? val[1] : '00');

				val = val[0].split('').reverse();

				for (var i=0; i<val.length; i++) {
					val2 = val[i] + (i > 0 && i % 3 == 0 ? ' ' : '') + val2;
				}

				return val2 + ' руб.';
			}
			$(function() {
				var docSum=0;
				$('.invoce_item_sum_field').each(function(indx, elm){
					var thisRow = $(elm).parents('tr');
					$(elm).text(+thisRow.find('.priceForPiece').text()*+thisRow.find('.quantity').text());
					docSum+=+($(elm).text());
				});
				$('.doc_sum_field').html(docSum);
				$('.numberFormat').each(function() {
					var $t = $(this),
						format = $t.attr('data-format'),
						flagClass = 'numberFormatInited';

					if (!!$t.hasClass(flagClass)) return false;

					switch(format) {
						case 'rub':
							$t.html(getMoneyFormat($t.html(), ' руб.'));
						break;

						case 'percent':
							$t.html($t.html().replace(/[^\.,\d]/g, '') + ' %')
						break;

						default:
						break;
					}

					$t.addClass(flagClass);
				});
			});
		]]></script>
    </xsl:template>
</xsl:stylesheet>
