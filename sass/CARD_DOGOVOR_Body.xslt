<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>


    <!-- Разметка тела карточки -->
    <xsl:variable name="LAYOUT">
        <xml style="display: none">
            <xsl:copy-of select="*"/>
        </xml>

<xsl:variable name="filesPath" select="//FILES/ROW_SET/ROW"/>
<xsl:if test="$filesPath/FILE_CARD_ID !=''">
    {B{CARD$GALLERY_STYLES}E}
    <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/fileBaloon.css"/>
    <div class="files_block pdoc-right-side">
        <div class="content">
                <xsl:if test="$filesPath/FILE_PAGECOUNT &gt; 0">
                  <p class="sectionTitle">Галерея документа</p>
                  <div class="gallery-right">
                    <a href="#" class="main-image" data-images-count="{$filesPath/FILE_PAGECOUNT}" data-id="{$filesPath/FILE_CARD_ID}">
                      <img src="" alt="" rel="galleryRight" page="{$filesPath/FILE_CARD_ID}"/>
                    </a>
                    <xsl:if test="$filesPath/FILE_PAGECOUNT &gt; 0">
                      <div class="other-images">
                        <div class="wrp-images">
                          <xsl:for-each select="$filesPath">
                            <div class="wrp-images-group" data-images-count="{FILE_PAGECOUNT}" data-id="{FILE_CARD_ID}"></div>
                          </xsl:for-each>
                        </div>
                       </div>
                    </xsl:if>
                   </div>
                </xsl:if>

                <div class="preview-wrapper">
                    <xsl:for-each select="$filesPath">
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
                <layout:element type="text" value="Общие сведения"/>
            </layout:header>
            <layout:item label="Номер договора" value="//DOGOVOR_HEAD//DOC_NUMBER"/>
            <layout:item label="Дата  договора" value="//DOGOVOR_HEAD//DOC_DATE"/>
            <layout:item label="Кем зарегистрирован" value="//DOGOVOR_HEAD//DOG_REGISTRATOR"/>
            <layout:item label="Предмет договора" escape="false" value="//DOGOVOR_HEAD//CONTRACT_SUBJECT_TEXT"/>
            <layout:item label="Номер обращения" value="//DOGOVOR_HEAD//REG_NUMDATE"/>
            <layout:item label="Ведущее подразделение" value="//DOGOVOR_HEAD//EXP_DEPARTMENT"/>
            <layout:item label="Наименование объекта" value="//DOGOVOR_HEAD//REQUEST_OBJECT_NAME"/>
            <layout:item label="Адрес объекта" value="//DOGOVOR_HEAD//REQUEST_OBJECT_ADDRES"/>
            <layout:item label="Примечание к договору" value="//DOGOVOR_HEAD//DOG_NOTE"/>
        </layout:block>

        <layout:block>
            <layout:header>
                <layout:element type="text" value="Срок исполнения"/>
            </layout:header>
            <layout:item label="Дата подписания договора" value="//DOGOVOR_HEAD//DOG_DATE_SIGNED"/>
            <layout:item label="Дата передачи заявителю" value="//DOGOVOR_HEAD//DOG_DATE_PASSED"/>
            <layout:item label="Дата начала экспертизы" value="//DOGOVOR_HEAD//DOG_DATE_EXPERT_BEGIN"/>
            <layout:item label="Срок проведения">
                <layout:element type="line" value="//DOGOVOR_HEAD//DOG_EXPERT_PERIOD_DAY"/>
                <layout:element type="line" value="//DOGOVOR_HEAD//DOG_PERIOD_DAY_TYPE_TEXT"/>
            </layout:item>
            <layout:item label="Дата окончания работ по договору" value="//DOGOVOR_HEAD//DOG_DATE_EXPERT_FINISH"/>
            <layout:item label="Дата начала для сведений о прохождении" value="//DOGOVOR_HEAD//DOG_DATE_INFO_BEGIN"/>
            <layout:item label="Плановая дата выпуска" value="//DOGOVOR_HEAD//DOG_DATE_EXPERT_FINISH2"/>
            <layout:item label="Контрольная дата" value="//DOGOVOR_HEAD//DOG_DATE_CONTROL"/>
        </layout:block>

        <layout:block>
            <layout:header>
                <layout:element type="text" value="Стоимость"/>
            </layout:header>
            <layout:item label="Сумма" value="//DOGOVOR_HEAD//DOG_SUM" afterValue="руб."/>
            <layout:item label="НДС" value="//DOGOVOR_HEAD//DOG_SUM_VAT" afterValue="руб."/>
            <layout:item label="Итого по договору" value="//DOGOVOR_HEAD//DOG_SUM_TOTAL" afterValue="руб."/>
            <layout:item label="Размер аванса" value="//DOGOVOR_HEAD//DOG_VALUE_PREPAYMENT_ID" afterValue="%"/>
        </layout:block>

        <layout:if test="//DOGOVOR_HEAD//DOG_DATE_PAUSED">
            <layout:block>
                <layout:header>
                    <layout:element type="text" value="Приостановка оказания услуг"/>
                </layout:header>
                <layout:item label="Дата приостановки" value="//DOGOVOR_HEAD//DOG_DATE_PAUSED"/>
                <layout:item label="Срок приостановки оказания услуг" value="//DOGOVOR_HEAD//DOG_DATE_RESUMED"/>
            </layout:block>
        </layout:if>

        <layout:if test="//DOGOVOR_HEAD//DOG_IS_CANCELED" operator="eq" value="1">
            <layout:block>
                <layout:header>
                    <layout:element type="text" value="Анулирование договора"/>
                </layout:header>
                <layout:item label="Договор аннулирован" value="//DOGOVOR_HEAD//DOG_IS_CANCELED"/>
                <layout:item label="Дата возврата средств" value="//DOGOVOR_HEAD//DOG_DATE_REVERSE"/>
                <layout:item label="Номер п/п по возврату" value="//DOGOVOR_HEAD//DOG_REVERSE_DOC_POINT"/>
                <layout:item label="Сумма возврата" value="//DOGOVOR_HEAD//DOG_REVERSE_SUM" afterValue="руб."/>
            </layout:block>
        </layout:if>


        <layout:block>
            <layout:header>
                <layout:element type="text" value="Стороны договора"/>
            </layout:header>
            <layout:table>
                <layout:header>
                    <layout:cell name="Роль организации"/>
                    <layout:cell name="Организация"/>
                    <layout:cell name="Представитель"/>
                </layout:header>
                <layout:body value="//CONTACT_MEMBERS//ROW">
                    <layout:cell>
                        <layout:element type="line" class="text-bold" value="CM_NSI_COMPANY_ROLE_TEXT"/>
                    </layout:cell>
                    <layout:cell>
                        <!-- Если физическое лицо -->
                        <layout:if test="CON_NSI_COMPANY_FORM" operator="eq" value="ФЛ">

                            <layout:element type="custom" tag="div" class="table-block">
                                <layout:item type="text" label="ФИО:" value="CON_FULL_NAME"/>
                                <layout:item type="text" label="ИНН:" value="CON_INN"/>
                                <layout:item type="text" label="СНИЛС:" value="PERS_SNILS_NUMBER"/>
                            </layout:element>

                            <layout:element type="custom" tag="div" class="table-block">
                                <layout:item type="text" label="Тип документа:" value="PERS_NSI_PERSON_DOCUMENT"/>
                                <layout:if test="PERSON_SERIAL" operator="!eq" value="">
                                  <layout:item label="Серия и номер:">
                                      <layout:element type="line" value="PERSON_SERIAL"/>
                                      <layout:element type="custom" tag="span"> </layout:element>
                                      <layout:element type="line" value="PERSON_NUMBER"/>
                                  </layout:item>
                                </layout:if>
                                <layout:item type="text" label="Когда выдан:" value="PERS_DOC_DATE"/>
                                <layout:item type="text" label="Кем выдан:" value="PERS_DOC_ORGAN"/>
                            </layout:element>
                        </layout:if>

                        <!-- Если юридическое лицо -->
                        <layout:if test="CON_NSI_COMPANY_FORM" operator="!eq" value="ФЛ">
                            <layout:element type="custom" tag="div" class="table-block">
                                <layout:link type="text" href="CON_FULL_NAME">
                                    <layout:element type="line" class="text-bold" value="CON_FULL_NAME"/>
                                </layout:link>
                                <br/>
                                <layout:item type="text" label="Юридический адрес:" value="CON_ADDRESS_LEGAL"/>
                                <layout:item type="text" label="Фактический адрес:" value="CON_ADDRESS_POST"/>
                            </layout:element>

                            <layout:element type="custom" tag="div" class="table-block">
                                <layout:item type="text" label="ИНН:" value="CON_INN"/>
                                <layout:item type="text" label="КПП:" value="CON_KPP"/>
                                <layout:item type="text" label="ОГРН:" value="CON_OGRN_NUMBER"/>
                                <layout:item type="text" label="ОКПО:" value="CON_OKPO"/>
                            </layout:element>
                        </layout:if>

                        <layout:element type="custom" tag="div" class="table-block">
                            <layout:item type="text" value="BANK_NAME" label="Отделение банка:"/>
                            <layout:item type="text" value="BANK_BIC" label="БИК:"/>
                            <layout:item type="text" value="BANK_ACCOUNT_SET" label="Расчётный счёт:"/>
                            <layout:item type="text" value="BANK_ACCOUNT_COR" label="Кор. счёт:"/>
                        </layout:element>

                        <layout:element type="custom" tag="div" class="table-block">
                            <layout:item type="text" value="CON_PHONE" label="Телефон, факс:"/>
                            <layout:item type="text" value="CON_EMAIL" label="Почта:"/>
                            <layout:item type="text" value="CON_ACCOUNT_SET" label="Расчётный счёт:"/>
                            <layout:item type="text" value="CON_ACCOUNT_COR" label="Кор. счёт:"/>
                        </layout:element>

                        <layout:if test="CM_IS_DOCUMENT_PASSED" operator="eq" value="1">
                            <layout:element type="text" class="text-bold" value="Проект документа отдан"/>
                        </layout:if>
                    </layout:cell>
                    <layout:cell>
                         <!-- Для физ лица ячейка пустая -->
                        <layout:if test="CON_NSI_COMPANY_FORM" operator="!eq" value="ФЛ">
                            <layout:element type="custom" tag="div" class="table-block">
                                <layout:item type="text" value="PERS_NAME" label="ФИО:"/>
                                <layout:item type="text" value="PERS_POST" label="Должность:"/>
                                <layout:item type="text" value="PERS_DOC_PROXY" label="Действует на основании:"/>
                            </layout:element>
                            <layout:element type="custom" tag="div" class="table-block">
                                <layout:item type="text" value="PERS_PHONE" label="Телефон, факс:"/>
                                <layout:item type="text" value="PERS_EMAIL" label="Почта:"/>
                            </layout:element>
                        </layout:if>
                    </layout:cell>
                </layout:body>
            </layout:table>
        </layout:block>

        <layout:block>
            <layout:header>
                <layout:element type="text" value="Утвержденный комплект файлов по договору"/>
            </layout:header>
            <layout:table>
                <layout:header>
                    <layout:cell name="Файл"/>
                </layout:header>
                <layout:body value="//SAMPLE_LIST//ROW">
                    <layout:cell>
                        <layout:element type="line" value="VALUE"/>
                    </layout:cell>
                </layout:body>
            </layout:table>
            <layout:item label="Примечание" value=""/>
        </layout:block>

        <layout:block>
            <layout:header>
                <layout:element type="text" value="Рабочие версии документов"/>
            </layout:header>

            <table class="tableCardStyle">
                <thead>
                    <tr>
                        <th>Вид документа</th>
                        <th>Статус</th>
                        <th>Комментарий</th>
                        <th>Файл</th>
                        <th>Подписание</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="//CONTRACT_DOCUMENT/ROW_SET/ROW">
                        <tr>
                            <td><span><xsl:value-of select="NSI_CONTRACT_DOCUMENT_TEXT"/></span></td>
                            <td><span><xsl:value-of select="NSI_DOCUMENT_STATUS_TEXT"/></span></td>
                            <td><span><xsl:value-of select="VALUE"/></span></td>
                            <td>
                                <xsl:variable name="fileId" select="FILE_ID"/>
                                <xsl:for-each select="//FILES_D/ROW_SET/ROW[FOLDER=$fileId]">
                                    <div><a href="/elib/getFile.action?contentType=application/octet-stream&amp;cardId={FILE_CARD_ID}"><xsl:value-of select="FILE_NAME"/></a></div>
                                </xsl:for-each>
                            </td>
                            <td>
                                <span><xsl:value-of select="SIGNATORY_NAME"/></span>
                                <span><xsl:value-of select="DATE_SIGNED"/></span>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>

            <!--layout:table>
                <layout:header>
                    <layout:cell name="Вид документа"/>
                    <layout:cell name="Статус"/>
                    <layout:cell name="Комментарий"/>
                    <layout:cell name="Файл"/>
                    <layout:cell name="Подписание"/>
                </layout:header>
                <layout:body value="//CONTRACT_DOCUMENT//ROW">
                    <layout:cell>
                        <layout:element type="line" value="NSI_CONTRACT_DOCUMENT_TEXT"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:element type="line" value="NSI_DOCUMENT_STATUS_TEXT"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:element type="line" value="VALUE"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:element type="line" value="VALUE"/>
                    </layout:cell>
                    <layout:cell>
                        <layout:element type="line" value="SIGNATORY_NAME"/>
                        <layout:element type="line" value="DATE_SIGNED"/>
                    </layout:cell>
                </layout:body>
            </layout:table-->
        </layout:block>

        <layout:line/>

        <table style="table-layout: fixed;font-size: 12px;">
            <tr>
                <td><div class="gray">Дата последнего изменения:</div><layout:element type="line" value="//SYS_LOG//DATA_CHANGED"/></td>
                <td><div class="gray">Изменения внес:</div><layout:element type="line" value="//SYS_LOG//USER_CHANGED"/></td>
                <td><div class="gray">Дата создания:</div><layout:element type="line" value="//SYS_LOG//DATE_CREATED"/></td>
                <td><div class="gray">Создал:</div><layout:element type="line" value="//SYS_LOG//USER_CREATED"/></td>
            </tr>
        </table>

    </xsl:variable>

    <!-- Шаблон описания элементов -->
    {B{CARD$HTML_TEMPLATE}E}

    <!-- **************************** Основной темплейт ******************************** -->
    <xsl:template match="/">
      <div class="cardWrapper">
        <xsl:call-template name="Context.setNamespace">
            <xsl:with-param name="namespacePrefix"></xsl:with-param>
            <xsl:with-param name="namespaceURI"></xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="data" select="/"/> <!-- Передаём XML данные в шаблоны -->
            <xsl:with-param name="layout" select="$LAYOUT"/> <!-- Передаём разметку -->
        </xsl:call-template>
      </div>
      {B{CARD$GALLERY_scripts}E}
    </xsl:template>

    {B{CARD$GALLERY_DOCUMENT}E}

</xsl:stylesheet>