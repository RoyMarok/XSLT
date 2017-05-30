  <xsl:template name="nl2br2">
    <xsl:param name="s"/>
    <xsl:choose>
      <xsl:when test="contains($s,'
')">
        <xsl:value-of select="substring-before($s,'
')"/>
        <xsl:if test="contains($s,'
')">
          <xsl:text> </xsl:text>          
          <br/>    
          <xsl:call-template name="nl2br">
            <xsl:with-param name="s" select="substring-after($s,'
')"/>
          </xsl:call-template>
        </xsl:if>        
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$s"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>    
   
    
<xsl:template name="nl2br">    
        <xsl:param name="s"/>
        <xsl:variable name="c10"><xsl:text>
</xsl:text></xsl:variable>
        <div><xsl:value-of select="substring-before($s,$c10)" disable-output-escaping="yes"/></div>
        <xsl:choose>
            <xsl:when test="contains($s,$c10)">
                <xsl:call-template name="nl2br">
                    <xsl:with-param name="s" select="substring-after($s,$c10)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$s" disable-output-escaping="yes"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
    
    <!--Убирает спецсимволы в строке-->
    <!-- @str - строка -->
    <!-- Пример: Решения об утверждении ПД!A VIT_CUSTOM.PKG_PROCESS_EXT_UTILS_UGD.PR_NEXT_STEP_OSHS_PERSON_ID2 A! -->
    <xsl:template name="spec_symbol">    
      <xsl:param name="str"/>  
        <xsl:choose>
          <xsl:when test="contains($str,'!')">
            <xsl:value-of select="normalize-space(substring-before($str,'!'))"/>    
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$str"/>    
          </xsl:otherwise>
        </xsl:choose>
      
    </xsl:template>
    
    

    <!--Преобразование даты-->
    <xsl:template name="date_transform">
        <xsl:param name="old_date"/>
        <xsl:choose>
            <xsl:when test="substring($old_date,5,1) = '-' and substring($old_date,8,1) = '-'">
                <xsl:value-of select="substring($old_date,9,2)"/>
                <xsl:text>.</xsl:text>
                <xsl:value-of select="substring($old_date,6,2)"/>
                <xsl:text>.</xsl:text>
                <xsl:value-of select="substring($old_date,1,4)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$old_date"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
    
    <!--Преобразование времени-->
    <xsl:template name="time_transform">
    <!--yyyy-mm-ddThh:mi:ss.0Z -> dd.mm.yyyy, hh:mi:ss          -->
        <xsl:param name="old_datetime"/>
        <xsl:if test="substring($old_datetime,5,1) = '-' 
                and substring($old_datetime,8,1)  = '-' 
                    and substring($old_datetime,11,1)  = 'T'
                and substring($old_datetime,14,1) = ':' 
                and substring($old_datetime,17,1) = ':'">
                        
            <xsl:value-of select="substring($old_datetime,9,2)"/>
            <xsl:text>.</xsl:text>       
            
            <xsl:value-of select="substring($old_datetime,6,2)"/>
            <xsl:text>.</xsl:text>        
            
            <xsl:value-of select="substring($old_datetime,1,4)"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="substring($old_datetime,12,2)"/>
            <xsl:text>:</xsl:text>
            <xsl:value-of select="substring($old_datetime,15,2)"/>
            <xsl:text>:</xsl:text>
            <xsl:value-of select="substring($old_datetime,18,2)"/>
        </xsl:if>
    
    </xsl:template>
    <xsl:template name="date_transform2">
        <xsl:param name="old_date"/>
        <xsl:choose>
            <xsl:when test="substring($old_date,5,1) = '-' and substring($old_date,8,1) = '-'">
                <xsl:text>"</xsl:text>
                <xsl:value-of select="substring($old_date,9,2)"/>
                <xsl:text>"</xsl:text>
                <xsl:text> </xsl:text>
                <xsl:if test="substring($old_date,6,2) = '01'"><xsl:text>января</xsl:text></xsl:if>
                <xsl:if test="substring($old_date,6,2) = '02'"><xsl:text>февраля</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '03'"><xsl:text>марта</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '04'"><xsl:text>апреля</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '05'"><xsl:text>мая</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '06'"><xsl:text>июня</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '07'"><xsl:text>июля</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '08'"><xsl:text>августа</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '09'"><xsl:text>сентября</xsl:text></xsl:if>
                <xsl:if test="substring($old_date,6,2) = '10'"><xsl:text>октября</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '11'"><xsl:text>ноября</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '12'"><xsl:text>декабря</xsl:text></xsl:if>               
                <xsl:text> </xsl:text>
                <xsl:value-of select="substring($old_date,1,4)"/>
                <xsl:text> </xsl:text>
                <xsl:text>г.</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$old_date"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
    
    <!--Преобразование времени-->
    <!-- Выделяем время из даты -->
    <xsl:template name="time_transform_2">    
      <xsl:param name="date"/>    
      <xsl:value-of select="substring($date,12,5)"/>    
    </xsl:template>
    
    <xsl:template name="date_month">
        <xsl:param name="old_date"/>
        <xsl:choose>
            <xsl:when test="substring($old_date,5,1) = '-' and substring($old_date,8,1) = '-'">                
                <xsl:if test="substring($old_date,6,2) = '01'"><xsl:text>января</xsl:text></xsl:if>
                <xsl:if test="substring($old_date,6,2) = '02'"><xsl:text>февраля</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '03'"><xsl:text>марта</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '04'"><xsl:text>апреля</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '05'"><xsl:text>мая</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '06'"><xsl:text>июня</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '07'"><xsl:text>июля</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '08'"><xsl:text>августа</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '09'"><xsl:text>сентября</xsl:text></xsl:if>
                <xsl:if test="substring($old_date,6,2) = '10'"><xsl:text>октября</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '11'"><xsl:text>ноября</xsl:text></xsl:if> 
                <xsl:if test="substring($old_date,6,2) = '12'"><xsl:text>декабря</xsl:text></xsl:if>                              
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="$old_date"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
    
    <xsl:template name="number_float">
        <xsl:param name="str"/>
        <xsl:if test="string-length($str)&gt;0">
            <xsl:value-of select="format-number($str, '### ### ### ###,#', 'ik_format')"/>
        </xsl:if>
    </xsl:template>