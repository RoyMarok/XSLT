
    
    {B{CARD$TEMPLATE}E}
    
    <xsl:template name="header">          
        
        <!--Центральный блок-->
        <xsl:param name="BC_titleCard"/>
        <xsl:param name="BC_subTitleCard"/>
        
        <xsl:param name="BC_nameObj"/>
        <xsl:param name="BC_numberObj"/>
        <xsl:param name="BC_descriptObj_1"/>
        <xsl:param name="BC_descriptObj_1ref"/>
        <xsl:param name="BC_descriptObj_2"/>
        <xsl:param name="BC_descriptObj_2ref"/>
        <xsl:param name="BC_descriptObj_3"/>
        <xsl:param name="BC_descriptObj_3ref"/>
    
        <!--Правый блок-->
        <xsl:param name="BR_blockRightTop"/>
        <xsl:param name="BR_blockRightTop_class"/>
        
        <xsl:param name="BR_blockRighrBottom"/>
        <xsl:param name="BR_blockRightBottom_class"/>             
    
       <!--Левый блок-->
        <xsl:param name="BL_blockLeftTop"/>
        <xsl:param name="BL_blockLeftBottom"/>

     
    {B{CARD$HEADER_STYLE}E}
    {B{CARD$HEADER_SCRIPT}E}

    <div id="cardHeader">
      <div class="blockLeft">
        <!--Блок вверх/левый-->
        <div class="blockLeftTop"><xsl:value-of select="$BL_blockLeftTop" disable-output-escaping="yes"/> </div>
        
        <!--Блок нижний/левый-->
        <div class="blockLeftBottom"><xsl:value-of select="$BL_blockLeftBottom" disable-output-escaping="yes"/></div>
      </div>    
      
      <!--Блок центральный--> 
      <div class="blockCenter">
        
        <!--заголовок--> 
        <div class="titleCard"><xsl:value-of select="$BC_titleCard" disable-output-escaping="yes"/></div>
        <div class="subTitleCard"><xsl:value-of select="$BC_subTitleCard" disable-output-escaping="yes"/></div>
        
        <!--тип/категория-->
        <div class="nameObj"><xsl:value-of select="$BC_nameObj" disable-output-escaping="yes"/></div>
        <div class="nameObj"><xsl:value-of select="$BC_numberObj" disable-output-escaping="yes"/></div>
        
        
        <!--адрес/наименование/описание 1-->
        <div class="descriptObj_1">
          <xsl:choose>
            <xsl:when test="$BC_descriptObj_1ref != ''">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="$BC_descriptObj_1ref"/>
                </xsl:attribute>
                <xsl:value-of select="$BC_descriptObj_1" disable-output-escaping="yes"/>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$BC_descriptObj_1" disable-output-escaping="yes"/>
            </xsl:otherwise>
          </xsl:choose>
        </div>
        
        <!--адрес/наименование/описание 2-->
        <!--div class="descriptObj_2"><xsl:value-of select="$BC_descriptObj_2" disable-output-escaping="yes"/></div-->
        
         <xsl:if test="$BC_descriptObj_2 != ''">
          <div class="descriptObj_2">
            <xsl:choose>
              <xsl:when test="$BC_descriptObj_2ref != ''">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="$BC_descriptObj_2ref"/>
                  </xsl:attribute>
                  <xsl:value-of select="$BC_descriptObj_2" disable-output-escaping="yes"/>
                </a>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$BC_descriptObj_2" disable-output-escaping="yes"/>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </xsl:if>
        
        <!--дополнительная ссылка-->
        <xsl:if test="$BC_descriptObj_3 != ''">
          <div class="descriptObj_3">
            <xsl:choose>
              <xsl:when test="$BC_descriptObj_3ref != ''">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="$BC_descriptObj_3ref"/>
                  </xsl:attribute>
                  <xsl:value-of select="$BC_descriptObj_3" disable-output-escaping="yes"/>
                </a>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$BC_descriptObj_3" disable-output-escaping="yes"/>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </xsl:if>
      </div>
      
      <div class="blockRight">
      
        <!--Блок вверх/правый-->
        
        <xsl:variable name="BR_blockRightTop_class_">
          <xsl:choose>
            <xsl:when test="$BR_blockRightTop_class != ''"><xsl:value-of select="$BR_blockRightTop_class" disable-output-escaping="yes"/></xsl:when>
            <xsl:otherwise>status_style</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="BR_blockRightBottom_class_">
          <xsl:choose>
            <xsl:when test="$BR_blockRightBottom_class != ''"><xsl:value-of select="$BR_blockRightBottom_class"/></xsl:when>
            <xsl:otherwise>status_style</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:if test="$BR_blockRightTop != ''">
         <div class="blockRightTop"><span class="{$BR_blockRightTop_class_}"><xsl:value-of select="$BR_blockRightTop" disable-output-escaping="yes"/></span></div>
        </xsl:if> 
        
         <xsl:if test="$BR_blockRighrBottom != ''">
          <!--Блок вверх/нижний-->
          <div class="blockRighrBottom"><span class="{$BR_blockRightBottom_class_}"><xsl:value-of select="$BR_blockRighrBottom" disable-output-escaping="yes"/></span></div>     
        </xsl:if> 
      </div>    
    </div>
        
    </xsl:template>