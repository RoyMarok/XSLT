<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>
    <xsl:variable name="DATA" select="//FT_TASK_IN_CONTROL/XMLDOC"/>
    <xsl:template match="/">

      <xml style="display: none">
        <xsl:copy-of select="*"/>
      </xml>
      <xsl:for-each select="$DATA/TASKS/TASK">
        <div class="task-item">
          <div class="task-date" style="width: auto">
            <strong style="text-align: right"><xsl:value-of select="EXECUTE_DEADLINE_STR"/></strong>
            <div class="ft-task-status" data-deadline="{EXECUTE_DEADLINE}" data-status="{STATUS_NICK}" data-color="{STATUS_COLOR}" style="padding: 0 10px;"><xsl:value-of select="STATUS_NAME"/></div>
          </div>
          <h2>
        <xsl:if test="ENTITY_TYPE= 'FT_TASK'">
        <a target="_blank" href="/ugd/tabInfo.action?tab=CARD$FUNCTIONAL_TASKS$TASKS&amp;documentId={ID}&amp;app=PRIVATEOFFICE">
          <xsl:value-of select="NAME"/>
        </a>
      </xsl:if>
      <xsl:if test="ENTITY_TYPE= 'FA_AGREE'">
        <a target="_blank" href="/ugd/tabInfo.action?tab=CARD$FA$AGREEMENT_LIST&amp;documentId={ID}&amp;app=PRIVATEOFFICE">
          <xsl:value-of select="NAME"/>
        </a>
      </xsl:if>
          </h2>
      <xsl:if test="ENTITY_TYPE= 'FT_TASK'">
      <p style="margin: 0 0 3px;padding-right: 115px;">По документу <xsl:value-of select="ATTRS/ATTR[NAME = 'TASK_DOC_NAME']/VALUES/VALUE" disable-output-escaping="yes"/></p>
      </xsl:if>
      <xsl:if test="ENTITY_TYPE= 'FA_AGREE'">
      <p style="margin: 0 0 3px;padding-right: 115px;">По документу <xsl:value-of select="ATTRS/ATTR[NAME = 'AGREE_DOC_NAME']/VALUES/VALUE" disable-output-escaping="yes"/></p>
      </xsl:if>
      <xsl:for-each select="EXECUTORS/EXECUTOR">
      <p style="margin: 0"><xsl:value-of select="FIO"/></p>
      </xsl:for-each>
        </div>
      </xsl:for-each>

        <script>
        <xsl:text disable-output-escaping="yes">
        <![CDATA[
        var today = Date.parse(new Date());

        $('.ft-task-status').each(function(){
          var $t = $(this),
              status = $t.data('status'),
        color  = $t.data('color'),
              deadline = Date.parse($t.data('deadline'));

          switch (status) {
            case 'TASK_INPROGRESS': $t.css('background-color', (today < deadline) ? '#319adc' : '#f66'); break;
            case 'TASK_READY_TOACCEPT': $t.css('background-color','#c4e590'); break;
            case 'TASK_READY': $t.css('background-color','#339900'); break;
            case 'TASK_REJECTED_TOACCEPT': $t.css('background-color','#ebebeb'); break;
            case 'TASK_REJECTED':
            case 'TASK_CANCELED':
              $t.css('background-color','grey'); break;
            default: 
        $t.css('background-color', color);
        break;
          }

        });
          ]]>
          </xsl:text>
        </script>
    </xsl:template>
</xsl:stylesheet>