<style>
  div.photoWrap table.photoList td img{
    height:60px;
    margin:auto;
    display:block;
    border: 1px solid #cfcfcf;
  }
  div.photoWrap span.datePhoto {
    color: #858483;
    font-size: 11px;
    display: block;
    padding: 2px 0 0 0;
  }
  div.photoWrap a {
    text-decoration:none;
  }
  table.photoList{
    text-align:center;
  }
  div.photoWrap img.mainPage{
    width:360px;
    display:block;
  }

</style>
<script type="text/javascript">
  $(document).ready(function(){
    $('a',"div.photoWrap").each(function(){
      $(this).colorbox({opacity: 0.2,current:"Страница: {current} из {total}",photo: true});
    });
  });
</script>
<div class="rightSectTitle">
    Фотографии
</div><br></br>
<div class="photoWrap">
  <a rel="1">
      <xsl:attribute name="href">/portal/getImage.action?cardId=<xsl:value-of select="ROOT/OBJ_PHOTO_GBU/ROW_SET/ROW[N='1']/CARD_ID"/>&amp;page=1</xsl:attribute>
      <img class="mainPage">
        <xsl:attribute name="src">/portal/getImage.action?cardId=<xsl:value-of select="ROOT/OBJ_PHOTO_GBU/ROW_SET/ROW[N='1']/CARD_ID"/>&amp;page=1</xsl:attribute>
      </img>
      <span style="margin-bottom:5px;" class="datePhoto"><xsl:value-of select="ROOT/OBJ_PHOTO_GBU/ROW_SET/ROW[N='1']/SORT_VALUE"/></span>
  </a>
  <div class="thumbWrap">
    <table class="photoList">
    <tr>
    <xsl:for-each select="ROOT/OBJ_PHOTO_GBU/ROW_SET/ROW">
     <xsl:sort select="N"/>
     <xsl:if test="N!=1">
      <td>
        <a href="/portal/getImage.action?cardId={CARD_ID}&amp;page=1" rel="1">
          <img src="/portal/getThumb.action?cardId={CARD_ID}&amp;page=1"/>
          <span class="datePhoto"><xsl:value-of select="SORT_VALUE"/></span>
        </a>
      </td>
     </xsl:if>
    </xsl:for-each>
    </tr>
    </table>
  </div>
</div>
