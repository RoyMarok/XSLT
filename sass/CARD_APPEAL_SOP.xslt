<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
		{B{CARD_APPEAL_Styles}E}
		<style type="text/css">
			.dataBlock .key {
				width: 320px;
			}
			.infoTable {
				width: 100%;
			}
			.infoTable th,
			.infoTable td {
				padding: 5px 20px;
				border: 0;
			}
			.infoTable th {
				color: #7D8FA4;
				font-weight: normal;
				text-align: left;
				font-size: 11px;
				padding-bottom: 0;
			}
			.infoTable tr:hover td {
				background-color: #F5F7FB;
			}
			button {
				border: 1px solid #D9DBDD;
				background: #fff;
				line-height: 25px;
				color: #000;
				cursor: pointer;
				display: block;
				padding: 0 20px;
			}
			button:hover {
				border-color: #000;
			}
			.flexWrapper {
				display: flex;
			}
			.cardLeftSide {
				width: auto;
				flex-grow: 1;
				margin: 9px 5px;
			}
			.cardRightSide {
				width: 500px;
				margin-left: 0;
				flex-shrink: 0;
				margin: 9px 5px;
			}
			.cardLeftSide .dataBlock,
			.cardRightSide .dataBlock {
				height: 100%;
				margin: 0;
			}

			.cardDataTable th {
				background: #EEF2F6;
				text-align: left;
				padding: 15px 5px 10px;
			}
			.cardDataTable td {
				background: #fff;
				padding: 5px;
				vertical-align: top;
			}
			.cardDataTable tr:hover td {
				background: #F2F6FA;
			}

			.dataBlock a.addLink {
				font-size: 16px;
				color: #0144DD;
				text-decoration: none;
				border-bottom: 1px solid #CDDAFA;
			}
			.dataBlock a.addLink:hover {
				color: #D64001;
				border-bottom: 1px solid #F6D8CD;
			}

			.dataBlock a.editIcon.underLine {
				opacity: 1;
				border-bottom: 1px solid #8FA7B5;
				height: 18px;
			}
		</style>
		<div class="cardWrapper">
			<div class="flexWrapper">
			<div class="cardLeftSide">
				<div class="whiteBlock dataBlock">
					<div class="paddingBlock">
						<h2>Общая информация</h2>
						<div class="cat">
							<div class="key"><span>Ведущее подразделение</span></div>
							<div class="value"><xsl:value-of select="//APPEAL_SOP//DEP_NAME" /></div>
						</div>
						<div class="cat">
							<div class="key"><span>Ведущий эксперт</span></div>
							<div class="value"><xsl:value-of select="//APPEAL_SOP//PERS_NAME" /></div>
						</div>
						<div class="cat">
							<div class="key"><span>Сводное замечание</span></div>
							<div class="value">
								<xsl:if test="//APPEAL_SOP//CMNT_URL">
								<xsl:choose>
									<xsl:when test="//APPEAL_SOP//CMNT_DATE_CREATED">
										<a href="{//APPEAL_SOP//CMNT_CARD_URL}" target="_blank">Сводное замечание</a>
										от <xsl:value-of select="//APPEAL_SOP//CMNT_DATE_CREATED" />
										<a href="{//APPEAL_SOP//CMNT_URL}" class="editIcon" target="_blank"></a>
									</xsl:when>
									<xsl:otherwise>
										<a href="{//APPEAL_SOP//CMNT_URL}" class="editIcon" target="_blank"></a>
									</xsl:otherwise>
								</xsl:choose>
								</xsl:if>
							</div>
						</div>
						<div class="cat">
							<div class="key"><span>Сводное заключение</span></div>
							<div class="value">
								<xsl:if test="//APPEAL_SOP//RES_URL">
								<xsl:choose>
									<xsl:when test="//APPEAL_SOP//RES_DATE_CREATED">
										<a href="{//APPEAL_SOP//RES_CARD_URL}" target="_blank">Сводное заключение</a>
										от <xsl:value-of select="//APPEAL_SOP//RES_DATE_CREATED" />
										<a href="{//APPEAL_SOP//RES_URL}" class="editIcon" target="_blank"></a>
									</xsl:when>
									<xsl:otherwise>
										<a href="{//APPEAL_SOP//RES_URL}" class="editIcon" target="_blank"></a>
									</xsl:otherwise>
								</xsl:choose>
								</xsl:if>
								<xsl:choose>
										<xsl:when test="//APPEAL_SOP//RES_IS_APPROVED = 1">
											<div class="greenText">
												<div class="enterGreenIcon"></div> <xsl:value-of select="//APPEAL_SOP//RES_IS_APPROVED_TEXT" />
											</div>
										</xsl:when>
										<xsl:when test="//APPEAL_SOP//RES_IS_APPROVED = 0">
											<div class="redText">
												<div class="enterRedIcon"></div> <xsl:value-of select="//APPEAL_SOP//RES_IS_APPROVED_TEXT" />
											</div>
										</xsl:when>
								</xsl:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cardRightSide">
				<div class="whiteBlock dataBlock">
					<div class="paddingBlock">
						<button style="float: right;">Редактировать</button>
						<h2>График проведения экспертизы</h2>
					</div>
					<table class="infoTable">
						<thead>
							<tr>
								<th></th>
								<th>Плановая</th>
								<th>Фактическая</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Начало экспертизы</td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD1_PLAN" /></td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD1_FACT" /></td>
							</tr>
							<tr>
								<td>Передача в ведущее подразделение</td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD2_PLAN" /></td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD2_FACT" /></td>
							</tr>
							<tr>
								<td>Подготовка замечаний по разделам</td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD3_PLAN" /></td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD3_FACT" /></td>
							</tr>
							<tr>
								<td>Подготовка сводного замечания</td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD4_PLAN" /></td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD4_FACT" /></td>
							</tr>
							<tr>
								<td>Выдача сводного замечания заявителю</td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD5_PLAN" /></td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD5_FACT" /></td>
							</tr>
							<tr>
								<td>Подготовка заключений по разделам</td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD6_PLAN" /></td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD6_FACT" /></td>
							</tr>
							<tr>
								<td>Подготовка сводного заключения</td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD7_PLAN" /></td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD7_FACT" /></td>
							</tr>
							<tr>
								<td>Выдача сводного заключения заявителю</td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD8_PLAN" /></td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD8_FACT" /></td>
							</tr>
							<tr>
								<td>Подготовка заключения</td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD9_PLAN" /></td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD9_FACT" /></td>
							</tr>
							<tr>
								<td>Выдача заключения заявителю</td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD10_PLAN" /></td>
								<td><xsl:value-of select="//APPEAL_SOP_DATAS//FLD10_FACT" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</div>
			<div class="grayBlock dataBlock" style="background: #F2F5FA; padding: 0; overflow: hidden;">
				<table class="cardDataTable">
					<thead>
						<tr>
							<th></th>
							<th>Раздел</th>
							<th>Эксперт</th>
							<th>Начало</th>
							<th>Замечание План/Факт</th>
							<th>Заключение План/Факт</th>
							<th>Результат</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="//SECTION/ROW_SET/ROW">
							<tr>
								<td><a class="editIcon" href="{URL_EDIT}" target="_blank"></a></td>
								<td><xsl:value-of select="RAZDEL" disable-output-escaping="yes" /></td>
								<td><xsl:value-of select="EXPERT" disable-output-escaping="yes" /></td>
								<td><xsl:value-of select="DATE_BEGIN_PLAN" /></td>
								<td>
									<xsl:choose>
										<xsl:when test="ZAMECH_CNT_REMARK != ''">
											<b><xsl:value-of select="ZAMECH_CNT_REMARK" /></b><br/>
											<xsl:value-of select="ZAMECH_DATE_COMMENT" />/<xsl:value-of select="ZAMECH_DATE_SIGNED" /><br/>
											<span class="grayText">замечание</span> <a class="editIcon" href="{ZAMECH_URL}" target="_blank"></a>
										</xsl:when>
										<xsl:otherwise>
											<span class="grayText">Замечаний нет</span> <a class="editIcon" href="{ZAMECH_NEW_URL}" target="_blank"></a>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="ZAKL_URL != ''">
											<xsl:value-of select="ZAKL_DATE_RESOLUTION" />/<xsl:value-of select="ZAKL_DATE_SIGNED" /><br/>
											<span class="grayText">заключение</span><a class="editIcon" href="{ZAKL_URL}" target="_blank"></a>
										</xsl:when>
										<xsl:otherwise>
											<span class="grayText">Заключений нет</span> <a class="editIcon" href="{ZAKL_NEW_URL}" target="_blank"></a>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="RESOLT = 1">
											Утверждено
											<div class="greenText"><div class="greenLabel"></div> положительное решение</div>
										</xsl:when>
										<xsl:otherwise>
											Не утверждено
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<div style="padding: 20px; text-align: center;">
					<xsl:if test="//APPEAL_SOP//URL_NEW_SECTION">
						<div class="addIcon" style="margin: 0 5px 3px 0;"></div> <a href="{//APPEAL_SOP//URL_NEW_SECTION}" target="_blank" class="addLink">Добавить</a>
					</xsl:if>
				</div>
			</div>
		</div>

        <XML style="display: none;" class="body">
          <xsl:copy-of select="."/>
        </XML>

    </xsl:template>
</xsl:stylesheet>