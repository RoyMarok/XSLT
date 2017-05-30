<!-- section ********************************
<layout:section xmlns:layout="URN:html-form-layout:v0.1"
    select="XPATH"
    add="1|0"
    delete="1|0"
    label="Label"
class="CLASS">
text
</layout:section>
  *******************************************-->


<xsl:template match="layout:section" xmlns:layout="URN:html-form-layout:v0.1" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension">
    <xsl:comment>********************** SECTION:START *******************</xsl:comment>
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

    <xsl:variable name="_class" select="@class"/>

    <!-- название секции -->
    <xsl:variable name="sectionLabel" select="@label"/>
    <!-- внутренности секции -->
    <xsl:variable name="sectionLayout" select="*"/>

    <div class="{$id} sectionContainer sectionEmpty">

    <!-- шапка блока секций-->
        <h2 class="{$id} sectionHeader {$_class}">
        <!-- заголовок секций -->
        <span class="sectionCaption">
            <xsl:value-of select="@label"/>
        </span>

        </h2>

        <xsl:if test="@add='1'">
          <button type="button" class="sectionBtnAdd {$_class}" section="{$id}">
                Добавить секцию
                <xsl:if test="$sectionLabel != ''">
                    &quot;<xsl:value-of select="$sectionLabel"/>&quot;
                </xsl:if>
            </button>
        </xsl:if>

        <!-- пустышка для добавления блока, вставляется если add=1-->
        <xsl:if test="@add='1'">
            <xsl:comment>********************** SECTION:EMPTY HIDDEN BLOCK START*******************</xsl:comment>
            <div xfProcessChildren="0" style="display:none;">

                <div class="{$id} sectionTemplate notValid">

                    <div class="{$id} section {$_class}">
                        <!-- @todo add XML generation flags -->
                        <xsl:call-template name="layoutXMLInfo">
                            <xsl:with-param name="source" select="$this"/>
                        </xsl:call-template>

                    <!-- Генерация контента пустышки -->
                        <xsl:call-template name="Context.execute">
                            <xsl:with-param name="contextData">
                                <NODATA/>
                            </xsl:with-param>
                            <xsl:with-param name="markup" select="$sectionLayout"/>
                        </xsl:call-template>

                        <div class="line full" style="overflow:hidden">
                           <button type="button" section="{$id}" class="sectionBtnDelete {$_class}">
                                Удалить секцию
                                <xsl:if test="$sectionLabel != ''">
                                    &quot;<xsl:value-of select="$sectionLabel"/>&quot;
                                </xsl:if>
                            </button>
                        </div>
                    </div>
                </div>

            </div>

            <xsl:comment>********************** SECTION:EMPTY HIDDEN BLOCK END*******************</xsl:comment>
        </xsl:if>

    <!-- контейнер -->
        <xsl:comment>********************** SECTION:BLOCKS FILLED WITH DATA START*******************</xsl:comment>

        <xsl:for-each select="ctx:extract(@select)">
            <!--<div class="{$id} section {$_class}" style="padding-top:10px;">-->
            <div class="{$id} section {$_class}">
                <!-- @todo add XML generation flags -->
                <xsl:call-template name="layoutXMLInfo">
                    <xsl:with-param name="source" select="$this"/>
                </xsl:call-template>

                <xsl:call-template name="Context.execute">
                    <xsl:with-param name="contextData" select="."/>
                    <xsl:with-param name="markup" select="$sectionLayout"/>
                </xsl:call-template>
                <!--<div style="display:none;"> <xsl:copy-of select="$this"/> </div>-->
                <xsl:if test="not(@NotDelete)">
                <div class="line full" style="overflow:hidden">
                    <button type="button" section="{$id}" class="sectionBtnDelete {$_class}">
                        Удалить секцию
                        <xsl:if test="$sectionLabel != ''">
                        &quot;<xsl:value-of select="$sectionLabel"/>&quot;
                        </xsl:if>
                    </button>
                </div>
                </xsl:if>
            </div>
        </xsl:for-each>
        <xsl:comment>********************** SECTION:BLOCKS FILLED WITH DATA END*******************</xsl:comment>
        <!-- кнопка добавления секции, добавляется если атрибут add=1 -->
    </div>
    <xsl:comment>********************** SECTION END *******************</xsl:comment>
</xsl:template>