<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">

    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

     <xsl:variable name="DOCUMENT_INFO_NEW">
                    <layout:simple-field label="Тип документа" class="full" required="1">
                    <!--<layout:select xmlTag="DocumentType" value="//gbu:DocumentToCorrect//gbu:DocumentType"  listSourceID="NSI_DOC_TYPES"/>-->
                        <layout:select xmlTag="DocumentType" value="/ROOT/DocumentType" listSourceID="GBU_DOC_TYPES" readonly="//PARAMETER_MAP//TEP_NAME"/>
                    </layout:simple-field>

                     <layout:simple-field label="Номер" class="medium" required="0">
                        <layout:edit type="TEXT" xmlTag="DocumentNumber" value="/ROOT/NewDocumentDetails_Number"/>
                        <label>Дата</label>
                        <layout:edit type="DATE" xmlTag="DocumentDate" value="/ROOT/NewDocumentDetails_Date"/>
                    </layout:simple-field>

                       <layout:hiddenSection>
                       <layout:simple-field label="ID документа" class="full" required="0">
                         <layout:edit type="TEXT" xmlTag="DocumentID" value="/ROOT/DocumentID"/>
                         </layout:simple-field>
                  </layout:hiddenSection>
     </xsl:variable>

   <xsl:variable name="DOCUMENT_INFO">
                    <layout:simple-field label="Тип документа" class="full" required="1">
            <layout:hidden xmlTag="DocumentType" value="/ROOT/DocumentType"/>
                    </layout:simple-field>

                     <layout:simple-field label="Номер" class="medium" required="0">
                        <layout:edit type="TEXT" xmlTag="DocumentNumber" value="/ROOT/NewDocumentDetails_Number"/>
                        <label>Дата</label>
                        <layout:edit type="DATE" xmlTag="DocumentDate" value="/ROOT/NewDocumentDetails_Date"/>
                    </layout:simple-field>

                       <layout:hiddenSection>
                       <layout:simple-field label="ID документа" class="full" required="0">
                         <layout:edit type="TEXT" xmlTag="DocumentID" value="/ROOT/DocumentID"/>
                         </layout:simple-field>
                  </layout:hiddenSection>
     </xsl:variable>

     <xsl:variable name="OBJECT_INFO">
        <div xmlTag="ObjectInfo" value="/ROOT/DocContent/gbu:ObjectInfo">
                    <xsl:if test="(exists(//PARAMETER_MAP//ATTR)) or (exists(//PARAMETER_MAP//TEP_NAME))">
                       <layout:hiddenSection>
                          <layout:simple-field label="Объект реестра строек" class="full" required="0">
                          <!--  <layout:multiselect name="ObjectInfo.ObjectId" xmlTag="ObjectId" value="//gbu:ObjectInfo//gbu:ObjectId" limit="1" listSourceID="OBJECTS_ALL"/>-->
                          <layout:multiselect xmlTag="ObjectId" value="//ROOT//ObjectId" limit="1" listSourceID="OBJECTS_ALL"/>
                         </layout:simple-field>
                       </layout:hiddenSection>
                    </xsl:if>

                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)) and not (exists(//PARAMETER_MAP//TEP_NAME))">
                      <layout:simple-field label="Объект реестра строек" class="full" required="0">
                      <!--  <layout:multiselect name="ObjectInfo.ObjectId" xmlTag="ObjectId" value="//gbu:ObjectInfo//gbu:ObjectId" limit="1" listSourceID="OBJECTS_ALL"/>-->
                        <layout:multiselect xmlTag="ObjectId" value="//ROOT//ObjectId" limit="1" listSourceID="OBJECTS_ALL"/>
                      </layout:simple-field>
                    </xsl:if>

                   <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='ObjUID'">
               <layout:simple-field label="Уникальный идентификатор" class="full" required="0">
                        <layout:edit type="TEXT" xmlTag="ObjUID" value="//OBJUID//OBJUID"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                    </layout:simple-field>
                    </xsl:if>

                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='ObjectName'">
                      <layout:simple-field label="Наименование объекта" class="full" required="0">
                        <layout:edit type="TEXT" xmlTag="ObjectName" value="//gbu:ObjectInfo//gbu:ObjectName"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                      </layout:simple-field>
                    </xsl:if>

               <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='PostAddress'">
               <layout:simple-field label="Присвоенный адрес" class="full" required="0">
                        <layout:edit type="TEXT" xmlTag="PostAddress" value="//gbu:ObjectInfo//gbu:PostAddress"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>



              <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='ObjectDistrict'">
              <layout:simple-field label="Район" class="full" required="0">
                        <layout:multiselect xmlTag="ObjectDistrict" value="//PARAMETER_MAP//ATTRVAL" limit="10" listSourceID="NSI_OMKTE_DISTRICT"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>

                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='ObjectOkrug'">
              <layout:simple-field label="Округ" class="full" required="0">
                        <layout:multiselect xmlTag="ObjectArea" value="//PARAMETER_MAP//ATTRVAL" limit="10" listSourceID="NSI_OMKTE_OKRUG"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>

                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='ObjectAddress'">
                    <layout:simple-field label="Строительный адрес" class="full" required="0">
                        <layout:edit type="TEXT" xmlTag="ObjectAddress" value="//gbu:ObjectInfo//gbu:ObjectAddress"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>


                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='ConstructionWorkType'">
               <layout:simple-field label="Вид работ" class="full" required="0">
                        <layout:multiselect xmlTag="ConstructionWorkType" value="//gbu:ObjectInfo//gbu:ConstructionWorkType" limit="1" listSourceID="rc_work_types_name"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>

                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='SourceOfFinance'">
               <layout:simple-field label="Источник финансирования" class="full" required="0">
                        <layout:multiselect xmlTag="SourceOfFinance" value="//gbu:ObjectInfo//gbu:SourceOfFinance" limit="1" listSourceID="NSI_MAT_FIN_SOURCE_NAME"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>

                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='ProjectSer'">
                    <layout:simple-field label="Серия проекта" class="full" required="0">
                        <layout:multiselect xmlTag="ProjectSer" value="//gbu:ObjectInfo//gbu:ProjectSer" limit="1" listSourceID="NSI_RC_PROJECT_SER"/>
                         <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>

                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='ObjectCondition'">
                    <layout:simple-field label="Состояние объекта" class="full" required="0">
                        <layout:multiselect xmlTag="ObjectCondition" value="//gbu:ObjectInfo//gbu:ProjectSer" limit="1" listSourceID="RS_OBJECT_STATUSES"/>
                         <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>


                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='MainFunctional'">
                    <layout:simple-field label="Основное функциональное назначение" class="full" required="0">
                        <layout:multiselect xmlTag="MainFunctional" value="//gbu:ObjectInfo//gbu:MainFunctional" limit="1" listSourceID="MAT_RC_OBJ_TYPES"/>
                         <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>

                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='AdditionalFunctional'">
                    <layout:simple-field label="Дополнительные виды использования" class="full" required="0">
                        <layout:multiselect xmlTag="AdditionalFunctional" value="//gbu:ObjectInfo//gbu:AdditionalFunctional" limit="10" listSourceID="MAT_RC_OBJ_TYPES"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>

                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='PlanDateEndOks'">
                    <layout:simple-field label="Плановый год ввода (итоговый)" class="medium" required="0">
                        <layout:edit type="DATE" xmlTag="PlanDateEndOks" style="width:100px;" value="//gbu:ObjectInfo//gbu:PlanDateEndOks"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>

                  <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='OksX'">
               <layout:simple-field label="Координаты ОКС" class="medium" required="0">
                        <label style="width:60px;">Х</label>
                        <layout:edit type="TEXT" style="width:60px;" xmlTag="OksX" value="//gbu:ObjectInfo//gbu:OksX"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>

                   <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='OksY'">
                     <layout:simple-field label="Координаты ОКС" class="medium" required="0">
                        <label style="width:60px;">Y</label>
                        <layout:edit type="TEXT" style="width:60px;" xmlTag="OksY" value="//gbu:ObjectInfo//gbu:OksY"/>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                    </layout:simple-field>
                    </xsl:if>

                   <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='KadastrNumber'">
                     <layout:section xmlTag="Land" label="Кадастровые номера" add="1" delete="1" select="//PARAMETER_MAP">
                     <layout:simple-field label="Кадастровый номер" class="medium" required="0">
                            <layout:edit type="TEXT" xmlTag="CadastralNumber" style="width:220px;" value="NULL"/>
                            <xsl:if test="//PARAMETER_MAP//ATTRVAL != ''"><layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint></xsl:if>
                            <xsl:if test="//PARAMETER_MAP//DOC_TYPE != ''"><layout:hint visible="//PARAMETER_MAP//DOC_TYPE">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint></xsl:if>
                      </layout:simple-field>
                    </layout:section>
                       </xsl:if>

                   <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='obj_list'">
                     <layout:simple-field label="Перечни" class="full" required="0">
                      <layout:multiselect xmlTag="ProgramID" value="//gbu:DocContent//gbu:Programs" limit="10" listSourceID="OBJECT_LISTS"/>
                    </layout:simple-field>
                    </xsl:if>

                   <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='FNO_306_PP'">
                    <layout:simple-field label="Функциональное назначение по 306-ПП" class="full" required="0">
                        <xsl:choose>
                          <xsl:when test="//PARAMETER_MAP//DOC_TYPE_NICK='GPZUDoc'">
                          <layout:multiselect xmlTag="FNO_306_PP" value="//gbu:ObjectInfo//gbu:FNO_306_PP" limit="1000" button="true" viewingID="FAEFE0AD8287490FB306FC8ACA1BA0AA" listSourceID="FNO_306_PP"/>
                          </xsl:when>
                          <xsl:otherwise>
                            <layout:multiselect xmlTag="FNO_306_PP" value="//gbu:ObjectInfo//gbu:FNO_306_PP" limit="1" button="true" viewingID="FAEFE0AD8287490FB306FC8ACA1BA0AA" listSourceID="FNO_306_PP"/>
                          </xsl:otherwise>
                        </xsl:choose>
                        <!--
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Текущее значение: <xsl:value-of select="//PARAMETER_MAP//ATTRVAL"/> </layout:hint>
                        <layout:hint visible="//PARAMETER_MAP//ATTRVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>
                        -->
                    </layout:simple-field>
                    </xsl:if>

                    <xsl:if test="not(exists(//PARAMETER_MAP//ATTR)or exists(//PARAMETER_MAP//TEP_NAME)) or //PARAMETER_MAP//ATTR='SD_KOD_BUILD'">
                    <layout:simple-field label="Основные виды разрешенного использования" class="full" required="0">
					<layout:multiselect xmlTag="SD_Kod_Build_ID" value="//gbu:ObjectInfo//gbu:SD_Kod_Build_ID" limit="1000" button="true" viewingID="3CA7648B543C4427A3E7331A7B6F4E93" listSourceID="SD_KOD_BUILD"/>
                    </layout:simple-field>
                    </xsl:if>



                   <layout:hiddenSection>
                      <layout:simple-field label="Старое значение" class="medium" required="0">
                      <layout:edit type="TEXT" style="width:120px;" xmlTag="ValueOld" readonly="//PARAMETER_MAP//ATTRVAL" value="//PARAMETER_MAP//ATTRVAL"/>
                      </layout:simple-field>
                   </layout:hiddenSection>



          </div>

       </xsl:variable>
       <xsl:variable name="PLOT_ATTRS">

                    <layout:section xmlTag="Land" label="Сведения о земельном участве" add="1" delete="1" select="//gbu:DocContent//gbu:Land">


                        <layout:simple-field label="Кадастровый номер" class="medium" required="0">
                            <layout:edit type="TEXT" xmlTag="CadastralNumber" style="width:200px;" value="gbu:CadastralNumber"/>
                        </layout:simple-field>


                        <layout:simple-field label="Адрес земельного участка" class="full" required="0">
                            <layout:edit type="TEXT" xmlTag="Address" value="gbu:Address"/>
                        </layout:simple-field>

                        <layout:simple-field label="Правообладатель" class="full" required="0">
                            <layout:edit type="TEXT" xmlTag="Owner" value="gbu:Owner"/>
                        </layout:simple-field>

                        <layout:simple-field label="Цель использования" class="full" required="0">
                            <layout:edit type="TEXT" xmlTag="Purpse" value="gbu:Purpse"/>
                        </layout:simple-field>
                    </layout:section>
     </xsl:variable>

       <xsl:variable name="TEPS">

    <!-- ***************** ТЭПы начало ********************* -->
  <layout:table style="width:100%;" add="1" move="0">
    <layout:header>
      <layout:cell name="ТЭП" width="310px"/>
      <layout:cell name="Текущее значение" width="130px"/>
      <layout:cell name="Новое значение" width="130px"/>
      <layout:cell name="примечание" width="350px"/>
    </layout:header>
    <layout:body xmlTag="Powers" value="/ROOT/Powers/gbu:Powers">
    <layout:cell>
      <layout:edit type="TEXT" style="width:300px;" xmlTag="PowerName" readonly="//PARAMETER_MAP//TEP_NAME" value="gbu:PowerName"/>
    </layout:cell>
    <layout:cell>
      <layout:edit type="TEXT" style="width:120px;" xmlTag="PowerValueOld" readonly="//PARAMETER_MAP//TEPVAL" value="gbu:PowerVal"/>
    </layout:cell>
    <layout:cell>
      <layout:edit type="TEXT" style="width:120px;" xmlTag="PowerValueFact" value="gbu:PowerValueFact"/>
    </layout:cell>
    <layout:cell>
      <layout:edit type="TEXT" style="width:340px;" xmlTag="PowerComment" value="gbu:PowerComment"/>
    </layout:cell>
    </layout:body>
  </layout:table>

    <layout:hint visible="//PARAMETER_MAP//TEPVAL">Основание: <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE"/> № <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/> от <xsl:value-of select="//PARAMETER_MAP//DOC_DATE"/></layout:hint>


    <!-- ***************** ТЭПы конец ********************* -->
  </xsl:variable>

  <xsl:variable name="LISTS">
      <!-- ***************** Программы и перечни начало ********************* -->
    <!--   <layout:section label="Программы и перечни" select="//gbu:DocContent//gbu:Programs" xmlTag="Programs">-->
              <!--    <layout:section label="Программа/перечень" add="1" delete="1" select="//gbu:DocContent//gbu:Programs" xmlTag="Programs"> -->
                    <layout:simple-field label=" " class="full" required="0">
                      <layout:multiselect xmlTag="ProgramID" value="//gbu:DocContent//gbu:Programs" limit="10" listSourceID="OBJECT_LISTS"/>
                    </layout:simple-field>
     <!--  </layout:section>-->
  </xsl:variable>



     <xsl:variable name="DATA" xmlns="">
      <ROOT>
        <xsl:copy-of select="/ROOT/*"/>
            <!-- вычисление даты нового документа без логики. Просто берется текущая -->
            <NewDocumentDetails_Date>
        <xsl:value-of select="//SYS//SYS_DATE"/>
            </NewDocumentDetails_Date>

            <!-- вычисление номера нового документа по параметру в ссылке -->
      <NewDocumentDetails_Number>
        <xsl:choose>
        <xsl:when test="exists(//PARAMETER_MAP//DOC_NUMBER)">
        <xsl:value-of select="//PARAMETER_MAP//DOC_NUMBER"/>
        </xsl:when>
        <xsl:otherwise>
        <xsl:value-of select="//CURRENT_DOC//DOC_NUM"/>
        </xsl:otherwise>
        </xsl:choose>
      </NewDocumentDetails_Number>

            <!-- вычисление типа документа по параметру в ссылке -->
      <DocumentType>
        <xsl:choose>
        <xsl:when test="exists(//PARAMETER_MAP//DOC_TYPE_ID)">
        <xsl:value-of select="//PARAMETER_MAP//DOC_TYPE_ID"/>
        </xsl:when>
        <xsl:otherwise>
        <xsl:value-of select="//CURRENT_DOC//TYPE_ID"/>
        </xsl:otherwise>
        </xsl:choose>
      </DocumentType>

            <!-- вычисление ID документа по параметру в ссылке  -->
      <DocumentID>
        <xsl:choose>
        <xsl:when test="exists(//PARAMETER_MAP//DOC_KEY)">
        <xsl:value-of select="//PARAMETER_MAP//DOC_KEY"/>
        </xsl:when>
        <xsl:otherwise>
        <xsl:value-of select="//CURRENT_DOC//DOC_KEY"/>
        </xsl:otherwise>
        </xsl:choose>
      </DocumentID>


            <!-- вычисление ID объекта по параметру в ссылке -->
            <ObjectId>
               <xsl:value-of select="//PARAMETER_MAP//OBJECT_ID"/>
            </ObjectId>

            <!-- вычисление ТЭПа по параметру в ссылке  -->
            <Powers>
              <gbu:Powers>
                <gbu:PowerName><xsl:value-of select="//PARAMETER_MAP//TEP_NAME"/></gbu:PowerName>
                    <gbu:PowerVal><xsl:value-of select="//PARAMETER_MAP//TEPVAL"/></gbu:PowerVal>
              </gbu:Powers>
            </Powers>
      </ROOT>
    </xsl:variable>

    <xsl:variable name="LAYOUT">


        <layout:form actionId="RS$GBU_DOC_LOW$FRM" xmlTag="DocContent" xmlNS="http://xmlns.oracle.com/MSG_GBU_doc">

            <layout:hidden name="SOURCE_DOC_ID" value="//cfm:SourceDocID"/>
            <layout:hidden name="DOC_ID" xmlTag="DocId" value="//GBU_DOC_ID//DOCID"/>


            <input type="hidden" name="PROVIDER_CODE" value="ГБУ"/>
            <input type="hidden" name="FORM_CODE" value="GBU_CorrectDoc"/>

            <layout:header>Корректировка атрибута объекта оператором Системы</layout:header>

          <xsl:choose>
          <!-- ***Если пришел атрибут (кроме перечня)*********** -->

          <!--xsl:if test="exists(//PARAMETER_MAP//ATTR) and exists(//PARAMETER_MAP//ATTRVAL) and not (exists(//PARAMETER_MAP//TEP_NAME)) and not(//PARAMETER_MAP//DOC_NUMBER='')"-->
          <xsl:when test="exists(//PARAMETER_MAP//ATTR) and exists(//PARAMETER_MAP//ATTRVAL) and not (exists(//PARAMETER_MAP//TEP_NAME))">

                    <layout:Section xmlTag="DocumentToCorrect">
                    <xsl:copy-of select="$DOCUMENT_INFO_NEW"/>
                    </layout:Section>

                    <xsl:copy-of select="$OBJECT_INFO"/>
          </xsl:when>
          <xsl:otherwise>
            <!-- ***Если пришел атрибут без заначения*********** -->
            <xsl:if test="exists(//PARAMETER_MAP//ATTR) and exists(//PARAMETER_MAP//ATTRVAL) and //PARAMETER_MAP//ATTRVAL='' and //PARAMETER_MAP//DOC_NUMBER=''">

                      <layout:Section xmlTag="DocumentToCorrect">
                      <xsl:copy-of select="$DOCUMENT_INFO_NEW"/>
                      </layout:Section>

                       <xsl:copy-of select="$OBJECT_INFO"/>

            </xsl:if>
          </xsl:otherwise>

          </xsl:choose>



          <!-- ***Если пришел ТЭП (редактируем существующий)*********** -->
          <xsl:if test="exists(//PARAMETER_MAP//TEP_NAME) and not (exists(//PARAMETER_MAP//ATTR)) and not (//PARAMETER_MAP//DOC_NUMBER='')">

               <layout:hiddenSection xmlTag="DocumentToCorrect">
                            <xsl:copy-of select="$DOCUMENT_INFO"/>
               </layout:hiddenSection>

               <xsl:copy-of select="$TEPS"/>
               <xsl:copy-of select="$OBJECT_INFO"/>

          </xsl:if>

          <!-- ***Если пришел ТЭП без значения и без документа (вводим значение взамен пустого)*********** -->
          <xsl:if test="exists(//PARAMETER_MAP//TEP_NAME) and not (exists(//PARAMETER_MAP//ATTR)) and //PARAMETER_MAP//TEPVAL='' and //PARAMETER_MAP//DOC_NUMBER='' ">
               <layout:Section xmlTag="DocumentToCorrect">
          <xsl:copy-of select="$DOCUMENT_INFO_NEW"/>
               </layout:Section>

               <layout:simple-field label=" " class="full" required="0">
                  <label style="width:50px;"> </label>
               </layout:simple-field>

              <xsl:copy-of select="$TEPS"/>

              <xsl:copy-of select="$OBJECT_INFO"/>

          </xsl:if>


          <!-- ***Если НЕ пришел атрибут*********** -->
          <xsl:if test=" (exists(//PARAMETER_MAP//OBJECT_ID)) and  not (exists(//PARAMETER_MAP//ATTR)) and not (exists(//PARAMETER_MAP//TEP_NAME))">
          <layout:tabset>
                <layout:tab label="Документ" xmlTag="DocumentToCorrect">
                    <xsl:copy-of select="$DOCUMENT_INFO_NEW"/>
                </layout:tab>
                    <layout:tab label="Объект">
                    <xsl:copy-of select="$OBJECT_INFO"/>
                </layout:tab>

                    <layout:tab label="ТЭПы">
                    <xsl:copy-of select="$TEPS"/>

                </layout:tab>

            </layout:tabset>
          </xsl:if>

          <!-- ***Если НЕ пришло ничего*********** -->
          <xsl:if test="(not (exists(//PARAMETER_MAP//OBJECT_ID))) and not (exists(//PARAMETER_MAP//ATTR)) and not (exists(//PARAMETER_MAP//TEP_NAME))">

                <layout:tabset>

                <layout:tab label="Документ" xmlTag="DocumentToCorrect">

                    <xsl:copy-of select="$DOCUMENT_INFO_NEW"/>

                </layout:tab>

                <layout:tab label="Объект">
          <xsl:copy-of select="$OBJECT_INFO"/>
                </layout:tab>

                <layout:tab label="Организации">
                    <!-- *****************Организации начало ********************* -->
                    <layout:section label="Организации" add="1" delete="1" select="//gbu:DocContent//gbu:Organizations" xmlTag="Organizations">
                        <layout:simple-field label="Роль" class="medium" required="o">
                            <layout:select name="Organizations.OrganizationRole" value="gbu:OrganizationRole" xmlTag="OrganizationRole" listSourceID="NSI_ORG_ROLE_NAME"/>
                            <label>Название</label>
                            <layout:edit type="TEXT" xmlTag="OrganizationName" value="gbu:OrganizationName"/>
                        </layout:simple-field>

                        <layout:simple-field label="Краткое название" class="medium" required="o">
                            <layout:edit type="TEXT" xmlTag="OrganizationShortName" value="gbu:OrganizationShortName"/>
                            <label>Форма</label>
                            <layout:select name="Organizations.LegalForm" value="gbu:LegalForm" xmlTag="LegalForm" listSource="NSI_ORGANIZATION_OPF"/>
                        </layout:simple-field>

                        <layout:simple-field label="Юридический адрес" class="full" required="0">
                            <layout:edit type="TEXT" xmlTag="LegalAddress" value="gbu:LegalAddress"/>
                        </layout:simple-field>

                        <layout:simple-field label="Почтовый адрес" class="full" required="0">
                            <layout:edit type="TEXT" xmlTag="PostAddress" value="gbu:PostAddress"/>
                        </layout:simple-field>

                        <layout:simple-field label="ОГРН" class="medium" required="0">
                            <layout:edit type="TEXT" xmlTag="ORGN" style="width:120px;" value="gbu:ORGN"/>
                            <label style="width:50px;">ИНН</label>
                            <layout:edit type="TEXT" xmlTag="INN" style="width:120px;" value="gbu:INN"/>
                            <label style="width:50px;">КПП</label>
                            <layout:edit type="TEXT" xmlTag="KPP" style="width:120px;" value="gbu:KPP"/>
                        </layout:simple-field>

                        <layout:simple-field label="OKPO" class="medium" required="0">
                            <layout:edit type="TEXT" xmlTag="OKPO" style="width:120px;" value="gbu:OKPO"/>
                            <label style="width:50px;">ОКВЕД</label>
                            <layout:edit type="TEXT" xmlTag="OKVED" style="width:120px;" value="gbu:OKVED"/>
                            <label style="width:50px;">ОКОНХ</label>
                            <layout:edit type="TEXT" xmlTag="OKONH" style="width:120px;" value="gbu:OKONH"/>
                        </layout:simple-field>

                        <layout:simple-field label="Контактные телефоны" class="medium" required="0">
                            <layout:edit type="TEXT" xmlTag="Phone" style="width:200px;" value="gbu:Phone"/>
                            <label>Руководитель организации</label>
                            <layout:edit type="TEXT" xmlTag="Director" value="gbu:Director"/>
                        </layout:simple-field>

                        <layout:simple-field label="Вышестоящая организация" class="full" required="0">
                            <layout:multiselect xmlTag="ParentOrganization" value="gbu:ParentOrganization" limit="1" listSourceID="ORGANIZATIONS_NAME"/>
                        </layout:simple-field>

                    </layout:section>


                <!-- *****************Организации конец ********************* -->

                </layout:tab>

                <layout:tab label="ТЭПы">
                    <xsl:copy-of select="$TEPS"/>

                </layout:tab>


                <layout:tab label="Программы и перечни" select="//gbu:DocContent//gbu:Programs" xmlTag="Programs">
                    <xsl:copy-of select="$LISTS"/>

                </layout:tab>


              <!-- ***************** ТПрограммы и перечни конец ********************* -->


            </layout:tabset>
          </xsl:if>


            <span class="clearBlock"></span>
            <div class="formSpace"></div>
            <div class="clear"></div>
            <input class="cancel" type="reset" value="Отмена"/>
            <input class="submit" type="submit" value="Сохранить"/>
            <div class="clear padinal"></div>

        </layout:form>

    </xsl:variable>


    {B{FRM$XML_LAYOUT$V0.1}E}

    <!-- **************************** Основной темплейт ******************************** -->
    <xsl:template match="/">
        <xml style="display: none">
          <xsl:copy-of select="*"/>
        </xml>
        <style>
            .sectionContainer{
                width: 905px;
                margin: 15px auto 0;
            }
            .sectionBtnAdd ,
            .sectionBtnDelete {
                background-color: #319adc;
                text-align: center;
                padding: 12px 65px;
                border: 1px solid #D9DBDD;
                outline: none;
                cursor: pointer;
                margin-right: 0;
                background: #fff;
                box-shadow: none;
                transition: all .3s;
            }
            .sectionBtnAdd:hover ,
            .sectionBtnDelete:hover{
                background-color: #2f91fb;
                color: white;
                transition: all .3s;
                border-color: #2f91fb;
            }
            [type="button"].sectionBtnAdd{
                margin-right: 0;
            }
        </style>
        <xsl:call-template name="Context.setNamespace">
            <xsl:with-param name="namespacePrefix">gbu</xsl:with-param>
            <xsl:with-param name="namespaceURI">http://xmlns.oracle.com/MSG_GBU_doc</xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="Context.setNamespace">
            <xsl:with-param name="namespacePrefix">cfm</xsl:with-param>
            <xsl:with-param name="namespaceURI">http://xmlns.oracle.com/COMMON_FORM</xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="data" select="$DATA"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template>

    </xsl:template>

</xsl:stylesheet>
