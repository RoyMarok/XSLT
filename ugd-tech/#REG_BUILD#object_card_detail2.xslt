<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:bc1="http://xmlns.oracle.com/MSG_BC_1" xmlns:bc2="http://xmlns.oracle.com/MSG_BC_v2">
    <xsl:output method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    
    {B{#SP_OBJECT#obj_card_templates}E}
    
    <xsl:template match="/">
        <a class="printLink" href="/ugd/getCardHtml.action?cardId=CARD$PRINT&amp;documentId={//DOC_KEY//DOC_KEY}&amp;body=$REG_BUILD$object_card_detail2&amp;head=$REG_BUILD$object_card_vit_header2" onclick="f.openWin(this.href, 'CARD_PRINT', 1000, 800); return false;">Печать</a>
        
        {B{CARD$ISIO$STYLE}E}
       {B{#REG_BUILD#object_card_detail_Kernel}E}
       <xml style="display: none;"><xsl:copy-of select="*"/></xml>
    </xsl:template>
    
     <!-- Отображение видео-->
     {B{CARD$OBJECT$VIDEO}E}
     
     {B{CARD$TEMPLATE}E}
     
</xsl:stylesheet>