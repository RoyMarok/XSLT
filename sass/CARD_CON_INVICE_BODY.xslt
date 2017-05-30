<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    <xsl:output method="html" encoding="utf-8" indent="no"/>

	<xsl:variable name="LAYOUT">

		<xsl:if test="//INVICE//FILES/ROW/FILE_CARD_ID !=''">
			{B{CARD$GALLERY_STYLES}E}
			<link type="text/css" rel="stylesheet" href="/portal_static/css/ps/fileBaloon.css"/>
			<div class="files_block pdoc-right-side">
				<div class="content">
					<xsl:if test="//INVICE//FILES/ROW/FILE_PAGECOUNT &gt; 0">
					  <p class="sectionTitle">Галерея документа</p>
					  <div class="gallery-right">
						<a href="#" class="main-image" data-images-count="{//INVICE//FILES/ROW/FILE_PAGECOUNT}" data-id="{//INVICE//FILES/ROW/FILE_CARD_ID}">
						  <img src="" alt="" rel="galleryRight" page="{//INVICE//FILES/ROW/FILE_CARD_ID}"/>
						</a>
						<xsl:if test="//INVICE//FILES/ROW/FILE_PAGECOUNT &gt; 0">
						  <div class="other-images">
							<div class="wrp-images">
							  <xsl:for-each select="//INVICE//FILES/ROW">
								<div class="wrp-images-group" data-images-count="{FILE_PAGECOUNT}" data-id="{FILE_CARD_ID}"></div>
							  </xsl:for-each>
							</div>
						   </div>
						</xsl:if>
					   </div>
					</xsl:if>

					<div class="preview-wrapper">
						<xsl:for-each select="//INVICE//FILES/ROW">
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
				<layout:element type="text" value="Реквизиты счета"/>
			</layout:header>
			<div class="cat ">
				<div class="key"><span>Номер счета</span></div>
				<div class="value"><xsl:value-of select="//INVICE//DOC_NUMBER"/> от <xsl:value-of select="//INVICE//DOC_DATE"/></div>
			</div>
			<layout:item label="Примечание к счету" value="//INVICE//NOTE"/>
		</layout:block>


		<xsl:if test="count(//INVICE_ITEMS//ROW) &gt; 0">
		<layout:block>
			<layout:header>
				<layout:element type="text" value="Спецификация"/>
			</layout:header>

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
							<td class="td-center"><xsl:value-of select="ITEM_COUNT"/></td>
							<td class="td-center"><span class="numberFormat" data-format="rub"><xsl:value-of select="ITEM_PRICE"/></span></td>
							<td class="td-center"><span class="numberFormat" data-format="rub"><xsl:value-of select="SUM_ALL"/></span></td>
						</tr>
					</xsl:for-each>
					<tr>
						<td class="td-center"><span class="text-bold">ИТОГО</span></td>
						<td class="td-center" colspan="3"><span class="numberFormat" data-format="rub"><xsl:value-of select="//INVICE//DOC_SUM"/></span></td>
					</tr>
				</tbody>
			</table>
			<div class="cat ">
				<div class="key"><span>Стоимость по договору</span></div>
				<div class="value"><span class="numberFormat" data-format="rub"><xsl:value-of select="//INVICE//DOGOVOR_SUM"/></span></div>
			</div>
			<div class="cat ">
				<div class="key"><span>Ставка НДС</span></div>
				<div class="value"><span class="numberFormat" data-format="percent"><xsl:value-of select="//INVICE//DOGOVOR_NSI_VALUE_VAT"/></span></div>
			</div>
			<div class="cat ">
				<div class="key"><span>НДС</span></div>
				<div class="value"><span class="numberFormat" data-format="rub"><xsl:value-of select="//INVICE//DOGOVOR_SUM_VAT"/></span></div>
			</div>
			<div class="cat ">
				<div class="key"><span>Итого к оплате по счету</span></div>
				<div class="value"><span class="numberFormat" data-format="rub"><xsl:value-of select="//INVICE//DOGOVOR_SUM_TOTAL"/></span></div>
			</div>
		</layout:block>
		</xsl:if>

		<xsl:if test="count(//INVICE_PAYMENT/ROW_SET/ROW[IS_DECLARANT_INFO='0']) &gt; 0">
		<layout:block>
			<layout:header>
				<layout:element type="text" value="Сведения об оплате"/>
			</layout:header>

			<table class="tableCardStyle">
				<thead>
					<tr>
						<th>Дата поступления платежа</th>
						<th>Оплаченная сумма</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="//INVICE_PAYMENT/ROW_SET/ROW[IS_DECLARANT_INFO='0']">
						<tr>
							<td class="td-center"><xsl:value-of select="DATA_PAID"/></td>
							<td class="td-center"><span class="numberFormat" data-format="rub"><xsl:value-of select="SUM_PAID"/></span></td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
			<div class="cat ">
				<div class="key"><span>Итого оплачено по счету</span></div>
				<div class="value"><span class="numberFormat" data-format="rub"><xsl:value-of select="//INVICE//SUM_PAID"/></span></div>
			</div>
			<div class="cat ">
				<div class="key"><span>Процент от суммы по счету</span></div>
				<div class="value"><span class="numberFormat" data-format="percent"><xsl:value-of select="//INVICE//INV_PROC_PAID"/></span></div>
			</div>
		</layout:block>
		</xsl:if>

		<xsl:if test="count(//INVICE_PAYMENT/ROW_SET/ROW[IS_DECLARANT_INFO='1']) &gt; 0">
		<layout:block>
			<layout:header>
				<layout:element type="text" value="Сведения об оплате заявителя"/>
			</layout:header>

			<table class="tableCardStyle">
				<thead>
					<tr>
						<th>Дата оплаты</th>
						<th>Сумма платежа</th>
						<th>Номер п./п.</th>
						<th>Скан п./п.</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="//INVICE_PAYMENT/ROW_SET/ROW[IS_DECLARANT_INFO='1']">
						<tr>
							<td class="td-center"><xsl:value-of select="DATA_PAID"/></td>
							<td class="td-center"><span class="numberFormat" data-format="rub"><xsl:value-of select="SUM_PAID"/></span></td>
							<td class="td-center"><xsl:value-of select="ORDER_NUMBER"/></td>
							<td>
              <xsl:for-each select="FILES/ROW">
								<xsl:call-template name="file_transform">
									<xsl:with-param name="pageCount" select="FILE_PAGECOUNT"/>
									<xsl:with-param name="fileName" select="FILE_NAME"/>
									<xsl:with-param name="cardId" select="FILE_CARD_ID"/>
									<xsl:with-param name="fileSize" select="FILE_LENGTH"/>
									<xsl:with-param name="ecp" select="FILE_ECP"/>
								</xsl:call-template>
              </xsl:for-each>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</layout:block>
		</xsl:if>

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

        <style type="text/css">
            .td-center {
                text-align: center;
                vertical-align: middle;
            }
			/* Для отступов от галереи справа */
			.content_block .block  {
				margin-right: 320px;
			}
			.tableCardStyle .prew-description-block {
				width: auto;
				display: inline-block;
				vertical-align: top;
				margin: 0;
			}
			.tableCardStyle .prew-description-block p {
				margin: 0;
			}
			.tableCardStyle div.preview-block &gt; img {
				float: none;
			}
        </style>

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
