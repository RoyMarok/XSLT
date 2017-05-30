<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">

      <xsl:for-each select="//TASKS//ROW">

        <xsl:variable name="status">
          <xsl:value-of select="STATUS"/>
        </xsl:variable>


        <div class="task-item task-{$status}">
          <span class="task-add-favorites"  onclick="mainpage.addToFavorites(this);" title="Добавить задачу в избранное"></span>
          <div class="task-date">
            <strong><xsl:value-of select="DEADLINE"/></strong>
            <xsl:choose>
              <xsl:when test="$status = 'expired'">
                <div>срок истёк</div>
              </xsl:when>
              <xsl:when test="$status = 'today'">
                <div>на сегодня</div>
              </xsl:when>
              <xsl:when test="$status = 'nextday'">
                <div>на завтра</div>
              </xsl:when>
              <xsl:otherwise>
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <h2><xsl:value-of select="TASKNAME_LNK" disable-output-escaping="yes"/></h2>
          <table>
            <xsl:if test="PROC_NAME != ''">
              <tr>
                <td class="task-table-label">Процесс:</td>
                <td><xsl:value-of select="PROC_NAME"/></td>
              </tr>
            </xsl:if>
            <xsl:if test="TASK_TYPE = 'PROCESS'">
              <xsl:if test="(DOC_TYPE != '') and (DOCNUM_LNK != '') and (DOC_DATE != '')">
              <tr>
                <td colspan="2">
                  <xsl:if test="DOC_TYPE != ''">
                    <span class="task-doc-type">
                      <xsl:value-of select="DOC_TYPE"/>
                    </span>
                    &nbsp;
                  </xsl:if>
                  <xsl:if test="DOCNUM_LNK != ''">
                    <xsl:value-of select="DOCNUM_LNK" disable-output-escaping="yes"/>
                  </xsl:if>
                  <xsl:if test="DOC_DATE != ''">
                    от <xsl:value-of select="DOC_DATE"/>
                  </xsl:if>
                </td>
              </tr>
              </xsl:if>
            </xsl:if>

            <xsl:if test="(TASK_TYPE = 'FT_TASK') or (TASK_TYPE = 'FA_AGREE') or (TASK_TYPE = 'CONTACT_CENTER')">
              <tr>
                <td colspan="2">
                  <p style="margin:0">
                    <xsl:value-of select="DOC_INFO" disable-output-escaping="yes"/>
                  </p>
                </td>
              </tr>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="(OBJECT_ADDRESS != '') and (OBJECT_NAME != '')">
                    <tr>
                      <td class="task-table-label">Объект:</td>
                      <td>
                        <xsl:value-of select="OBJECT_NAME"/>
                        <xsl:if test="OBJECT_ADDRESS != ''">
                          &nbsp;(<xsl:value-of select="OBJECT_ADDRESS"/>)
                        </xsl:if>
                      </td>
                    </tr>
                </xsl:when>

                <xsl:otherwise>

                    <xsl:choose>
                        <xsl:when test="count(OBJECT_INFO//OBJECT) &gt; 1">
                            <tr>
                                <td class="task-table-label">Объекты:
                                    </td>
                                <td>
                                    <xsl:for-each select="OBJECT_INFO//OBJECT">
                                        <div class="manyObjectsList"><xsl:value-of select="NAME"/>
                                        <xsl:if test="ADDRESS != ''">
                                          &nbsp;(<xsl:value-of select="ADDRESS"/>)
                                        </xsl:if></div>

                                    </xsl:for-each>
                                </td>
                            </tr>

                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="(OBJECT_INFO//OBJECT//NAME != '') or (OBJECT_INFO//OBJECT//ADDRESS != '')">
                            <tr>
                                <td class="task-table-label">Объект:</td>
                                <td>
                                    <xsl:value-of select="OBJECT_INFO//OBJECT//NAME"/>
                                    <xsl:if test="OBJECT_INFO//OBJECT//ADDRESS != ''">
                                      &nbsp;(<xsl:value-of select="OBJECT_INFO//OBJECT//ADDRESS"/>)
                                    </xsl:if>
                                </td>
                            </tr>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>


                </xsl:otherwise>
            </xsl:choose>
            <!--xsl:if test="(OBJECT_ADDRESS != '') and (OBJECT_NAME != '')">
            <tr>
              <td class="task-table-label">Объект:</td>
              <td>
                <xsl:value-of select="OBJECT_NAME"/>
                <xsl:if test="OBJECT_ADDRESS != ''">
                  &nbsp;(<xsl:value-of select="OBJECT_ADDRESS"/>)
                </xsl:if>
              </td>
            </tr>
            </xsl:if-->

          </table>
        </div>
      </xsl:for-each>
      <style>
            .manyObjectsList:not(:last-child){
                margin-bottom: 10px;
            }
        </style>
        <xml style="display: none">
            <xsl:copy-of select="*"/>
        </xml>
    </xsl:template>
</xsl:stylesheet>