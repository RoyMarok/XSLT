<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:doc="http://xmlns.oracle.com/MSG_GPZU_Card">
	<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>
	<xsl:variable name="LAYOUT">
		<!-- Подготовка документа -->
		<layout:block>
			<layout:header>Подготовка документа</layout:header>
			<layout:item label="Номер заявки" value="//doc:Preparation/doc:RQ_Num"/>
			<layout:item label="Дата регистрации заявки" value="//doc:Preparation/doc:RQ_Date" format="date"/>
			<layout:item label="Заказчик" value="//doc:Object/doc:SD_Customer"/>
			<layout:item label="Источник финансирования" value="//doc:Object/doc:SourceFin"/>
			<layout:item label="Плановая дата начала работ" value="//doc:Preparation/doc:Plan_Beg" format="date"/>
			<layout:item label="Плановая дата окончания работ" value="//doc:Preparation/doc:Plan_End" format="date"/>
			<layout:item label="Решение" value="//doc:Preparation/doc:SD_Decision_Str"/>
			<layout:item label="Состояние" value="//doc:Condition"/>
			<layout:item label="Утвержден приказом Москомархитектуры">
				<xsl:if test="//doc:Preparation/doc:OrderNum != ''">
					<layout:element type="line" value="//doc:Preparation/doc:OrderNum">№ </layout:element>
				</xsl:if>
				<xsl:if test="//doc:Preparation/doc:OrderDate != ''">
					<layout:element type="line" value="//doc:Preparation/doc:OrderDate" format="date"> от </layout:element>
				</xsl:if>
			</layout:item>
			<layout:item label="Регистрация ГПЗУ">
				<xsl:if test="//doc:Preparation/doc:Reg_Num_GGK != '' or //doc:Preparation/doc:Reg_Num_Who != ''">
					<layout:element type="line" value="//doc:Preparation/doc:Reg_Num_Who">№ </layout:element>
					<layout:element type="line" value="//doc:Preparation/doc:Reg_Num_GGK">
					</layout:element>
				</xsl:if>
				<xsl:if test="//doc:Preparation/doc:Reg_Num_GGK_Date != ''">
					<layout:element type="line" value="//doc:Preparation/doc:Reg_Num_GGK_Date" format="date"> от </layout:element>
				</xsl:if>
			</layout:item>
			<layout:item label="Дата выдачи" value="//doc:Preparation/doc:RG_Complete_Date" format="date"/>
			<layout:item label="Кому выдан" value="//doc:Preparation/doc:RG_Complete_Pass"/>
			<!--<xsl:if test="//doc:Preparation/doc:NameCancel != ''">
          <xsl:variable name="nulledGPZU">
            <xsl:text>/ugd/tabInfo.action?documentId=</xsl:text>
            <xsl:value-of select="//doc:DOC_KEY_CANCEL"/>
            <xsl:text>&amp;tab=CARD$GPZU#tab::id=0/card::cardId=CARD$GPZU</xsl:text>
          </xsl:variable>
          <layout:item label="Номер аннулируемого ГПЗУ">
            <layout:link href="{$nulledGPZU}" type="text">
              <layout:element type="line" value="//doc:Preparation/doc:NameCancel"/>
            </layout:link>
          </layout:item>
        </xsl:if> -->
			<xsl:if test="//doc:Preparation/doc:NameCancel != ''">
				<div class="cat">
					<div class="key">
						<span>Номер аннулируемого ГПЗУ</span>
					</div>
					<div class="value">
						<a>
							<xsl:attribute name="href">
								<xsl:text>getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=</xsl:text>
								<xsl:value-of select="//doc:DOC_KEY_CANCEL"/>
							</xsl:attribute>
							<xsl:value-of select="//doc:Preparation/doc:NameCancel"/>
						</a>
					</div>
				</div>
			</xsl:if>
			<xsl:if test="//doc:Preparation/doc:Reason != ''">
				<layout:item label="Причина переоформления" value="//doc:Preparation/doc:Reason" format="nl2br"/>
			</xsl:if>
			<!--<xsl:if test="//doc:Preparation/doc:NameReReg != ''">
          <xsl:variable name="newGPZU">
            <xsl:text>/ugd/tabInfo.action?documentId=</xsl:text>
            <xsl:value-of select="//doc:DOC_KEY_REREG"/>
            <xsl:text>&amp;tab=CARD$GPZU#tab::id=0/card::cardId=CARD$GPZU</xsl:text>
          </xsl:variable>
          <layout:item label="Номер нового ГПЗУ">
            <layout:link href="{$newGPZU}" type="text">
              <layout:element type="line" value="//doc:Preparation/doc:NameReReg"/>
            </layout:link>
          </layout:item>
        </xsl:if> -->
			<!--<xsl:if test="//doc:Preparation/doc:NameReReg != ''">
                <div class="cat">
                    <div class="key">
                        <span>Номер нового ГПЗУ</span>
                    </div>
                    <div class="value">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=</xsl:text>
                                <xsl:value-of select="//doc:DOC_KEY_REREG"/>
                            </xsl:attribute>
                            <xsl:value-of select="//doc:Preparation/doc:NameReReg"/>
                        </a>
                    </div>
                </div>
            </xsl:if>-->
			<xsl:if test="//doc:Preparation/doc:NameReReg != '' and //doc:DOC_KEY_REREG != ''">
				<div class="cat">
					<div class="key">
						<span>Номер нового ГПЗУ</span>
					</div>
					<div class="value">
						<a>
							<xsl:attribute name="href">
								<xsl:text>getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=</xsl:text>
								<xsl:value-of select="//doc:DOC_KEY_REREG"/>
							</xsl:attribute>
							<xsl:value-of select="//doc:Preparation/doc:NameReReg"/>
						</a>
					</div>
				</div>
			</xsl:if>
			<xsl:if test="//doc:Preparation/doc:NameReReg != '' and //doc:DOC_KEY_REREG = ''">
				<div class="cat">
					<div class="key">
						<span>Номер нового ГПЗУ</span>
					</div>
					<div class="value">
						<xsl:value-of select="//doc:Preparation/doc:NameReReg"/>
					</div>
				</div>
			</xsl:if>
			<!-- Переделать обратно в doc:StopWork -->
			<xsl:for-each select="//doc:StopWork">
				<xsl:variable name="StopWorkDate" select="doc:StopWorkDate"/>
				<xsl:variable name="StopWorkDateEnd" select="doc:StopWorkDateEnd"/>
				<xsl:variable name="ReasonStop" select="doc:ReasonStop"/>
				<layout:item label="Приостановка">
					<layout:text>c </layout:text>
					<layout:text format="date" value="{$StopWorkDate}"> по </layout:text>
					<layout:text format="date" value="{$StopWorkDateEnd}"/>
				</layout:item>
				<layout:item label="Причина приостановки">
					<layout:text format="nl2br" value="{$ReasonStop}"/>
				</layout:item>
			</xsl:for-each>
			<xsl:if test="count(//doc:StopWorkHistory) &gt; 0">
				<layout:item label="История приостановок" select="//doc:StopWorkHistory">
					<layout:element format="nl2br" type="block" value="."/>
				</layout:item>
			</xsl:if>

		</layout:block>
		<!-- Информация о градостроительном регламенте земельного участка -->
		<xsl:if test="//doc:FormVersion != 3">
			<layout:block>
				<layout:header>Информация о градостроительном регламенте земельного участка</layout:header>
				<layout:item label="Градостроительный регламент земельного участка в составе правил землепользования и застройки, утвержденных представительным органом местного самоуправления" value="//doc:Section2TownPlan/doc:TownPlanOrder"/>
				<layout:element type="text" value="Информация обо всех предусмотренных градостроительным регламентом видах разрешенного использования земельного участка (за исключением случаев предоставления земельного участка для государственных или муниципальных нужд):"/>
				<layout:item type="text" label="– Основные виды:" value="//doc:Section2TownPlan/doc:TownPlanOrderType"/>
				<layout:item type="text" label="– Условно-разрешенные виды:" value="//doc:Section2TownPlan/doc:TownPlanOrderRelType"/>
				<layout:item type="text" label="– Вспомогательные виды:" value="//doc:Section2TownPlan/doc:TownPlanOrderAddType"/>

			</layout:block>
		</xsl:if>
		<!-- Информация о градостроительном регламенте земельного участка -->
		<xsl:if test="//doc:Section3RR//doc:RRName !=''">
			<layout:block>
				<layout:header>Информация о градостроительном регламенте земельного участка</layout:header>
				<xsl:for-each select="//doc:Section3RR/doc:RR">
					<xsl:sort select="string-length(doc:RRNum)"/>
					<xsl:sort select="doc:RRNum"/>
					<xsl:if test="doc:RRName !=''">
						<div class="subTable">
							<xsl:value-of select="doc:RRName"/>
						</div>
						<div style="padding-left:30px">
							<xsl:if test="doc:PermittedUse !=''">
								<div class="cat">
									<div class="key">
										<span>Разрешенное использование</span>
									</div>
									<div class="value">
										<xsl:call-template name="nl2br_template">
											<xsl:with-param name="str" select="doc:PermittedUse"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
							<xsl:if test="doc:Prohibit !=''">
								<div class="cat">
									<div class="key">
										<span>Запрещается</span>
									</div>
									<div class="value">
										<xsl:call-template name="nl2br_template">
											<xsl:with-param name="str" select="doc:Prohibit"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
							<xsl:if test="doc:Allow !=''">
								<div class="cat">
									<div class="key">
										<span>Разрешается</span>
									</div>
									<div class="value">
										<xsl:call-template name="nl2br_template">
											<xsl:with-param name="str" select="doc:Allow"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
							<xsl:if test="doc:AdditionalInfo != ''">
								<div style="margin: 10px 0px;">
									<xsl:call-template name="nl2br_template">
										<xsl:with-param name="str" select="doc:AdditionalInfo"/>
									</xsl:call-template>
								</div>
							</xsl:if>

							<xsl:choose>
								<xsl:when test="count(doc:SD_Kod_Build) &gt; 0">
									<div class="cat">
										<div class="key">
											<span>Основные виды разрешенного использования</span>
										</div>
										<div class="value">
											<xsl:for-each select="doc:SD_Kod_Build">
												<div><xsl:value-of select="."/></div>
											</xsl:for-each>
											<xsl:if test="doc:PUMainNotes != ''">
												<div>
													<xsl:value-of select="doc:PUMainNotes"/>
												</div>
											</xsl:if>
											<div style="display: none;">
												<xsl:for-each select="//ROOT//GPZU_SD_KOD_BUILD//ROW">
												<div data-code="{CODE}" data-id="{ID}" data-parent-id="{ID_PARENT}"><xsl:value-of select="CODE"/> - <xsl:value-of select="NAME"/></div>
											</xsl:for-each>
											</div>
										</div>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div class="cat">
										<div class="key">
											<span>Основные виды разрешенного использования</span>
										</div>
										<div class="value">
											<xsl:for-each select="//ROOT//GPZU_SD_KOD_BUILD//ROW">
												<div data-code="{CODE}" data-id="{ID}" data-parent-id="{ID_PARENT}"><xsl:value-of select="CODE"/> - <xsl:value-of select="NAME"/></div>
											</xsl:for-each>
										</div>
									</div>
								</xsl:otherwise>

							</xsl:choose>
							<xsl:if test="count(doc:SD_Kod_Build) &gt; 0">
								<div class="cat">
									<div class="key">
										<span>Основные виды разрешенного использования</span>
									</div>
									<div class="value">
										<xsl:for-each select="doc:SD_Kod_Build">
											<div><xsl:value-of select="."/></div>
										</xsl:for-each>
										<xsl:if test="doc:PUMainNotes != ''">
											<div>
												<xsl:value-of select="doc:PUMainNotes"/>
											</div>
										</xsl:if>
									</div>
								</div>
							</xsl:if>
							<xsl:if test="count(doc:SD_Kod_Build_R) &gt; 0">
								<div class="cat">
									<div class="key">
										<span>Условно-разрешенные виды использования</span>
									</div>
									<div class="value">
										<xsl:for-each select="doc:SD_Kod_Build_R">
											<div><xsl:value-of select="."/></div>
										</xsl:for-each>
										<xsl:if test="doc:SD_Kod_Build_R_Note != ''">
											<div>
												<xsl:text>Примечание: </xsl:text>
												<xsl:value-of select="doc:SD_Kod_Build_R_Note"/>
											</div>
										</xsl:if>
									</div>
								</div>
							</xsl:if>
							<xsl:if test="count(doc:SD_Kod_Build_Next) &gt; 0">
								<div class="cat">
									<div class="key">
										<span>Вспомогательные виды разрешенного использования</span>
									</div>
									<div class="value">
										<xsl:for-each select="doc:SD_Kod_Build_Next">
											<div><xsl:value-of select="."/></div>
										</xsl:for-each>
									</div>
								</div>
							</xsl:if>
							<xsl:if test="count(doc:CapObjFunction) &gt; 0">
								<div class="cat">
									<div class="key">
										<span>Требования к назначению, параметрам и размещению объекта кап. строительства</span>
									</div>
									<div class="value">
										<xsl:call-template name="nl2br_template">
											<xsl:with-param name="str" select="doc:CapObjFunction"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
							<xsl:if test="count(doc:Table1/doc:Line) &gt; 0">
								<xsl:choose>
									<xsl:when test="doc:Table1/doc:CTitle != ''">
										<xsl:call-template name="nl2br_template">
											<xsl:with-param name="str" select="doc:Table1/doc:CTitle"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="margin:10px 0px; font-weight:bold; display: inline-block;">Объект капитального строительства</span>
									</xsl:otherwise>
								</xsl:choose>
								<table class="tableCardStyle test" style="width:100%;">
									<thead>
										<tr>
											<th>
												<xsl:choose>
													<xsl:when test="doc:Table1/doc:CN != ''">
														<xsl:value-of select="doc:Table1/doc:CN"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>№ п/п</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</th>
											<th><xsl:value-of select="doc:Table1/doc:CName"/></th>
											<th><xsl:value-of select="doc:Table1/doc:CValue"/></th>
										</tr>
									</thead>
									<tbody>
										<xsl:for-each select="doc:Table1/doc:Line">
											<xsl:if test="doc:Column2 != '' or doc:Column3 != ''">
												<tr>
													<td><xsl:value-of select="doc:Column1"/></td>
													<td><xsl:value-of select="doc:Column2"/></td>
													<td>
														<xsl:call-template name="nl2br_template">
															<xsl:with-param name="str" select="doc:Column3"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="count(doc:Table2/doc:Land) &gt; 0">
								<table class="tableCardStyle test" style="width:100%">
									<thead>
										<tr>
											<th rowspan="2">Номер участка согласно чертежу<br/>градостроительного плана</th>
											<th colspan="2">Размер (м)</th>
											<th colspan="2">Площадь (кв.м)</th>
										</tr>
										<tr>
											<th>минимальный</th>
											<th>максимальный</th>
											<th>минимальная</th>
											<th>максимальная</th>
										</tr>
									</thead>
									<tbody>
										<xsl:for-each select="doc:Table2/doc:Land">
											<tr>
												<th><xsl:value-of select="doc:LandNum"/></th>
												<th><xsl:value-of select="doc:LandSizeMin"/></th>
												<th><xsl:value-of select="doc:LandSizeMax"/></th>
												<th><xsl:value-of select="doc:LandAreaMin"/></th>
												<th><xsl:value-of select="doc:LandAreaMax"/></th>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="doc:Table2/doc:BuildPercentMax !=''">
								<div class="cat">
									<div class="key">
										<span>Максимальный процент застройки (%)</span>
									</div>
									<div class="value">
										<xsl:call-template name="nl2br_template">
											<xsl:with-param name="str" select="doc:BuildPercentMax"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
							<xsl:if test="doc:Table2/doc:OtherTep !=''">
								<div class="cat">
									<div class="key">
										<span>Иные показатели</span>
									</div>
									<div class="value">
										<xsl:call-template name="nl2br_template">
											<xsl:with-param name="str" select="doc:OtherTep"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
							<xsl:if test="count(doc:Table3/doc:Line) &gt; 0">
								<xsl:choose>
									<xsl:when test="doc:Table3/doc:TTitle != ''">
										<xsl:call-template name="nl2br_template">
											<xsl:with-param name="str" select="doc:Table3/doc:TTitle"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="margin:10px 0px; font-weight:bold; display: inline-block;">Требования и ограничения общего характера</span>
									</xsl:otherwise>
								</xsl:choose>
								<table class="tableCardStyle test" style="width:100%;">
									<thead>
										<tr>
											<th>
												<xsl:choose>
													<xsl:when test="doc:Table3/doc:TN != ''">
														<xsl:value-of select="doc:Table3/doc:TN"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>№ п/п</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</th>
											<th><xsl:value-of select="doc:Table3/doc:TName"/></th>
											<th><xsl:value-of select="doc:Table3/doc:TValue"/></th>
										</tr>
									</thead>
									<tbody>
										<xsl:for-each select="doc:Table3/doc:Line">
											<xsl:if test="doc:Column2 != '' or doc:Column3 != ''">
												<tr>
													<td><xsl:value-of select="doc:Column1"/></td>
													<td><xsl:value-of select="doc:Column2"/></td>
													<td>
														<xsl:call-template name="nl2br_template">
															<xsl:with-param name="str" select="doc:Column3"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="count(doc:Table4/doc:Line) &gt; 0">
								<xsl:choose>
									<xsl:when test="doc:Table4/doc:STitle != ''">
										<xsl:call-template name="nl2br_template">
											<xsl:with-param name="str" select="doc:Table4/doc:STitle"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<span style="margin:10px 0px; font-weight:bold; display: inline-block;">Требования и ограничения специального характера</span>
									</xsl:otherwise>
								</xsl:choose>
								<table class="tableCardStyle test" style="width:100%;">
									<thead>
										<tr>
											<th>
												<xsl:choose>
													<xsl:when test="doc:Table4/doc:SN != ''">
														<xsl:value-of select="doc:Table4/doc:SN"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>№ п/п</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</th>
											<th><xsl:value-of select="doc:Table4/doc:SName"/></th>
											<th><xsl:value-of select="doc:Table4/doc:SValue"/></th>
										</tr>
									</thead>
									<tbody>
										<xsl:for-each select="doc:Table4/doc:Line">
											<xsl:if test="doc:Column2 != '' or doc:Column3 != ''">
												<tr>
													<td><xsl:value-of select="doc:Column1"/></td>
													<td><xsl:value-of select="doc:Column2"/></td>
													<td>
														<xsl:call-template name="nl2br_template">
															<xsl:with-param name="str" select="doc:Column3"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
									</tbody>
								</table>
							</xsl:if>
						</div>
					</xsl:if>
				</xsl:for-each>

			</layout:block>
		</xsl:if>
		<!-- Информация о разрешенном использовании земельного участка, требованиях к назначению, параметрам и размещению объектов капитального строительства -->
		<layout:block>
			<layout:header>Информация о разрешенном использовании земельного участка, требованиях к назначению, параметрам и размещению объектов капитального строительства</layout:header>
			<layout:element style="font-weight: bold;" type="block" value="//doc:DocsRemNonEdit"/>
			<layout:element style="font-weight: bold;" type="block" value="//doc:DocsRem"/>
			<layout:text style="line-height: 40px;" value="Разрешенное использование земельного участка:"/>

			<xsl:choose>
				<xsl:when test="count(//ROOT//GPZU_SD_KOD_BUILD//ROW) &gt; 0">
					<div class="cat">
						<div class="key">
							<span>Основные виды разрешенного использования</span>
						</div>
						<div class="value">
						<xsl:for-each select="//ROOT//GPZU_SD_KOD_BUILD//ROW">
							<div data-code="{CODE}" data-id="{ID}" data-parent-id="{ID_PARENT}" class="gpzuTree"><xsl:value-of select="CODE"/> - <xsl:value-of select="NAME"/></div>
						</xsl:for-each>
						</div>
						<script>
							<![CDATA[
								$(function(){
									$('.gpzuTree').each(function(indx, elm){
								    var thisId = $(elm).attr('data-id');
								    $('.gpzuTree').each(function(indx2, elm2){
								        var thisPId = $(elm2).attr('data-parent-id');
								        var thisTreeLevel = $(elm2).attr('data-tree-level');
								        if (thisPId == thisId){
								            if(thisTreeLevel){
								                $(elm2).attr('data-tree-level', thisTreeLevel++);
								            }else{
								                $(elm2).attr('data-tree-level', 1);
								            }
								        }
								    });
								});
								$('.gpzuTree').each(function(indx, elm){
								    var thisTreeLevel = $(elm).attr('data-tree-level');
								    if (thisTreeLevel){
								        $(elm).css('margin-left', thisTreeLevel*20+'px');
								    }
								});
								});
							]]>
						</script>
					</div>

				</xsl:when>
				<xsl:otherwise>
					<layout:item type="text" label="Основные виды разрешенного использования">
						<xsl:for-each select="//doc:Section3Requirements/doc:BasicUse">
							<xsl:variable name="SD_Kod_BuildWithKod">
								<xsl:if test="substring(doc:SD_Kod_BuildWithKod, 1, 2) != '- '">
									<xsl:text>- </xsl:text>
								</xsl:if>
								<xsl:value-of select="doc:SD_Kod_BuildWithKod"/>
							</xsl:variable>
							<xsl:variable name="SD_Kod_Build">
								<xsl:value-of select="doc:SD_Kod_Build"/>
							</xsl:variable>
							<xsl:if test="position() &gt; 1">
								<layout:text value=" " style="width:20px; display: inline-block;"/>
							</xsl:if>
							<layout:text value="{$SD_Kod_Build}">
							</layout:text>
							<layout:text value="{$SD_Kod_BuildWithKod}"/>
							<layout:element type="block" value="doc:x"/>
						</xsl:for-each>
					</layout:item>
				</xsl:otherwise>
			</xsl:choose>

          	<xsl:if test="count(//FNO_306/ROW_SET/ROW) &gt; 0">
              <div class="cat">
                 <div class="key">
                   <span>Функциональное назначение объекта (306-ПП)</span>
                 </div>
                 <div class="value nested-list nested-list-collapsable">
                    <ul>
                        <xsl:apply-templates select="//FNO_306/ROW_SET/ROW[IS_LEAF = 0]"/>
                    </ul>
                 </div>
              </div>
			</xsl:if>
			<layout:item type="text" label="Условно разрешенные виды использования">
				<xsl:for-each select="//doc:Section3Requirements/doc:ConditionallyUse">
					<xsl:variable name="SD_Kod_Build_RWithKod">
						<xsl:if test="substring(doc:SD_Kod_Build_RWithKod, 1, 2) != '- '">
							<xsl:text>- </xsl:text>
						</xsl:if>
						<xsl:value-of select="doc:SD_Kod_Build_RWithKod"/>
					</xsl:variable>
					<xsl:variable name="SD_Kod_Build_R">
						<xsl:value-of select="doc:SD_Kod_Build_R"/>
					</xsl:variable>
					<xsl:if test="position() &gt; 1">
						<layout:text value=" " style="width:20px; display: inline-block;"/>
					</xsl:if>
					<layout:text value="{$SD_Kod_Build_R}">
					</layout:text>
					<layout:text value="{$SD_Kod_Build_RWithKod}"/>
					<layout:element type="block" value="doc:x"/>
				</xsl:for-each>
			</layout:item>
			<layout:item label="Примечание" value="//doc:Section3Requirements/doc:SD_Kod_Build_R_Note"/>
			<layout:item type="text" label="Вспомогательные виды разрешенного использования">
				<xsl:for-each select="//doc:Section3Requirements/doc:AuxiliaUse">
					<xsl:variable name="SD_Kod_Build_NextWithKod">
						<xsl:if test="substring(doc:SD_Kod_Build_NextWithKod, 1, 2) != '- '">
							<xsl:text>- </xsl:text>
						</xsl:if>
						<xsl:value-of select="doc:SD_Kod_Build_NextWithKod"/>
					</xsl:variable>
					<xsl:variable name="SD_Kod_Build_Next">
						<xsl:value-of select="doc:SD_Kod_Build_Next"/>
					</xsl:variable>
					<xsl:if test="position() &gt; 1">
						<layout:text value=" " style="width:20px; display: inline-block;"/>
					</xsl:if>
					<layout:text value="{$SD_Kod_Build_Next}">
					</layout:text>
					<layout:text value="{$SD_Kod_Build_NextWithKod}"/>
					<layout:element type="block" value="doc:x"/>
				</xsl:for-each>
			</layout:item>
			<layout:item label="Требования к назначению, параметрам и размещению объекта капитального строительства на указанном земельном участке" value="//doc:Section3Requirements/doc:CapObjFunction"/>
			<xsl:if test="//doc:FormVersion != 3">
				<layout:text style="line-height: 40px;" value="Предельные (минимальные и (или) максимальные размеры) земельных участков объектов капитального строительства, в том числе площадь"/>
				<table class="tableCardStyle test" style="width:100%;">
					<thead>
						<tr>
							<th rowspan="2">Номер участка согласно чертежу</th>
							<th colspan="2">Размер (м)</th>
							<th rowspan="2">Площадь (кв.м.)</th>
						</tr>
						<tr>
							<th>Минимальный</th>
							<th>Максимальный</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><xsl:value-of select="//doc:Section3Requirements/doc:LandNum"/></td>
							<td><xsl:value-of select="//doc:Section3Requirements/doc:LandSizeMin"/></td>
							<td><xsl:value-of select="//doc:Section3Requirements/doc:LandSizeMax"/></td>
							<td>
								<xsl:value-of select="//doc:Section3Requirements/doc:LandAreaMin"/>
								<xsl:if test="//doc:Section3Requirements/doc:LandAreaMin != '' and //doc:Section3Requirements/doc:LandAreaMax != ''"><br/></xsl:if>
								<xsl:value-of select="//doc:Section3Requirements/doc:LandAreaMax"/>
							</td>
						</tr>
					</tbody>
				</table>
				<layout:item label="Максимальный процент застройки">
					<layout:element type="line" value="//doc:Section3Requirements/doc:BuildPercentMax"/>
					<xsl:if test="//doc:Section3Requirements/doc:BuildPercentMax != '' and string-length(//doc:Section3Requirements/doc:BuildPercentMax) &lt; 4">
						<layout:text>%</layout:text>
					</xsl:if>
					<xsl:if test="//doc:Section3Requirements/doc:BuildPercentRem != ''">
						<layout:element type="line" value="//doc:Section3Requirements/doc:BuildPercentRem"> (</layout:element>
						<layout:text>)</layout:text>
					</xsl:if>
				</layout:item>
				<xsl:if test="//doc:Section3Requirements/doc:LookTepRem != ''">
					<layout:element type="block" value="//doc://doc:Section3Requirements/doc:LookTepRem"/>
					<xsl:if test="//doc:Section3Requirements/doc:LookTepNotes != ''">
						<layout:element type="block" value="//doc:Section3Requirements/doc:LookTepNotes">Примечание: </layout:element>
					</xsl:if>
				</xsl:if>
				<layout:item label="Нормативный вид участка" value="//doc:Section3Requirements/doc:LandType"/>
				<xsl:if test="//doc:Section3Requirements/doc:Regl != ''">
					<layout:item label="Обязательность рассмотрения Архитектурным советом">
						<layout:text>Архитектурно-градостроительное решение объекта капитального строительства подлежит обязательному рассмотрению Архитектурным советом города Москвы</layout:text>
					</layout:item>
				</xsl:if>
			</xsl:if>
			<xsl:if test="//doc:FormVersion = 3">
				<layout:item label="Предельные (минимальные и (или) максимальные размеры) земельных участков объектов капитального строительства, в том числе площадь" value="//doc:Section3Requirements/doc:CapObjectName" type="text"/>
				<layout:item label="Назначение объекта капитального строительства" value="//doc:Section3Requirements/doc:Purpose" format="text"/>
				<table style="width:initial;">
					<xsl:for-each select="//doc:Section3Requirements/doc:CapObject">
						<tr>
							<td>№</td>
							<td style="border-bottom: 1px solid #E5E6E6">
								<xsl:value-of select="doc:CapObjectNum"/>
							</td>
							<td>,</td>
							<td style="border-bottom: 1px solid #E5E6E6">
								<xsl:value-of select="doc:CapObjectPurpose"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>(согласно чертежу)</td>
							<td></td>
							<td>(назначение объекта капитального строительства)</td>
						</tr>
					</xsl:for-each>
				</table>
				<xsl:if test="//doc:Section3Requirements/doc:LandObject/doc:LandNum !='' or //doc:Section3Requirements/doc:LandObject/doc:Landlangth !='' or //doc:Section3Requirements/doc:LandObject/doc:Landwidth !='' or //doc:Section3Requirements/doc:LandObject/doc:RightOfWay !='' or //doc:Section3Requirements/doc:LandObject/doc:ProtectionZones !='' or //doc:Section3Requirements/doc:LandObject/doc:LandArea !='' or //doc:Section3Requirements/doc:LandObject/doc:ObjectNumber !='' or //doc:Section3Requirements/doc:LandObject/doc:LandSizeMin !='' or //doc:Section3Requirements/doc:LandObject/doc:LandSizeMax !='' or //doc:Section3Requirements/doc:CapArea !=''">
					<table class="tableCardStyle test" style="width:100%;">
						<thead>
							<tr>
								<th rowspan="2">Номер участка согласно чертежу</th>
								<th rowspan="2">1. Длина (метров)</th>
								<th rowspan="2">2. Ширина (метров)</th>
								<th rowspan="2">3. Полоса отчуждения</th>
								<th rowspan="2">4. Охранные зоны</th>
								<th rowspan="2">5. Площадь земельного участка (га)</th>
								<th rowspan="2">6. Номер объекта кап.стр-ва согласно чертежу</th>
								<th colspan="2">7. Размер(м)</th>
								<th rowspan="2">8. Площадь объекта кап. строительства (кв.м)</th>
							</tr>
							<tr>
								<th>Минимальный</th>
								<th>Максимальный</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><xsl:value-of select="//doc:Section3Requirements/doc:LandObject/doc:LandNum"/></td>
								<td><xsl:value-of select="//doc:Section3Requirements/doc:LandObject/doc:Landlangth"/></td>
								<td><xsl:value-of select="//doc:Section3Requirements/doc:LandObject/doc:Landwidth"/></td>
								<td><xsl:value-of select="//doc:Section3Requirements/doc:LandObject/doc:RightOfWay"/></td>
								<td><xsl:value-of select="//doc:Section3Requirements/doc:LandObject/doc:ProtectionZones"/></td>
								<td><xsl:value-of select="//doc:Section3Requirements/doc:LandObject/doc:LandArea"/></td>
								<td><xsl:value-of select="//doc:Section3Requirements/doc:LandObject/doc:ObjectNumber"/></td>
								<td><xsl:value-of select="//doc:Section3Requirements/doc:LandObject/doc:LandSizeMin"/></td>
								<td><xsl:value-of select="//doc:Section3Requirements/doc:LandObject/doc:LandSizeMax"/></td>
								<td><xsl:value-of select="//doc:Section3Requirements/doc:LandObject/doc:CapArea"/></td>
							</tr>
						</tbody>
					</table>
				</xsl:if>
				<layout:item label="Предельное количество этажей или предельная высота зданий, строений, сооружений">
					<xsl:if test="count(//doc:PowerLikeGPZU[doc:PowerName = 'Этажность']/doc:PowerValueMax) &gt; 0">
						<layout:element value="//doc:PowerLikeGPZU[doc:PowerName = 'Этажность']/doc:PowerValueMax"/>
					</xsl:if>
					<xsl:if test="count(//doc:PowerLikeGPZU[doc:PowerName = 'Высотность']/doc:PowerValueMax) &gt; 0">
						<layout:element value="//doc:PowerLikeGPZU[doc:PowerName = 'Высотность']/doc:PowerValueMax"/>
					</xsl:if>
				</layout:item>
				<xsl:if test="//doc:Section3Requirements/doc:BuildPercentMax != ''">
					<!-- <layout:item label="Максимальный процент застройки в границах земельного участка">
              <layout:element type="line" value="//doc:Section3Requirements/doc:BuildPercentMax"/>
              <layout:element type="line" value="//doc:Section3Requirements/doc:BuildPercentRem">% (</layout:element>
              <layout:text>)</layout:text>
            </layout:item> -->
					<div class="cat">
						<div class="key">
							<span>Максимальный процент застройки в границах земельного участка</span>
						</div>
						<div class="value">
							<xsl:value-of select="//doc:Section3Requirements/doc:BuildPercentMax"/>
							<xsl:if test="//doc:Section3Requirements/doc:BuildPercentRem !=''">
								<xsl:text> (</xsl:text>
								<xsl:value-of select="//doc:Section3Requirements/doc:BuildPercentRem"/>
								<xsl:text>)</xsl:text>
							</xsl:if>
						</div>
					</div>
				</xsl:if>
				<layout:item label="Нормативный вид участка" value="//doc:Section3Requirements/doc:LandType"/>
				<xsl:if test="//doc:Section3Requirements/doc:Regl = 1">
					<layout:item label="Обязательность рассмотрения Архитектурным советом">
						<layout:text>Архитектурно-градостроительное решение объекта капитального строительства подлежит обязательному рассмотрению Архитектурным советом города Москвы</layout:text>
					</layout:item>
				</xsl:if>
				<layout:item label="Требования к назначению, параметрам и размещению объекта капитального строительства на указанном земельном участке" value="//doc:Section3Requirements/doc:CapObjFunctionLS"/>
				<layout:item type="text" label="Предельные (минимальные и (или) максимальные) размеры земельных участков" value="//doc:Section3Requirements/doc:CapObjectNameLS"/>
				<layout:item label="Назначение объекта капитального строительства" value="//doc:Section3Requirements/doc:PurposeLS"/>
				<table style="width:initial;">
					<xsl:for-each select="//doc:Section3Requirements/doc:CapObjectLS">
						<tr>
							<td>№</td>
							<td style="border-bottom: 1px solid #E5E6E6">
								<xsl:value-of select="doc:CapObjectNumLS"/>
							</td>
							<td>,</td>
							<td style="border-bottom: 1px solid #E5E6E6">
								<xsl:value-of select="doc:CapObjectPurposeLS"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>(согласно чертежу)</td>
							<td></td>
							<td>(назначение объекта капитального строительства)</td>
						</tr>
					</xsl:for-each>
				</table>
				<table class="tableCardStyle test" style="width:100%;">
					<thead>
						<tr>
							<th>Номер Участка согласно чертежу</th>
							<th>Длина(метров)</th>
							<th>Ширина(метров)</th>
							<th>Полоса отчуждения</th>
							<th>Охранные зоны</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<xsl:value-of select="//doc:Section3Requirements/doc:Land/doc:LandNum"/>
							</td>
							<td>
								<xsl:value-of select="//doc:Section3Requirements/doc:Land/doc:LandLength"/>
							</td>
							<td>
								<xsl:value-of select="//doc:Section3Requirements/doc:Land/doc:Landwidth"/>
							</td>
							<td>
								<xsl:value-of select="//doc:Section3Requirements/doc:Land/doc:RightOfWay"/>
							</td>
							<td>
								<xsl:value-of select="//doc:Section3Requirements/doc:Land/doc:ProtectionZones"/>
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:if>

		</layout:block>

      <xsl:if test="
         	count(//doc:PowerLikeGPZU) &gt; 0 or
            count(//doc:PowerLikeARI) &gt; 0 or
            count(//doc:PowerLikeOM) &gt; 0 or
            //doc:PowerLikeGPZUOtherTep != '' or
            //doc:PowerLikeARIOtherTep != ''
      ">
		<!-- Технико-экономические показатели -->
		<layout:block>
            <layout:header>Технико-экономические показатели</layout:header>
			<xsl:for-each select="//doc:PowerLikeARI">
				<div class="cat">
					<div class="key">
						<span>
							<xsl:value-of select="doc:PowerName"/>
						</span>
					</div>
					<div class="value">
						<xsl:value-of select="doc:PowerValue"/>
						<xsl:text>
						</xsl:text>
						<xsl:value-of select="doc:PowerComment"/>
					</div>
				</div>
			</xsl:for-each>
			<layout:item label="Иные показатели" value="//doc:PowerLikeGPZUOtherTep"/>
			<layout:item label="Иные показатели" value="//doc:PowerLikeARIOtherTep"/>
			<xsl:for-each select="//doc:PowerLikeOM">
				<div class="cat">
					<div class="key">
						<span>
							<xsl:value-of select="doc:PowerName"/>
						</span>
					</div>
					<div class="value">
						<xsl:value-of select="doc:PowerValue"/>
						<xsl:text>
						</xsl:text>
						<xsl:value-of select="doc:PowerComment"/>
					</div>
				</div>
			</xsl:for-each>

			<xsl:if test="count(//doc:PowerLikeGPZU) &gt; 0">

        		<xsl:variable name="PowerValueMinCount" select="count(//doc:PowerLikeGPZU//doc:PowerValueMin)"/>
        		<xsl:variable name="PowerValueMaxCount" select="count(//doc:PowerLikeGPZU//doc:PowerValueMax)"/>

				<table class="tableCardStyle test" style="width:100%;">
					<thead>
						<tr>
							<th>Показатель</th>
              				<th>Значение</th>
              				<xsl:if test="$PowerValueMinCount &gt; 0">
              					<th>Min</th>
              				</xsl:if>
              				<xsl:if test="$PowerValueMaxCount &gt; 0">
              					<th>Max</th>
              				</xsl:if>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="//doc:PowerLikeGPZU">
							<tr>
								<td>
									<xsl:value-of select="doc:PowerName"/>
								</td>
                				<td>
									<xsl:value-of select="doc:PowerValue"/>
								</td>
                                <xsl:if test="$PowerValueMinCount &gt; 0">
                                  <td>
                                      <xsl:value-of select="doc:PowerValueMin"/>
                                  </td>
                                </xsl:if>
                                <xsl:if test="$PowerValueMaxCount &gt; 0">
                                  <td>
                                      <xsl:value-of select="doc:PowerValueMax"/>
                                  </td>
                				</xsl:if>
							</tr>
							<xsl:if test="doc:OtherTep != ''">
								<tr>
									<td>Иные показатели</td>
									<td colspan="2">
										<xsl:call-template name="nl2br_template">
											<xsl:with-param name="str" select="doc:OtherTep"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>

		</layout:block>
      </xsl:if>
		<!-- Информация о расположенных в границах земельного участка объектах капитального строительства и объектах культурного наследия -->
		<layout:block>
			<layout:header>Информация о расположенных в границах земельного участка объектах капитального строительства и объектах культурного наследия</layout:header>
			<xsl:choose>
				<xsl:when test="//doc:Section4Objects[doc:CapObject='Отсутсвуют' or doc:CapObject='отсутсвуют' or doc:CapObject='Отсутсвует' or doc:CapObject='отсутсвует']">
					<layout:item label="Объекты капитального строительства">
						<layout:text value="Отсутсвуют"/>
					</layout:item>
				</xsl:when>
				<xsl:when test="//doc:Section4Objects[doc:CapObject='Имеется' or doc:CapObject='имеется' or doc:CapObject='Имеются' or doc:CapObject='имеются']">
					<span style="margin:10px 0px; font-weight:bold; display: inline-block;">Объекты капитального строительства</span>
					<table class="tableCardStyle test" style="width:100%;">
						<thead>
							<tr>
								<th>Номер на чертеже, адрес</th>
								<th>Класс</th>
								<th>Общая площадь</th>
								<th>Этажность</th>
								<th>Год постройки</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="//doc:ObjCapitalConstr/doc:Section4Objects/doc:ObjCapitalConstr">
								<xsl:sort select="doc:CapDevNumInt" order="ascending" data-type="number"/>
								<tr>
									<td>
										<xsl:if test="doc:CapDevNum !=''">
											<xsl:text>№ </xsl:text>
											<xsl:value-of select="doc:CapDevNum"/>
											<xsl:text>
											</xsl:text>
										</xsl:if>
										<xsl:value-of select="doc:CapDevName"/>
									</td>
									<td>
										<xsl:value-of select="doc:Class"/>
									</td>
									<td>
										<xsl:value-of select="doc:TotalArea"/>
									</td>
									<td>
										<xsl:value-of select="doc:StoreysUnderGround"/>
									</td>
									<td>
										<xsl:value-of select="doc:BuildYear"/>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<div class="cat">
											<div class="key">
												<span>Регистрация в Адресном реестре</span>
											</div>
											<div class="value">
												<xsl:choose>
													<xsl:when test="string(doc:ARReg) = string(1)">
														<xsl:text>Есть</xsl:text>
													</xsl:when>
													<xsl:when test="string(doc:ARReg) = string(2)">
														<xsl:text>Нет</xsl:text>
													</xsl:when>
													<xsl:when test="string(doc:ARReg) = string(3)">
														<xsl:text>Не определено</xsl:text>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="doc:ARReg"/>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:if test="(doc:ARRegNum !='' or doc:ArRegDate !='') and doc:ARReg">
													<br/>
												</xsl:if>
												<xsl:if test="doc:ARRegNum !=''">
													<xsl:text>№ </xsl:text>
													<xsl:value-of select="doc:ARRegNum"/>
												</xsl:if>
												<xsl:if test="doc:ArRegDate !=''">
													<xsl:text> от </xsl:text>
													<xsl:call-template name="date_transform">
														<xsl:with-param name="old_date" select="doc:ArRegDate"/>
													</xsl:call-template>
												</xsl:if>
											</div>
										</div>
										<xsl:if test="doc:IdentifyHelp !=''">
											<div class="cat">
												<div class="key">
													<span>Справка об идентификации адреса объекта</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:IdentifyHelp"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:InventNumName !='' or doc:InventNum !=''">
											<div class="cat">
												<div class="key">
													<span>
														<xsl:value-of select="doc:InventNumName"/>
													</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:InventNum"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:TIBBlock !=''">
											<div class="cat">
												<div class="key">
													<span>Учётный городской квартал БТИ</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:TIBBlock"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:TypeBuilding !='' or doc:AddBuilding !=''">
											<div class="cat">
												<div class="key">
													<span>Тип помещения</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:TypeBuilding"/>
													<xsl:if test="doc:TypeBuilding !='' and doc:AddBuilding !=''">
														<br/>
													</xsl:if>
													<xsl:value-of select="doc:AddBuilding"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:Building !=''">
											<div class="cat">
												<div class="key">
													<span>Здание/строение</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:Building"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:WallMaterial !=''">
											<div class="cat">
												<div class="key">
													<span>Материал стен</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:WallMaterial"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:BuildArea !=''">
											<div class="cat">
												<div class="key">
													<span>Площадь застройки</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:BuildArea"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:LivingSpace !=''">
											<div class="cat">
												<div class="key">
													<span>Жилая площадь жилых помещений (кв.м.)</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:LivingSpace"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:LivingSpaceNon !=''">
											<div class="cat">
												<div class="key">
													<span>Жилая площадь в нежилых помещениях (кв.м.) </span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:LivingSpaceNon"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:NonLivingSpace !=''">
											<div class="cat">
												<div class="key">
													<span>Нежилая площадь (кв.м.)</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:NonLivingSpace"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:TotalAreaAll !=''">
											<div class="cat">
												<div class="key">
													<span>Общая площадь, всего (кв. м.)</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:TotalAreaAll"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:NameLaw !=''">
											<div class="cat">
												<div class="key">
													<span>Правообладатель</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:NameLaw"/>
												</div>
											</div>
										</xsl:if>
										<xsl:if test="doc:CapObjectData !=''">
											<div class="cat">
												<div class="key">
													<span>Данные подготовлены по материалам</span>
												</div>
												<div class="value">
													<xsl:value-of select="doc:CapObjectData"/>
												</div>
											</div>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:when>
				<xsl:otherwise>
					<layout:item label="Объекты капитального строительства">
						<layout:text value="Информация отсутсвует"/>
					</layout:item>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="//doc:Section4Objects/doc:CapCultObject='Имеется'">
					<table class="tableCardStyle test" style="width:100%;">
						<thead>
							<tr>
								<th>Номер на чертеже, адрес</th>
								<th>Наименование объекта</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="//doc:ObjCultHeritage/doc:Section4Objects/doc:ObjCultHeritage">
								<xsl:sort select="doc:CultNum" order="ascending" data-type="number"/>
								<tr>
									<td>
										<xsl:if test="doc:CultNum !=''">
											<xsl:text>№ </xsl:text>
											<xsl:value-of select="doc:CultNum"/>
										</xsl:if>
										<xsl:if test="doc:CultNumAddress !=''">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="doc:CultNumAddress"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										<xsl:text>
										</xsl:text>
										<xsl:value-of select="doc:CultAddress"/>
									</td>
									<td>
										<xsl:value-of select="doc:CultName"/>
									</td>
									<tr>
										<td colspan="2">
											<xsl:if test="doc:CultIdentNum !=''">
												<div class="cat">
													<div class="key">
														<span>Идентификационный номер</span>
													</div>
													<div class="value">
														<xsl:value-of select="doc:CultIdentNum"/>
													</div>
												</div>
											</xsl:if>
											<xsl:if test="doc:HistoryLand !=''">
												<div class="cat">
													<div class="key">
														<span>Историческая территория</span>
													</div>
													<div class="value">
														<xsl:value-of select="doc:HistoryLand"/>
													</div>
												</div>
											</xsl:if>
											<xsl:if test="doc:EnsembleName !=''">
												<div class="cat">
													<div class="key">
														<span>Наименование ансамбля</span>
													</div>
													<div class="value">
														<xsl:value-of select="doc:EnsembleName"/>
													</div>
												</div>
											</xsl:if>
											<xsl:if test="doc:CultCategory !=''">
												<div class="cat">
													<div class="key">
														<span>Категория</span>
													</div>
													<div class="value">
														<xsl:value-of select="doc:CultCategory"/>
													</div>
												</div>
											</xsl:if>
											<xsl:if test="doc:CultProtect !=''">
												<div class="cat">
													<div class="key">
														<span>Охранный статус</span>
													</div>
													<div class="value">
														<xsl:value-of select="doc:CultProtect"/>
													</div>
												</div>
											</xsl:if>
											<xsl:if test="doc:TypeRealty !=''">
												<div class="cat">
													<div class="key">
														<span>Тип объекта недвижимости</span>
													</div>
													<div class="value">
														<xsl:value-of select="doc:TypeRealty"/>
													</div>
												</div>
											</xsl:if>
											<xsl:if test="doc:KindRealty !=''">
												<div class="cat">
													<div class="key">
														<span>Вид объекта</span>
													</div>
													<div class="value">
														<xsl:value-of select="doc:KindRealty"/>
													</div>
												</div>
											</xsl:if>
											<xsl:if test="doc:HistoryValuable !=''">
												<div class="cat">
													<div class="key">
														<span>Историческая культурная ценность</span>
													</div>
													<div class="value">
														<xsl:value-of select="doc:HistoryValuable"/>
													</div>
												</div>
											</xsl:if>
										</td>
									</tr>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:when>
				<xsl:otherwise>
					<layout:item label="Объекты, включенные в Единый государственный реестр объектов культурного наследия (памятников истории и культуры) народов Российской Федерации">
						<layout:text value="Не имеется"/>
					</layout:item>
				</xsl:otherwise>
			</xsl:choose>

		</layout:block>
		<!-- Информация о технических условиях подключения объектов капитального строительства к сетям инженерно-технического обеспечения -->
		<xsl:if test="//doc:FormVersion !=3">
			<layout:block>
				<layout:header>Информация о технических условиях подключения объектов капитального строительства к сетям инженерно-технического обеспечения</layout:header>
				<layout:element format="nl2br" value="//doc:Section5TechCondition"/>

			</layout:block>
		</xsl:if>
		<!-- Информация о возможности или невозможности разделения земельного участка -->
		<layout:block>
			<layout:header>Информация о возможности или невозможности разделения земельного участка</layout:header>
			<layout:element value="//doc:Section6SplitLand"/>

		</layout:block>
		<!-- Комиссии -->
		<xsl:if test="//doc:SectionCommissions !=''">
			<layout:block>
				<layout:header>Комиссии</layout:header>
				<table class="tableCardStyle test" style="width:100%;">
					<thead>
						<tr>
							<th>Наименование Комиссии</th>
							<th>Начато</th>
							<th>Рег №</th>
							<th>№ и дата протокола</th>
							<th>Пункт</th>
							<th>Решение</th>
							<th>Примечание</th>
							<th>Закончено</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="//doc:SectionCommissions/doc:Commission">
							<xsl:sort select="string-length(doc:LineNum)" order="ascending"/>
							<xsl:sort select="doc:LineNum" order="ascending"/>
							<xsl:variable name="num" select="doc:LineNum"/>
							<tr>
								<td>
									<xsl:value-of select="doc:NameCommission"/>
								</td>
								<td>
									<xsl:call-template name="date_transform">
										<xsl:with-param name="old_date" select="doc:Begun"/>
									</xsl:call-template>
								</td>
								<td>
									<xsl:value-of select="doc:RegNum"/>
								</td>
								<td>
									<xsl:for-each select="//..//doc:SCommission">
										<xsl:if test="$num = doc:SLineNum">
											<xsl:choose>
												<xsl:when test="string-length(doc:Sdoc_key_gzk_q) &gt; 0">
													<a>
														<xsl:attribute name="href">
															<xsl:text>getCardHtml.action?cardId=CARD$DOC_REDIRECT&amp;documentId=</xsl:text>
															<xsl:value-of select="doc:Sdoc_key_gzk_q"/>
														</xsl:attribute>
														<xsl:value-of select="doc:SReportNum"/>
														<xsl:text> от </xsl:text>
														<xsl:call-template name="date_transform">
															<xsl:with-param name="old_date" select="doc:SReportDate"/>
														</xsl:call-template>
													</a>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="doc:SReportNum"/>
													<xsl:text> от </xsl:text>
													<xsl:call-template name="date_transform">
														<xsl:with-param name="old_date" select="doc:SReportDate"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td>
									<xsl:value-of select="doc:Item"/>
								</td>
								<td>
									<xsl:value-of select="doc:Decision"/>
								</td>
								<td>
									<xsl:value-of select="doc:Note"/>
								</td>
								<td>
									<xsl:call-template name="date_transform">
										<xsl:with-param name="old_date" select="doc:Ffinished"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>

			</layout:block>
		</xsl:if>
	</xsl:variable>
	<!-- **************************** Основной темплейт ******************************** -->
	<xsl:template match="/">
		<style>
        .subTable {
          margin: 5px 0 10px 0;
          padding: 10px 10px 10px 30px;
          background-color: #EEE;
          font-weight: bold;
        }
      </style>
		<xsl:call-template name="Context.setNamespace">
			<xsl:with-param name="namespacePrefix">doc</xsl:with-param>
			<xsl:with-param name="namespaceURI">http://xmlns.oracle.com/MSG_GPZU_Card</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="pageBuilder">
			<xsl:with-param name="data" select="/"/>
			<xsl:with-param name="layout" select="$LAYOUT"/>
		</xsl:call-template>
		<xml style="display: none">
          <xsl:copy-of select="/"/>
        </xml>
	</xsl:template>
	<xsl:template name="nl2br_template">
		<xsl:param name="str"/>
		<xsl:variable name="c10"><xsl:text>
			</xsl:text></xsl:variable>
		<div><xsl:value-of select="normalize-space(substring-before($str,$c10))"/></div>
		<xsl:choose>
			<xsl:when test="contains($str,$c10)">
				<xsl:call-template name="nl2br">
					<xsl:with-param name="s" select="substring-after($str,$c10)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$str"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон описания элементов для формы -->
    {B{CARD$HTML_TEMPLATE}E}

      <xsl:template match="//FNO_306/ROW_SET/ROW">
        <xsl:variable name="parent" select="//FNO_306/ROW_SET/ROW[ID_PARENT=current()/ID]"/>
        <li data-leaf="{IS_LEAF}">
		<span>
            <xsl:attribute name="onclick">
				<xsl:if test="IS_LEAF = '0'">
					<xsl:text>$(this).closest('li').toggleClass('nested-list-expanded');</xsl:text>
      			</xsl:if>
			</xsl:attribute>
      		<xsl:value-of select="CODE"/>
      		<xsl:text> </xsl:text>
      		<xsl:value-of select="NAME"/>
		</span>
      <xsl:if test="$parent != ''">
        <ul>
             <xsl:apply-templates select="$parent"/>
        </ul>
      </xsl:if>
      </li>
  </xsl:template>
</xsl:stylesheet>