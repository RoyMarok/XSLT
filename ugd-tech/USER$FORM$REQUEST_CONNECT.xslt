<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext">

    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    <xsl:variable name="LAYOUT">
       
        <layout:form xmlTag1="AccForm" actionId="ACC_REQ$SAVE_NEW_REQ">
            <layout:header xmlns:layout="URN:html-form-layout:v0.1">
                Заявление на подключение пользователя
            </layout:header>
      
            <h2 class="header">Пользователь</h2> 

            <layout:simple-field label="ФИО" class="medium" required="1">
                <layout:edit type="TEXT" name="FIO" value="FIO" xmlTag1="AccFormFio"/>
            </layout:simple-field>   
			
			<layout:simple-field label="Логин" class="medium" required="1">
                <layout:edit type="TEXT" name="USER_LOGIN" value="USER_LOGIN" xmlTag1="AccFormLogin"/>
            </layout:simple-field>
			
			<layout:simple-field label="Должность" class="medium" required="1">
                <layout:edit type="TEXT" name="ORG_POSITION" value="ORG_POSITION"/>
            </layout:simple-field>
            

            <layout:simple-field label="Организация" class="full" required="1">
                <layout:multiselect name="USER_DEP_ID" value="//ORG_BY_DEFAULT//ID" limit="1" listSourceID="OIV_INFO_LST"/>
            </layout:simple-field>
           
			<layout:simple-field label="Телефон" class="medium" required="1">
	            <layout:edit type="TEXT" name="PHONE_NUM" value="PHONE_NUM"/>
	            <label style="width:70px;text-align: right;">Доб.</label>
	            <layout:edit type="TEXT" name="PHONE_ADD" style="width:160px;" value="PHONE_ADD"/>
	        </layout:simple-field>

            <layout:simple-field label="E-mail" class="medium" required="0">
                <layout:edit type="EMAIL" name="EMAIL" value="EMAIL"/>
            </layout:simple-field>
			
			<layout:simple-field label="Адрес для проведения обучения" class="full" required="0">
                <layout:edit type="MULTILINE" name="ADDRESS_FACT" value="ADDRESS_FACT"/>
            </layout:simple-field>

			<layout:simple-field label="Ответственное лицо от ОИВ" class="full" required="1">
                <layout:multiselect name="RESPONSIBLE_ID" xmlTag1="CURRENT_USER" value="//CURRENT_USER//FK_ID" limit="1" listSourceID="PERSONS_FROM_ORGANIZATIONS"/>
            </layout:simple-field>
             
			<layout:line/>
      
            <h2 class="header">Перечень информационных ресурсов</h2> 

    		<xsl:for-each select="//RESOURCE_LIST//ROW/RESOURCE_LIST/RESOURCE_LIST">

                <layout:subheader><xsl:value-of select="NAME"/></layout:subheader>

                <xsl:for-each select="RESOURCE">
                  <div xmlTag1="AccElement">

                    <xsl:variable name="CURRENT_RESOURCE_NICK" select="NICK"/>

                    <div class="line medium checkBox resource-checkbox" style="padding: 0;">
                        <span style="position: relative;">

                            <input id="{ID}" name="{$CURRENT_RESOURCE_NICK}" type="checkbox" style="margin-top: 16px;" xmlTag1="AccElementSelected">
                                <xsl:if test="ISCHECKED = 'true'">
                                    <xsl:attribute name="checked">1</xsl:attribute>
                                </xsl:if>
                            </input>

                            <input type="hidden" name="{$CURRENT_RESOURCE_NICK}-FL_NEEDED" xmlTag1="AccElementId">
                                <xsl:choose>
                                    <xsl:when test="ISCHECKED = 'true'">
                                        <xsl:attribute name="value">true</xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="value">false</xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </input>

                        </span>
                        <label for="{ID}" style="display: inline-block; margin-top: 5px;">
                            <xsl:value-of select="NAME_VIEW"/>
                        </label>
                    </div>
               
                
                    <div>

                        <xsl:if test="ISCHECKED != 'true'">
                            <xsl:attribute name="class">hidden</xsl:attribute>
                        </xsl:if>


                        <div class="line medium checkbox access-checkbox">
                            <xsl:if test="CNT = 1">
                                <xsl:attribute name="class">hidden</xsl:attribute>
                            </xsl:if>
                            <span class="inputName ">Доступ</span>
                            <span class="inputWrap">
                                <xsl:for-each select="ACCESS">

                                    <label>
                                        <span class="overTrop"></span>
                                        <input type="checkbox" value="{NICK}" name="{$CURRENT_RESOURCE_NICK}-ACCESS_LEVEL" class="masked" xmlTag1="AccElementAccess">
                                            <xsl:if test="ISCHECKED = 'true'">
                                                <xsl:attribute name="checked">1</xsl:attribute>
                                            </xsl:if>
                                        </input>
                                        <xsl:value-of select="NAME"/>
                                    </label>

                                    <span class="clearBlock"></span>

                                </xsl:for-each>

                                <input type="hidden" name="{$CURRENT_RESOURCE_NICK}-LEVEL_NEEDED">

                                    <xsl:choose>
                                        <xsl:when test="ISCHECKED = 'true'">
                                            <xsl:attribute name="value">true</xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="value">false</xsl:attribute>
                                        </xsl:otherwise>
                                    </xsl:choose>

                                </input>

                            </span>
                        </div>
                            

                        <xsl:if test="ACCEPT = 'true'">
                            <div class="line medium">
                                <label class="inputName">Основание</label>
                                <span class="inputWrap">
                                    <select name="{$CURRENT_RESOURCE_NICK}-TYPE_BASIS" style="width: 200px;">
                                    <xsl:for-each select="//ACC_BASIS/ROW_SET/ROW">
                                        <option value="{NICK}">
                                            <xsl:value-of select="NAME"/>
                                        </option>
                                    </xsl:for-each>
                                    </select>
                                    <label>Номер</label>
                                    <input style="width: 118px;" type="text" name="{$CURRENT_RESOURCE_NICK}-DOC_NUMBER"/>
                                    <label>От</label>
                                    <input class="date" style="width: 100px;" type="text" name="{$CURRENT_RESOURCE_NICK}-DOC_DATE"/>
                                </span>
                            </div>
                            <div class="line full">
                                <label class="inputName"></label>
                                <span class="inputWrap">
                                    <input type="text" name="{$CURRENT_RESOURCE_NICK}-DOC_NAME"/>
                                </span>
                            </div>
                        </xsl:if>
                    </div>
                  </div>
                </xsl:for-each>
  
            </xsl:for-each>
            
            <layout:line/>

            <layout:edit type="RESET" value="Отмена" style="width: 121px;margin-left: 0;display: none;"/>
            
            <layout:edit type="SUBMIT" value="Сохранить"/>
            

            <layout:clear/> 


        </layout:form>

    </xsl:variable>

    <!-- **************************** Основной темплейт ******************************** -->
    <xsl:template match="/">
        <xml style="display: none">
            <xsl:copy-of select="*"/>
        </xml> 

        <xsl:call-template name="Context.setNamespace">
            <xsl:with-param name="namespacePrefix">doc</xsl:with-param>
            <xsl:with-param name="namespaceURI">http://xmlns.oracle.com/GZK_R_Res</xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="Context.setNamespace">
            <xsl:with-param name="namespacePrefix">cfm</xsl:with-param>
            <xsl:with-param name="namespaceURI">http://xmlns.oracle.com/COMMON_FORM</xsl:with-param>
        </xsl:call-template>
        
         <xsl:call-template name="Context.setNamespace">
            <xsl:with-param name="namespacePrefix">gbu</xsl:with-param>
            <xsl:with-param name="namespaceURI">http://xmlns.oracle.com/COMMON_FORM</xsl:with-param>
        </xsl:call-template>

        <xsl:call-template name="pageBuilder">
            <xsl:with-param name="data" select="/"/>
            <xsl:with-param name="layout" select="$LAYOUT"/>
        </xsl:call-template>
        <style>
            a[target="pageEditor"] {
                display: none;
            }
        </style>
        <script src="/static/JQueryPlugins/jquery.maskedinput-1.2.2.js"></script>
        <script>
            function dateMask(){
                $.mask.definitions['m'] = "[0-1]";
                $.mask.definitions['d'] = "[0-3]";
                $('input.date').mask("d9.m9.9999");
            }
            
            $('input[name="PHONE_NUM"]').mask('+7 (999) 999-99-99');

            $(function(){

                $('.resource-checkbox').find('input[type="checkbox"]').on('change', function() {

                    var $this = $(this),
                        resourceNick = $(this).attr('name'),
                        $target = $this.closest('.resource-checkbox').next('div'),
                        $resourceNeeded = $('input[name="' + resourceNick + '-FL_NEEDED"]'),
                        $resourceAccessNeeded = $('input[name="' + resourceNick + '-LEVEL_NEEDED"]'),
                        $accessLevels = $target.find('input[type="checkbox"]'),
                        $ACC_READ = $target.find('input[value="ACC_READ"]');


                    if (this.checked) {
                        $target.removeClass('hidden');
                        $resourceNeeded.val('true');
                        $resourceAccessNeeded.val('true');
                        $ACC_READ.attr('checked', true).change();
                    }
                    else {
                        $target.addClass('hidden');
                        $resourceNeeded.val('false');
                        $resourceAccessNeeded.val('false');
                        $ACC_READ.prop('checked', false).change();
                    }

                    $accessLevels.on('change', function() {
                        var checkedLength = $(this).closest('.access-checkbox').find('input[type="checkbox"]:checked').length;
                        (checkedLength === 0) 
                            ? $resourceAccessNeeded.val('false') 
                            : $resourceAccessNeeded.val('true');
                    });
                });

                dateMask();
            });
        </script>
    </xsl:template>

    <!-- Шаблон описания элементов для формы -->
    {B{FORM$TEMPLATE--}E}
    {B{FRM$XML_LAYOUT$V0}E}
    

</xsl:stylesheet>