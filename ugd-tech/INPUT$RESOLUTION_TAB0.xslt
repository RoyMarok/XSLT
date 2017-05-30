<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:doc="http://xmlns.oracle.com/MSG_I3_2">

    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    <xsl:variable name="LAYOUT">  
    
      <layout:block>

        <layout:header>Подготовка документа</layout:header> 
        
        <layout:item label="Номер заявления" value="//doc:EvZayavNum"/>
        
        <layout:item label="Дата регистрации заявления" value="//doc:EvZayavDate" format="date"/>
        
        <layout:item format="date" label="Единый номер обращения" value="//doc:ServiceNumberPGU"/>        
        
        <xsl:if test="//doc:numberPGU != ''">
        <layout:item label="Заявление ПГУ">
          <layout:element type="line" value="//doc:numberPGU"></layout:element>
          <layout:element format="date" value="//doc:regDatePGU"> от </layout:element>
        </layout:item>
        </xsl:if>         
        
        <layout:item label="Дата выдачи документа заявителю" value="//doc:EvAllowGivenDate" format="date"/>            
        

      </layout:block>
        
        
      <!-- Сведения о проекте, подлежащем экспертизе -->
      <layout:block>
      
        <layout:header>Описание объекта</layout:header> 
        
        <xsl:if test="//doc:EvObjVvod != ''">
        <div class="cat">
           <div class="key">
             <span>Сведения о сдаче объекта</span>
           </div>
           <div class="value">
              <xsl:choose>
                <xsl:when test="//doc:EvObjVvod = 1 and //doc:EvAllowRegNum != ''">
                  <xsl:text>Объект сдан полностью</xsl:text>
                </xsl:when>
                <xsl:when test="(//doc:EvObjVvod = 1 or //doc:EvObjVvod = '') and //doc:EvAllowRegNum != ''">
                  <xsl:text>Объект сдан частично</xsl:text>
                </xsl:when>
                <xsl:otherwise> </xsl:otherwise>
              </xsl:choose>
           </div>
        </div>
        </xsl:if>

        <layout:item label="Функциональное назначение объекта" value="//doc:ObjFuncObj"/>
        
        <xsl:if test="//doc:EvLetterNum != ''">
         <div class="cat">
           <div class="key">
             <span>Письмо об отказе</span>
           </div>
           <div class="value">
              <xsl:value-of select="//doc:EvLetterNum"/>
              <xsl:if test="//doc:EvLetterDate != ''">
                <xsl:text> от </xsl:text>
                <xsl:call-template name="date_transform">
                  <xsl:with-param name="old_date" select="//doc:EvLetterDate"/>
                </xsl:call-template>
              </xsl:if>
            </div>
          </div>
         </xsl:if>
        
        <xsl:if test="count(//FNO_306/ROW_SET/ROW) &gt; 0">
            <div class="cat">
               <div class="key">
                 <span>Функциональное назначение объекта (306-ПП)</span>
               </div>
               <div class="value nested-list">
                  <ul>    
                      <xsl:apply-templates select="//FNO_306/ROW_SET/ROW[IS_LEAF = 0]"/>
                  </ul>
               </div>
            </div>
		</xsl:if>
        
        <layout:item label="Вид строительства" value="//doc:ObjWorkType"/>  
        
        <layout:item label="Серия проекта" value="//doc:ObjProjectSer"/>  
        
        <layout:item label="Источник финансирования" value="//doc:EvIstFin"/>  
        
        <layout:item type="text" label="Застройщик (арендатор)">

          <xsl:for-each select="//doc:Org[doc:OrgRole = 'застройщик' or doc:OrgRole = 'Застройщик']">     
                 
            <xsl:variable name="short" select="doc:OrgFormShort"/>
            <xsl:variable name="name">
              <xsl:choose>
                <xsl:when test="doc:OrgNameFull != ''">
                  <xsl:value-of select="doc:OrgNameFull"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="doc:OrgName"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:variable name="url" select="doc:EvOrgURL"></xsl:variable>
            <xsl:choose>
              <xsl:when test="$url != ''">
                  <layout:link href="{$url}" type="text">      
                    <layout:text type="text" value="{$short}"> "</layout:text>
                    <layout:text type="text" value="{$name}">"</layout:text>
                </layout:link>
              </xsl:when>
              <xsl:otherwise>
                <layout:text type="text" value="{$short}"> "</layout:text>
                <layout:text type="text" value="{$name}">"</layout:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
          
        </layout:item>
        

      </layout:block>
      
      
      
      <!-- Общие показатели вводимого в эксплуатацию объекта   -->
       <layout:block>
      
        <layout:header>Общие показатели вводимого в эксплуатацию объекта</layout:header> 
        
        <layout:table class="test" style="width:100%;">
          <layout:header>
            <layout:cell name=""/>
            <layout:cell name="По проекту"/>
            <layout:cell name="Фактически"/>           
          </layout:header>
          <layout:body value="//doc:PowerCommon">            
            <layout:cell>
              <layout:element value="doc:PowerName"/>
            </layout:cell>
            <layout:cell>
              <layout:element value="doc:PowerValuePlan"/>
            </layout:cell>
            <layout:cell>
              <layout:element value="doc:PowerValueFact"/>
            </layout:cell>          
          </layout:body>                     
        </layout:table>  

        
      </layout:block>
      
      <!-- Объекты непроизводственного назначения -->
      <xsl:if test="count(//doc:PowerNoIndustrial) &gt; 0">
        <layout:block>
          <layout:header>Объекты непроизводственного назначения</layout:header>
          
          <table class="tableCardStyle test" style="width:100%;">
            <thead>
              <tr>
                <th></th>
                <th>По проекту</th>
                <th>Фактически</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="//doc:PowerNoIndustrial">
                <tr>
                  <td>
                    <xsl:value-of select="doc:PowerName"/>
                    <!--<xsl:if test="doc:PowerUnit !=''">
                      <xsl:text> (</xsl:text>
                      <xsl:value-of select="doc:PowerUnit"/>
                      <xsl:text>)</xsl:text>
                    </xsl:if> -->
                  </td>
                  <td>
                    <xsl:value-of select="doc:PowerValuePlan"/>
                    <xsl:if test="doc:PowerCommentPlan !=''">
                      <![CDATA[<br/>]]>
                      <xsl:value-of select="doc:PowerCommentPlan"/>
                    </xsl:if>
                  </td>
                  <td>
                    <xsl:value-of select="doc:PowerValueFact"/>
                    <xsl:if test="doc:PowerCommentFact !=''">
                      <![CDATA[<br/>]]>
                      <xsl:value-of select="doc:PowerCommentFact"/>
                    </xsl:if>
                  </td>
                </tr>                
              </xsl:for-each>
            </tbody>
          </table>

        </layout:block>
      </xsl:if>
      
      <!-- Объекты производственного назначения -->
      <xsl:if test="count(//doc:PowerIndustrial) &gt; 0">
        <layout:block>
          <layout:header>Объекты производственного назначения</layout:header>
          
          <table class="tableCardStyle test" style="width:100%;">
            <thead>
              <tr>
                <th></th>
                <th>По проекту</th>
                <th>Фактически</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="//doc:PowerIndustrial">
                <tr>
                  <td>
                    <xsl:value-of select="doc:PowerName"/>
                    <!--<xsl:if test="doc:PowerUnit !=''">
                      <xsl:text> (</xsl:text>
                      <xsl:value-of select="doc:PowerUnit"/>
                      <xsl:text>)</xsl:text>
                    </xsl:if>-->
                  </td>
                  <td>
                    <xsl:value-of select="doc:PowerValuePlan"/>
                    <xsl:if test="doc:PowerCommentPlan !=''">
                      <![CDATA[<br/>]]>
                      <xsl:value-of select="doc:PowerCommentPlan"/>
                    </xsl:if>
                  </td>
                  <td>
                    <xsl:value-of select="doc:PowerValueFact"/>
                    <xsl:if test="doc:PowerCommentFact !=''">
                      <![CDATA[<br/>]]>
                      <xsl:value-of select="doc:PowerCommentFact"/>
                    </xsl:if>
                  </td>
                </tr>                
              </xsl:for-each>
            </tbody>
          </table>

        </layout:block>
      </xsl:if>
      
      <!-- Объекты жилищного строительства   -->
      <xsl:if test="count(//doc:PowerHouse) &gt; 0">
        <layout:block>
        
          <layout:header>Объекты жилищного строительства</layout:header> 
          
          <layout:table class="test" style="width:100%;">
            <layout:header>
              <layout:cell name=""/>
              <layout:cell name="По проекту"/>
              <layout:cell name="Фактически"/>           
            </layout:header>
            <layout:body value="//doc:PowerHouse">            
              <layout:cell type="break">
                <layout:element type="break" value="doc:PowerName"/>
              </layout:cell>
              <layout:cell type="break">
                <layout:element type="break" value="doc:PowerValuePlan"/>
              </layout:cell>
              <layout:cell type="break">
                <layout:element type="break" value="doc:PowerValueFact"/>
              </layout:cell>          
            </layout:body>                     
          </layout:table>  
          
          
        </layout:block>
      </xsl:if>
      
      <!-- Стоимость строительства -->
      <xsl:if test="count(//doc:PowerCost) &gt; 0">
        <layout:block>
          <layout:header>Стоимость строительства</layout:header>
          
          <table class="tableCardStyle test" style="width:100%;">
            <thead>
              <tr>
                <th></th>
                <th>По проекту</th>
                <th>Фактически</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="//doc:PowerCost">
                <tr>
                  <td>
                    <xsl:value-of select="doc:PowerName"/>
                    <!-- <xsl:if test="doc:PowerUnit !=''">
                      <xsl:text> (</xsl:text>
                      <xsl:value-of select="doc:PowerUnit"/>
                      <xsl:text>)</xsl:text>
                    </xsl:if> -->
                  </td>
                  <td>
                    <xsl:value-of select="doc:PowerValuePlan"/>
                    <xsl:if test="doc:PowerCommentPlan !=''">
                      <![CDATA[<br/>]]>
                      <xsl:value-of select="doc:PowerCommentPlan"/>
                    </xsl:if>
                  </td>
                  <td>
                    <xsl:value-of select="doc:PowerValueFact"/>
                    <xsl:if test="doc:PowerCommentFact !=''">
                      <![CDATA[<br/>]]>
                      <xsl:value-of select="doc:PowerCommentFact"/>
                    </xsl:if>
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
        pre.normalPre {
          font-family: inherit;
          font-size: inherit;
          margin: inherit;
        }
      </style>
        <xsl:call-template name="Context.setNamespace">
            <xsl:with-param name="namespacePrefix">doc</xsl:with-param>
            <xsl:with-param name="namespaceURI">http://xmlns.oracle.com/MSG_I3_2</xsl:with-param>
        </xsl:call-template>        
         

        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="data" select="/"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template>

    </xsl:template>

    <!-- Шаблон описания элементов для формы -->
    {B{CARD$HTML_TEMPLATE}E}
  
    <xsl:template match="//FNO_306/ROW_SET/ROW">
        <xsl:variable name="parent" select="//FNO_306/ROW_SET/ROW[ID_PARENT=current()/ID]"/>
        <li data-leaf="{IS_LEAF}">
    <span>
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