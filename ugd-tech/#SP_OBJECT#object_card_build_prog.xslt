<!-- <xsl:if test="/ROOT/OBJ_HOD_STR/ROW_SET/ROW"> -->
<xsl:if test="/ROOT/OBJ_HOD/ROW_SET/ROW">
    
    <!-- Заголовок подраздела со ссылкой -->
    <div class="rightSectTitle">
        <div class="rightSectTContent">Ход строительства</div>
        
        <!-- Вывод ссылки 'Подробнее' только в паспорте Объекта СП -->
        <xsl:if test="$obj_type">
            <xsl:if test="$obj_type ne 'RegBuild'">
                <div class="detailLinkWrap">
                    <xsl:element name="a">
                        <xsl:attribute name="class">detailLink</xsl:attribute>
                        <xsl:attribute name="id">hodLink</xsl:attribute>
                        <xsl:attribute name="title">Перейти в раздел "Ход строительства"</xsl:attribute>
                        Подробнее
                    </xsl:element>
                </div>
            </xsl:if>
        </xsl:if>
        &#160;
    </div>
    
    <!-- Вывод пунктов в разделе "Ход строительства" -->
    <!-- Для вывода в нужном порядке выполняется проверка XML-данных по наименованию поля "CSOURCE" -->
    <!-- <xsl:for-each select="/ROOT/OBJ_HOD_STR/ROW_SET/ROW"> -->
    <xsl:for-each select="/ROOT/OBJ_HOD/ROW_SET/ROW">
        <xsl:call-template name="buildProgress"/>
    </xsl:for-each>
</xsl:if>