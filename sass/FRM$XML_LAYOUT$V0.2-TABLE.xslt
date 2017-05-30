   <!-- таблица ********************************    
        <layout:table class="test">
          <layout:header>
            <layout:cell name="test1"/>
           ..............
          </layout:header>
          <layout:body value="//SAMPLE_LIST//ROW">            
             <layout:cell>
              <layout:edit type="TEXT" style="width:120px;" value="NAME"/>
            </layout:cell>
           ...............
          </layout:body>                     
        </layout:table>
  
    *******************************************-->
    <xsl:template match="layout:table" xmlns:layout="URN:html-form-layout:v0.1">
        <xsl:variable name="ROW" select="layout:body"/>
        <xsl:variable name="this" select="."/>
        <xsl:variable name="id">
            <xsl:choose>
                <xsl:when test="@id">
                    <xsl:value-of select="@id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('x_',ex2:newUid(),'_x')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        
        <!-- начало таблицы-->
        <!--div style="width:905px; margin:0 auto"-->
        <div style="width:100%; margin:0 auto">
          <!-- XML generation flags -->
          <xsl:call-template name="layoutXMLInfo">
            <xsl:with-param name="source" select="$this"/>
          </xsl:call-template>
        
          <div class="line wrapTable sectionContainer {$id} {@class}" style="{@style}"> 
            <!-- шапка -->
            <div class="theadAFT rowWrapTable">
              <xsl:for-each select="layout:header/layout:cell">
                <label class="headWrapTable cellWrapTable" style="{@style}"><xsl:value-of select="@name"/></label>
              </xsl:for-each>
              <!-- кнопка добавления секции -->
              <xsl:if test="$this/@add='1'">
                <span class="buttonsWrap cellWrapTable">
                  <div class="">
                    <span class="xf0_table_sectionBtnAddV sectionBtnAdd {$id}" section="{$id}"><span></span></span>
                  </div>                      
                </span>
        
          <xsl:comment>********************** SECTION:EMPTY HIDDEN BLOCK START*******************</xsl:comment>
          <!-- пустышка для добавления -->
          <div xfProcessChildren="0" style="display:none;">

            <div class="{$id} sectionTemplate">
            
              
                <!-- строка таблицы -->
                <div class="inputWrap rowWrapTable {$id} section">
                  
          <!-- XML generation flags -->
                  <xsl:call-template name="layoutXMLInfo">
                    <xsl:with-param name="source" select="$this/layout:body"/>
                  </xsl:call-template>
                    
                  <!-- ячейки таблицы -->     
                  <xsl:for-each select="$ROW/layout:cell">
                    <xsl:variable name="sectionLayout" select="*"/>
                    <span class="cellWrapTable {@class}" style="{@style}">                          
                      <xsl:call-template name="Context.execute">
                  
            <!-- с пустии данными -->
                        <xsl:with-param name="contextData"><NODATA/></xsl:with-param>
                        <xsl:with-param name="markup" select="*"/>
                      </xsl:call-template>                   
                    </span>
                  </xsl:for-each>
                           
                  <span class="buttonsWrap cellWrapTable">
                    <div class="addRemLine">
                      <span class="xf0_table_sectionBtnDeleteV sectionBtnDelete {$id} " section="{$id}"><span></span></span>
                    </div>                      
                  </span>  
                  <xsl:if test="$this/@move='1'">
                    <span class="buttonsWrap cellWrapTable">
                      <div class="moveRemLine">
                        <span class="top"><img src="/portal_static/img/upArrow.gif" style="height:15px"/></span>
                        <span class="bottom"><img src="/portal_static/img/downArrow.gif" style="height:15px"/></span>                        
                      </div>                      
                    </span>
                  </xsl:if>         
                </div>                      
            </div>

        
          </div>
          <xsl:comment>********************** SECTION:EMPTY HIDDEN BLOCK END*******************</xsl:comment>
        
              </xsl:if>                  
            </div> 
            
            <!-- строки с данными -->
            <xsl:comment>********************** SECTION:BLOCKS FILLED WITH DATA START*******************</xsl:comment>
              
              <xsl:for-each select="ctx:extract(layout:body/@value)">    
                <xsl:variable name="CELL_DATA" select="."/> 
                <div class="inputWrap rowWrapTable section {$id} " data-position="{position()}">     
                  <!-- XML generation flags -->
                  <xsl:call-template name="layoutXMLInfo">
                    <xsl:with-param name="source" select="$this/layout:body"/>
                  </xsl:call-template>
                  <!-- ячейки таблицы -->     
                  <xsl:for-each select="$ROW/layout:cell">  
                      <xsl:variable name="sectionLayout" select="*"/>
                      <span class="cellWrapTable {@class}" style="{@style}">                          
                        <xsl:call-template name="Context.execute">
                          <xsl:with-param name="contextData" select="$CELL_DATA"/>
                          <xsl:with-param name="markup" select="*"/>
                        </xsl:call-template>                   
                      </span>
                  </xsl:for-each>
                  <xsl:if test="$this/@add='1'">
                    <span class="buttonsWrap cellWrapTable">
                      <div class="addRemLine">
                        <span class="xf0_table_sectionBtnDeleteV sectionBtnDelete {$id}" section="{$id}"><span></span></span>
                      </div>                      
                    </span>
                  </xsl:if>                   
                  <xsl:if test="$this/@move='1'">
                    <span class="buttonsWrap cellWrapTable">
                      <div class="moveRemLine">
                        <span class="top"><img src="/portal_static/img/upArrow.gif" style="height:15px"/></span>
                        <span class="bottom"><img src="/portal_static/img/downArrow.gif" style="height:15px"/></span>                        
                      </div>                      
                    </span>
                  </xsl:if>         
                </div>
              </xsl:for-each> 

            
            <xsl:comment>********************** SECTION END *******************</xsl:comment>     
                 
            </div>
        </div>             
    </xsl:template>