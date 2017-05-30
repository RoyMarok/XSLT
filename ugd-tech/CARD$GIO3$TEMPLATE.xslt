
 {B{CARD$TEMPLATE}E}
 
<xsl:template name="makeSection">
    <xsl:param name="id"/>
    <xsl:param name="name"/>
    <xsl:param name="visible"/>
    <xsl:param name="htmlclass"/>
    <xsl:param name="ftnick"/>
    <xsl:param name="currentGroup"/>



    <xsl:if test="$visible != 'FALSE' and $name != ''">
        <xsl:if test="count(/ROOT/CARD_FIELD/ROW_SET/ROW[SECTION_ID=$id and VISIBLE != 'FALSE']/VIEW_VALUE)!=0 or $ftnick = 'HTML_CLOB' ">
            <p class="sectionTitle">
                <span><xsl:value-of select="$name" disable-output-escaping="yes" /></span>
            </p>
        </xsl:if>
    </xsl:if>
    
    
    <!-- Таблица начало -->
    <xsl:if test="$visible!= 'FALSE'">
        <xsl:choose>
            <!-- -->
            <xsl:when test="$ftnick='HTML_CLOB'">
                <div> <xsl:value-of select="CLOB_VALUE" disable-output-escaping="yes" /></div>
            </xsl:when> 
                 
            <xsl:when test="$ftnick='TABLE'">
                <xsl:if  test="/ROOT/CARD_FIELD/ROW_SET/ROW[SECTION_ID=$id]/VIEW_VALUE">
                    <xsl:element name="table">
                        <xsl:attribute name="style">width:auto;</xsl:attribute>
                        <xsl:attribute name="class">
                            <!-- SURT STYLE HARDCODE START -->
                            <xsl:choose>
                                <xsl:when test="$ftnick='TABLE'">tableCardStyle </xsl:when>
                                <xsl:otherwise>sectionBlockAF</xsl:otherwise>
                            </xsl:choose>
                            <!-- SURT STYLE HARDCODE END -->
                            <xsl:value-of select="$htmlclass"/>
                        </xsl:attribute>
                        <xsl:for-each-group select="/ROOT/CARD_FIELD/ROW_SET/ROW[SECTION_ID=$id and VISIBLE!='FALSE']" group-by="RECORD_ID">
                            <xsl:sort select="count(current-group())" order="descending"/>
                            <xsl:if test="position()=1">
                                <tr>
                                    <xsl:for-each select="current-group()">
                                        <xsl:sort select="FIELD_COL"/>
                                        <xsl:if test="VISIBLE != 'FALSE'">
                                            <th style="{WIDTH}"><xsl:value-of select="NAME" disable-output-escaping="yes"/></th>
                                        </xsl:if>
                                    </xsl:for-each>
                                </tr>
                                <xsl:variable name="head_record" select="current-group()/RECORD_ID" />
                                <xsl:for-each-group select="/ROOT/CARD_FIELD/ROW_SET/ROW[SECTION_ID=$id and VISIBLE !='FALSE']"
                                                    group-by="RECORD_ID">
                                    <xsl:sort select="VALUE_ORDER"/>
                                    <tr>
                                        <xsl:attribute name="rec"><xsl:value-of select="current-group()/RECORD_ID"/></xsl:attribute>
                                        <xsl:for-each select="/ROOT/CARD_FIELD/ROW_SET/ROW[SECTION_ID=$id and RECORD_ID = $head_record and VISIBLE != 'FALSE']">
                                            <xsl:sort select="FIELD_COL"/>
                                            <xsl:variable name="ffcol" select="FIELD_COL"/>
                                            <xsl:choose>
                                                <xsl:when test="(count(current-group()[FIELD_COL = $ffcol]) = 0) or (0 = string-length(current-group()[FIELD_COL = $ffcol]/VIEW_VALUE) )">
                                                    <td>
                                                    </td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:if test="current-group()[FIELD_COL = $ffcol]/VISIBLE != 'FALSE'">
                                                        <xsl:variable name="trPosition" select="current-group()[FIELD_COL = $ffcol]/RECORD_ID" />
                                                        <xsl:variable name="parent_id" select="current-group()[FIELD_COL = $ffcol]/PARENT_ID" />
                                                        <xsl:choose>
                                                            <xsl:when test="MASK != ''">
                                                                <td>
                                                                    <xsl:attribute name="record"><xsl:value-of select="current-group()[FIELD_COL = $ffcol]/RECORD_ID"/></xsl:attribute>
                                                                    <xsl:attribute name="data-unmasked"><xsl:value-of select="current-group()[FIELD_COL = $ffcol]/VIEW_VALUE" disable-output-escaping="yes" /></xsl:attribute>
                                                                    <xsl:attribute name="id">table_<xsl:value-of select="current-group()[FIELD_COL = $ffcol]/SECTION_ID" />_<xsl:value-of select="$trPosition" />_<xsl:value-of select="current-group()[FIELD_COL = $ffcol]/FIELD_COL" /></xsl:attribute>
                                                                    <xsl:value-of select="current-group()[FIELD_COL = $ffcol]/VIEW_VALUE" disable-output-escaping="yes" />
                                                                    <script type="text/javascript">
                                                                        try {
                                                                        var val = accounting.formatMoney('<xsl:value-of select="current-group()[FIELD_COL = $ffcol]/VIEW_VALUE" disable-output-escaping="yes" />'.replace(/,/,'.' ), <xsl:value-of select="current-group()[FIELD_COL = $ffcol]/MASK" disable-output-escaping="yes"/>);
                                                                        $('#table_<xsl:value-of select="current-group()[FIELD_COL = $ffcol]/SECTION_ID" />_<xsl:value-of select="$trPosition" />_<xsl:value-of select="current-group()[FIELD_COL = $ffcol]/FIELD_COL" />').text(val);
                                                                        } catch(e){
                                                                        throw new Error('Неправильный формат маски для поля <xsl:value-of select="current-group()[FIELD_COL = $ffcol]/NAME"/>');
                                                                        }
                                                                    </script>
                                                                </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:choose>
                                                                    <xsl:when test="current-group()[FIELD_COL = $ffcol]/FT_NICK = 'FILE'">
                                                                        <xsl:if test="current-group()[FIELD_COL = $ffcol]/VIEW_VALUE != ''">
                                                                            <td style="width:250px;">
                                                                                <xsl:attribute name="record"><xsl:value-of select="current-group()[FIELD_COL = $ffcol]/RECORD_ID"/></xsl:attribute>
                                                                                <div>
                                                                                    <xsl:variable select="current-group()[FIELD_COL = $ffcol]/VIEW_VALUE" name="str"/>
                                                                                                                                                                     
                                                                                    <!-- Lashina 09.11.2015 GGE-186-->                                                                                    
                                                                                    <xsl:call-template name="file_parse">
                                                                                        <xsl:with-param name="s" select="$str"/>
                                                                                        <!--xsl:with-param name="cardId" select="current-group()[FIELD_COL = $ffcol]/RAW_VALUE"/>
                                                                                        <xsl:with-param name="fkID" select="current-group()[FIELD_COL = $ffcol]/RAW_VALUE"/-->                                                                                       
                                                                                    </xsl:call-template>
                                                                                </div>
                                                                            </td>
                                                                        </xsl:if>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <td>
                                                                            <div style="display: none;"><xsl:copy-of select="current-group()[FIELD_COL = $ffcol]" /></div>
                                                                            <xsl:choose>
                                                                              <xsl:when test="current-group()[FIELD_COL = $ffcol]/FT_NICK = 'CHECKBOX'">
                                                                                <xsl:choose>
                                                                                  <xsl:when test="current-group()[FIELD_COL = $ffcol]/VIEW_VALUE = 'true'"><input type='checkbox' checked='true' class='staticCheckBox'/></xsl:when>
                                                                                  <xsl:otherwise><input type='checkbox' class='staticCheckBox'/></xsl:otherwise>
                                                                                </xsl:choose>
                                                                              </xsl:when>
                                                                              <xsl:otherwise><xsl:value-of select="current-group()[FIELD_COL = $ffcol]/VIEW_VALUE" disable-output-escaping="yes" /></xsl:otherwise>
                                                                            </xsl:choose>
                                                                            
                                                                            <!--<xsl:value-of select="string-length(current-group()[FIELD_COL = $ffcol]/VIEW_VALUE" />-->
                                                                        </td>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:if>
                                                </xsl:otherwise>-->
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </tr>
                                </xsl:for-each-group>
                            </xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$id = ''">
                <xsl:for-each select="/ROOT/CARD_FIELD/ROW_SET/ROW[count(SECTION_ID)=0][FT_IS_SECTION!='TRUE']">
                    <xsl:sort select="FIELD_ORDER"/>
                    <xsl:if test="NAME != ''">
                        <xsl:if test="SECTION != 'GROUP_CONTRACT_HEADER' and SECTION!= 'HEADER_GROUP'">
                            <xsl:if test="VISIBLE_EMPTY = 'TRUE' or CLOB_VALUE!='' or VIEW_VALUE!=''">
                                <div class="cat">
                                
                                    <xsl:if test="VISIBLE='FALSE'">
                                        <xsl:attribute name="style">display: none</xsl:attribute>
                                    </xsl:if>
                                    
                                    <xsl:if test="FT_NICK != 'HTML_CLOB'">
                                        <div class="key"><span><xsl:value-of select="NAME"/></span></div>
                                    </xsl:if>
                                    
                                    <div class="value"><!--pre-->
                                        <xsl:if test="MASK!=''">
                                            <xsl:attribute name="data-unmasked"><xsl:value-of select="VIEW_VALUE" disable-output-escaping="yes"/></xsl:attribute>
                                        </xsl:if>
                                        <xsl:attribute name="id"><xsl:value-of select="SECTION_ID" />_<xsl:value-of select="position()" /></xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="BDT_NICK='CLOB'">
                                                <xsl:choose>
                                                    <xsl:when test="FT_NICK = 'CHECKBOX' and CLOB_VALUE = 'true'">
                                                        <input type='checkbox' checked='true' class='staticCheckBox'/>
                                                    </xsl:when>
                                                    <xsl:when test="FT_NICK = 'CHECKBOX' and CLOB_VALUE = 'false'">
                                                        <input type='checkbox' class='staticCheckBox'/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:choose>
                                                        <xsl:when test="FT_NICK = 'TEXTAREA'">                                                         
                                                            <!--pre>
                                                              <xsl:value-of select="CLOB_VALUE" disable-output-escaping="yes"/>
                                                            </pre-->  
                                                            <xsl:call-template name="nl2br">
                                                              <xsl:with-param name="s" select="CLOB_VALUE"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                          <xsl:value-of select="CLOB_VALUE" disable-output-escaping="yes"/>
                                                        </xsl:otherwise>
                                                      </xsl:choose>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                    <xsl:when test="FT_NICK = 'CHECKBOX' and VIEW_VALUE = 'true'">
                                                        <input type='checkbox' checked='true' class='staticCheckBox'/>
                                                    </xsl:when>
                                                    <xsl:when test="FT_NICK = 'CHECKBOX' and VIEW_VALUE = 'false'">
                                                        <input type='checkbox' class='staticCheckBox'/>
                                                    </xsl:when>
                                                    <xsl:when test="count(MASK) &gt; 0">
                                                        <script type="text/javascript">
                                                            try {
                                                            var val = accounting.formatMoney('<xsl:value-of select="VIEW_VALUE" disable-output-escaping="yes"/>'.replace(/,/,'.' ), <xsl:value-of select="MASK" disable-output-escaping="yes"/>);
                                                            $('#<xsl:value-of select="SECTION_ID" />_<xsl:value-of select="position()" />').text(val);
                                                            } catch(e){
                                                            throw new Error('Неправильный формат маски для поля <xsl:value-of select="NAME"/>');
                                                            }
                                                        </script>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                      <xsl:choose>
                                                        <xsl:when test="FT_NICK = 'TEXTAREA'">                                                            
                                                            <!--pre>
                                                              <xsl:value-of select="VIEW_VALUE" disable-output-escaping="yes"/>
                                                            </pre-->  
                                                            <xsl:call-template name="nl2br">
                                                              <xsl:with-param name="s" select="VIEW_VALUE"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                          <xsl:value-of select="VIEW_VALUE" disable-output-escaping="yes"/>
                                                        </xsl:otherwise>
                                                      </xsl:choose>  
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    <!--/pre--></div>
                                </div>
                            </xsl:if>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="/ROOT/CARD_FIELD/ROW_SET/ROW[SECTION_ID=$id]">
                    <xsl:sort select="FIELD_ORDER"/>
                    <xsl:if test="NAME != ''">
                        <xsl:if test="SECTION != 'GROUP_CONTRACT_HEADER' and SECTION!= 'HEADER_GROUP'">
                            <xsl:if test="VISIBLE_EMPTY = 'TRUE' or CLOB_VALUE!='' or VIEW_VALUE!=''">
                                <div class="cat">
                                    <xsl:if test="VISIBLE='FALSE'">
                                        <xsl:attribute name="style">display: none</xsl:attribute>
                                    </xsl:if>
                                    
                                    <xsl:if test="FT_NICK != 'HTML_CLOB'">
                                        <div class="key"><span><xsl:value-of select="NAME"/></span></div>
                                    </xsl:if>
                                    
                                    
                                    <div class="value"><!--pre-->
                                        <xsl:if test="MASK!=''">
                                            <xsl:attribute name="data-unmasked"><xsl:value-of select="VIEW_VALUE" disable-output-escaping="yes"/></xsl:attribute>
                                        </xsl:if>
                                        <xsl:attribute name="id"><xsl:value-of select="SECTION_ID" />_<xsl:value-of select="position()" /></xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="BDT_NICK='CLOB'">
                                                <xsl:choose>
                                                    <xsl:when test="FT_NICK = 'CHECKBOX' and CLOB_VALUE = 'true'">
                                                        <input type='checkbox' checked='true' class='staticCheckBox'/>
                                                    </xsl:when>
                                                    <xsl:when test="FT_NICK = 'CHECKBOX' and CLOB_VALUE = 'false'">
                                                        <input type='checkbox' class='staticCheckBox'/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                      <xsl:choose>
                                                        <xsl:when test="FT_NICK = 'TEXTAREA'">
                                                            <!--pre>
                                                              <xsl:value-of select="CLOB_VALUE" disable-output-escaping="yes"/>
                                                            </pre-->  
                                                            <xsl:call-template name="nl2br">
                                                              <xsl:with-param name="s" select="CLOB_VALUE"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                          <xsl:value-of select="CLOB_VALUE" disable-output-escaping="yes"/>
                                                        </xsl:otherwise>
                                                      </xsl:choose>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                    <xsl:when test="FT_NICK = 'CHECKBOX' and VIEW_VALUE = 'true'">
                                                        <input type='checkbox' checked='true' class='staticCheckBox'/>
                                                    </xsl:when>
                                                    <xsl:when test="FT_NICK = 'CHECKBOX' and VIEW_VALUE = 'false'">
                                                        <input type='checkbox' class='staticCheckBox'/>
                                                    </xsl:when>
                                                    <xsl:when test="count(MASK) &gt; 0">
                                                        <script type="text/javascript">
                                                            try{
                                                            var val = accounting.formatMoney('<xsl:value-of select="VIEW_VALUE" disable-output-escaping="yes"/>'.replace(/,/,'.' ), <xsl:value-of select="MASK" disable-output-escaping="yes"/>);
                                                            $('#<xsl:value-of select="SECTION_ID" />_<xsl:value-of select="position()" />').text(val)
                                                            } catch(e){
                                                            throw new Error('Неправильный формат маски для поля <xsl:value-of select="NAME"/>')
                                                            }</script>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                      <xsl:choose>
                                                        <xsl:when test="FT_NICK = 'TEXTAREA'">
                                                            <!--pre>
                                                              <xsl:value-of select="VIEW_VALUE" disable-output-escaping="yes"/>
                                                            </pre-->  
                                                            <xsl:call-template name="nl2br">
                                                              <xsl:with-param name="s" select="VIEW_VALUE"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                          <xsl:value-of select="VIEW_VALUE" disable-output-escaping="yes"/>
                                                        </xsl:otherwise>
                                                      </xsl:choose>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    <!--/pre--></div>
                                </div>
                            </xsl:if>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
        <!-- Таблица конец -->
    </xsl:if>
</xsl:template>