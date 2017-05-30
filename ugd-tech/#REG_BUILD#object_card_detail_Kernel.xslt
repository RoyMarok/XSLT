<!-- Импорт стилей и скриптов (сделано для удобного изменения стилей без передиплоя портала) -->
{B{#COMMON#header_styles_RegBuild}E}
{B{#COMMON#object_styles}E}
{B{#COMMON#object_scripts}E}
{B{CARD$BODY_SCRIPT}E}

<xsl:variable name="obj_type" select="'RegBuild'"/>
<div class="content-block">
<table id="mainTableDoc">
    <tr>
        <td id="leftSection">       
            {B{#SP_OBJECT#main_object_card_invest}E}
            {B{#SP_OBJECT#main_object_card_rddocs}E}
            <xsl:if test="not(ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX) or ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX!='Д'">
                {B{#COMMON#object_card_info}E}
                {B{#COMMON#main_object_card_teps}E}
            </xsl:if>
            <xsl:if test="count(/ROOT/PAIDTITULA/ROW_SET/ROW) &gt; 0">
                {B{#SP_OBJECT#main_object_payment_state}E}
            </xsl:if>
            <xsl:if test="count(ROOT/OBJ_DOCS/ROW_SET/ROW[EMPTY_LINE ne '1']) &gt; 0">
                {B{#SP_OBJECT#main_object_card_docs}E}
            </xsl:if>
            
            <xsl:if test="not(ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX) or ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX!='Д'">
                {B{#REG_BUILD#object_card_ground}E}
            </xsl:if>
            {B{#SP_OBJECT#main_object_card_progs}E}
            <span id="regB_PrintBreak"></span>
            <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX and ROOT/OBJ_COPLEX_INFO/ROW_SET/ROW">
                <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX!='Д'">
                    {B{#COMMON#object_complex_info}E}
                </xsl:if>
            </xsl:if>
            <xsl:if test="not(ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX) or ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX!='Д'">
                {B{#SP_OBJECT#main_object_card_orgs}E}
            </xsl:if>
            
             <xsl:if test="ROOT/OBJ_MEET/ROW_SET/ROW">
                {B{#CARD_OBJ_REEST_STROY}E}
            </xsl:if>
            
        </td>

        <style>
            *:first-child+html #rightSection{padding-top:6px !important;}
        </style>
        
        <xsl:if test="ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX and ROOT/OBJ_INFO/ROW_SET/ROW/COMPLEX!='Д'">
            <td id="rightSection">

                <xsl:if test="/ROOT/OBJ_INFO/ROW_SET/ROW/GIS_ID">                        
                    <div id="mapImg" class="spObjMapWrap">
                        <!--script>generateFrame(tabInfo.documentId);</script-->
                        <script>generateFrame('<xsl:value-of select="/ROOT/OBJ_INFO/ROW_SET/ROW/GIS_ID"/>');</script>
                    </div>
                </xsl:if>

                                
                <!--UGDII-2130, Семенец, 20151021<xsl:if test="ROOT/PORTAL_PERMISSIONS/ROW_SET/ROW/NAME='video_obj_author' or ((ROOT/PORTAL_PERMISSIONS/ROW_SET/ROW/NAME='video_obj_approver' or ROOT/PORTAL_PERMISSIONS/ROW_SET/ROW/NAME='video_obj_agree' or ROOT/PORTAL_PERMISSIONS/ROW_SET/ROW/NAME='video_obj_executor') and count(/ROOT/OBJ_CAM_ZAYAV/ROW_SET/ROW/ZAYAV_ID)>0) or /ROOT/VIDEO_CAM_ID/ROW_SET/ROW/CAMSID">-->
                    <xsl:variable name="thisObjId" select="/ROOT/OBJ_INFO/ROW_SET/ROW/OBJECT_ID" />
                    
                    <div class="rightSectWrap" style="margin-top:10px" id="videoBlockRight">
                        
                        <xsl:if test="//OBJ_VIDEOMON//ROW != ''">
                          <div class="rightSectTitle">Видеомониторинг</div>
                        </xsl:if>
                        
                        
                        <!--Lashina 14/09/2015 UGDII-1799--> 
                        <xsl:for-each select="//OBJ_VIDEOMON//ROW">                      
                          <xsl:call-template name="video">  
                            <xsl:with-param name="type" select="CAM_VIDEO_FORMAT" />
                            <xsl:with-param name="number" select="position()"/>
                            <xsl:with-param name="id_address" select="IP_ADDRESS"/>
                            <xsl:with-param name="name" select="''"/>
                            <xsl:with-param name="width" select="'400'"/>
                            <xsl:with-param name="height" select="'300'"/>
                          </xsl:call-template>
                        </xsl:for-each>
                        
                        
                        
                        <xsl:for-each select="/ROOT/VIDEO_CAM_ID/ROW_SET/ROW">
                            <xsl:if test="SHOW='1'">
                                <xsl:element name="iframe" class="videoIframe" >                                            
                                    <xsl:attribute name="class">videoIframe</xsl:attribute>
                                    <xsl:attribute name="frameborder">no</xsl:attribute>
                                    <xsl:attribute name="style">width:362px;height:242px;border:0px solid #fff;margin:10px 0 5px </xsl:attribute>                                       
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="URL_V"/><xsl:value-of select="CAMSID"/>&#38;wCams=360&#38;hCams=236
                                    </xsl:attribute>                                            
                                </xsl:element>
                                <xsl:if test="SIGNATURE">
                                    <p><xsl:value-of select="SIGNATURE"/></p>                                        
                                </xsl:if>
                            </xsl:if>
                            
                            <xsl:if test="CAMSID!=''">
                                <p>
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">htmlcardbody.action?documentId=VJR:<xsl:value-of select="CAMSID"/>:<xsl:value-of select="$thisObjId"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>pageId=VIDEO_JURNAL$main</xsl:attribute> 
                                        <xsl:attribute name="onclick">openVideoJurnal('<xsl:value-of select="CAMSID"/>', '<xsl:value-of select="$thisObjId"/>');return false;</xsl:attribute>
                                        Видеожурнал строительства
                                    </xsl:element>
                                </p>
                            </xsl:if>     
                        </xsl:for-each>
                        
                        
                        <xsl:if test="/ROOT/VIDEO_CAM_ID_EL/ROW_SET/ROW/CAMSID!=''">
                            <xsl:for-each select="/ROOT/VIDEO_CAM_ID_EL/ROW_SET/ROW">
                                <p><xsl:value-of select="SIGNATURE"/></p>
                            
                                <p>
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">htmlcardbody.action?documentId=VJR:<xsl:value-of select="CAMSID"/>:<xsl:value-of select="OBJECT_ID"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>pageId=VIDEO_JURNAL$main</xsl:attribute> 
                                        <xsl:attribute name="onclick">openVideoJurnal('<xsl:value-of select="CAMSID"/>', '<xsl:value-of select="OBJECT_ID"/>');return false;</xsl:attribute>
                                        Видеожурнал строительства
                                    </xsl:element>
                                </p>
                                <br />
                            </xsl:for-each>                            
                        </xsl:if>     
                    </div>
                    
                <!--  UGDII-2130, Семенец, 20151021</xsl:if>-->

                <xsl:if test="/ROOT/OBJ_INFO/ROW_SET/ROW/D3">
                    <div class="rightSectWrap">
                        <xsl:element name="img">
                            <xsl:attribute name="id">object3D</xsl:attribute>
                            <xsl:attribute name="src">img/isio/3d_school.png</xsl:attribute>
                            <xsl:attribute name="alt">3D-модель объекта</xsl:attribute>
                            <xsl:attribute name="style">cursor:pointer</xsl:attribute>
                            <xsl:attribute name="onclick">
                            window.location.assign('htmlcard.action?documentId=OB2:<xsl:value-of select="/ROOT/OBJ_INFO/ROW_SET/ROW/D3"/>&amp;systemNick=object_card_3d&amp;menuId=card_menu_object_card_3d')
                            </xsl:attribute>                                    
                        </xsl:element>    
                    </div>
                </xsl:if>

                <xsl:if test="/ROOT/OBJ_PHOTO_GBU/ROW_SET/ROW/CARD_ID!=''">
                    <div class="rightSectWrap">
                        {B{#SP_OBJECT#main_object_card_photo_new}E}
                    </div>
                </xsl:if>

                <xsl:if test="/ROOT/PERMISSIONS/ROW_SET/ROW/PR_SHOW_PROJECT and /ROOT/OBJ_PRPIC/ROW_SET/ROW/CARD_ID != ''">
                    <div class="rightSectWrap">
                        {B{#SP_OBJECT#main_object_card_project}E}
                    </div>
                </xsl:if>

                <xsl:if test="/ROOT/PERMISSIONS/ROW_SET/ROW/PR_BUILD_PROCESS">
                    <xsl:if test="/ROOT/OBJ_HOD/ROW_SET/ROW/CDATE!='' or /ROOT/OBJ_HOD/ROW_SET/ROW/CONDITION!='' or /ROOT/OBJ_HOD/ROW_SET/ROW/CONSTR!='' or /ROOT/OBJ_HOD/ROW_SET/ROW/STAGE!='' or /ROOT/OBJ_HOD/ROW_SET/ROW/RC_VVOD_NAME!='' or /ROOT/OBJ_HOD/ROW_SET/ROW/HDATECONDITION!='' or /ROOT/OBJ_HOD/ROW_SET/ROW/MGSN_ARCHIVE!='' or /ROOT/OBJ_HOD/ROW_SET/ROW/MDATE!=''">
                        <div id="spObjBuildProc" class="rightSectWrap">
                            {B{#SP_OBJECT#object_card_build_prog}E}
                        </div>
                    </xsl:if>
                    <xsl:if test="/ROOT/SP_BUILD_PSD/ROW_SET/ROW/OBJECT_ID">
                        <div class="rightSectWrap">
                            {B{#SP_OBJECT#object_card_build_spp}E}
                        </div>
                    </xsl:if>
                </xsl:if>

   

                <xsl:if test="/ROOT/SMI/ROW_SET/ROW">
                        <div id="spObjSMI" class="rightSectWrap">
                            {B{#SP_OBJECT#object_card_smi}E}
                        </div>
                </xsl:if>
                        
                
                <div id="jsTestTemp" style="width:100%; height:20px;"></div>
            </td>
        </xsl:if>
    </tr>    
</table>
</div>