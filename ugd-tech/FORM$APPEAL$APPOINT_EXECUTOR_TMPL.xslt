<xsl:template name="executorSelect" >
        <xsl:param name="data" />
    <!--xsl:variable name="data">
        <xsl:copy-of select="@data"/>
    </xsl:variable-->
    <style>
    .ft-people_wrapper{
        display: block;
        width: 700px;
        width: 100%;
    }
.ft-people-group {
        /*margin-bottom: 33px;*/
        font-family: 'PTSans', Arial, sans-serif;
        font-size: 14px;
        box-sizing: border-box;
        display: flex;
        /*flex-direction: column;*/
        flex-wrap: wrap;
        width: 100%;
        overflow: hidden;
        padding: 0;

      }
     .ft-people-group * {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
}
      .ft-people-group:last-child {
        margin-bottom: 0;
      }
      .ft-people-group li {
        min-height: 46px;
        display: block;
        margin-bottom: 5px;
        position: relative;
        width: 350px;
        width: 50%;
      }
      .ft-people-group li:last-child {
        margin-bottom: 0;
      }
      .ft-people-group-inner {
        display: table;
        border-left: 3px solid transparent;
        padding: 0;
        position: absolute;
        cursor: pointer;
        position: relative;
        width: 100%;
      }
      .ft-people-group-inner.selected,
      .selected .ft-people-group-inner{
        background: #F5F7FA;
        background: #319adc;
        color: white;


      }
      .ft-people-group li.selected:hover .ft-people-group-inner{
        background: #0072ff;
      }
      .ft-people-group li:hover .ft-people-group-inner {
        background: #fff;
        background: #F5F7FA;
        /*width: 400px;*/
        z-index: 10;
        position: relative;

        /*-webkit-box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);
        -moz-box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);
        box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);*/
      }
      .ft-people-group li:hover .ft-people-extended-info {
        display: block;
      }
      .ft-people-group li:hover .ft-people-photo span {
        border-color: #BCCAD3;
      }
      .ft-people-author .ft-people-group-inner {
        border-color: #7266ba;
      }
      .ft-people-executor .ft-people-group-inner {
        border-color: #23b7e5;
      }
      .ft-people-external-executor .ft-people-group-inner {
        border-color: #fad733;
      }
      .ft-people-observer .ft-people-group-inner {
        border-color: #27c24c;
      }

      .ft-people-photo {
        display: table-cell;
        padding: 4px 0 4px 17px;
        vertical-align: middle;
      }
      .ft-people-photo span {
        display: block;
        width: 34px;
        height: 34px;
        border: 2px solid #fff;
        border-radius: 50%;
        -webkit-background-size: cover;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center center;
        box-sizing: border-box;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAMAAAANmfvwAAAAh1BMVEUAAADY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+WKk5iPmJ2NlpvU2+Grs7nDy9G+xsuttrugqa7N1Nqyur+VnqOSm6DW3eOjrLGcpaqXoKXJ0de6wseosLadpqvP192aoqh4jQezAAAAFXRSTlMA+uy0s6BgIhbyy35aPcxZ83w+ejxHN123AAABYklEQVQ4y42U2XLCMAxFnZUQdlpvsbMCAUL///vaNLIsmtLpfZPnjCVdyWZEWZrkYRCEeZJm7Ddt4oCjgngzAxYR/6Fo8Uzslnym5ZoSKw4yg7gYhFaeeIMjfRajztoxB8wCB6dKTKpOjtlBpa4OK5ws1jPVjL0UiBS+r5F4x1AiIjlq9CfGqEek90jMWOY97RBpic8ZS32kEFHcK2WJDypEPgiSsNwHN0QaguQs9AFad9EECVlAohqQKycKKKKv92lGV00Rn6huWlUXUsl7LdumJomgXF2q79mYxnAztl24m7bQtB6mFLwRJZ/SDcAkYF0Js9GmNRpcLk5gXRbQCd6sullnsZkGAGNEWwtRXFxQwhjZhiJfgN+ayi0Di+iqdLbFpRlviXAxH7as+k4qJaRQSnZ9VdqHX0y25i+FT+nwiliRp/YnAbn2c2C//v+zRx1jujrxcQbAF7Qdv6Dt8xf0CQt3TYPhEUP4AAAAAElFTkSuQmCC');
      }
      .ft-people-info {
        padding: 0 13px;
        display: table-cell;
        vertical-align: middle;
        width: 100%;
      }
      .ft-people-info &gt; span {
        display: block;
      }
      .ft-people-info &gt; strong {
        font-weight: bold;
        font-size: 11px;
        color: #7d8fa4;
      }
      .ft-people-extended-info {
        display: none;
        margin: 13px 0;
      }
      .ft-people-extended-info table {
        margin-bottom: 26px;
      }
      .ft-people-extended-info th {
        width: 116px;
        text-align: left;
        overflow: hidden;
        font-weight: normal;
        vertical-align: top;
        padding: 4px 0;
      }
      .ft-people-extended-info th span {
        background-color: #fff;
        position: relative;
        z-index: 2;
        padding-right: 3px;
      }
      .ft-people-extended-info th span:after {
        content: '........................................';
        display: block;
        white-space: nowrap;
        position: absolute;
        color: #000;
        opacity: .2;
        bottom: 0;
        z-index: -1;

      }
      .ft-people-extended-info td {
        padding: 4px;
        vertical-align: top;
      }
      .ft-people-extended-info strong {
        font-weight: bold;
      }
      .ft-people-extended-info p {}

      .ft-button {
        display: inline-block;
        margin-right: 10px;
        border-radius: 3px;
        border: 1px solid transparent;
        /*min-width: 150px;*/
        padding: 7px 10px;
        background: transparent;
        font-size: 16px;
        position: relative;
        cursor: pointer;
        text-decoration: none;
        outline: none;
      }
      .ft-button:hover {
        background-color: #fff;
        border-color: #ccc;
      }
      .ft-button-primary {
        color: #fff;
        background-color: #319ADC;
      }
      .ft-button-primary:hover {
        background-color: #0072ff;
        border-color: transparent;
      }
      .ft-button:before {
        content: '';
        display: block;
        background-repeat: no-repeat;
        background-position: center center;
        height: 100%;
        position: absolute;
        left: 10px;
        top: 0;
        opacity: .7;
      }
</style>
    <xsl:if test="count($data) &gt; 0">
    <div class="ft-people_wrapper">
    <ul class="ft-people-group">
    <xsl:for-each select="$data">
        <li data-id="{ID}">
          <div class="ft-people-group-inner">
            <div class="ft-people-photo">
              <span>
                <xsl:if test="FOTO_ID">
                  <xsl:attribute name="style">background-image: url(/ugd/getThumb.action?cardId=<xsl:value-of select="FOTO_ID"/>)</xsl:attribute>
                </xsl:if>
              </span>
            </div>
            <div class="ft-people-info">
              <span><xsl:value-of select="NAME"/></span>
              <!--strong>Привлеченный исполнитель</strong-->
              <!--div class="ft-people-extended-info">
                <table>
                  <xsl:if test="count(POSITION) &gt; 0">
                  <tr>
                    <th><span>Должность</span></th>
                    <td>
                      <xsl:for-each select="POSITION">
                          <xsl:value-of select="text()"/>
                          <xsl:if test="position() != last()">
                          <xsl:text>, </xsl:text>
                          </xsl:if>
                      </xsl:for-each>
                    </td>
                  </tr>
                  </xsl:if>

                  <xsl:if test="PHONE">
                    <tr>
                      <th><span>Позвонить</span></th>
                      <td><strong><xsl:value-of select="PHONE"/></strong></td>
                    </tr>
                  </xsl:if>

                  <xsl:if test="EMAIL">
                    <tr>
                      <th><span>Написать</span></th>
                      <td><a href="mailto:{EMAIL}"><xsl:value-of select="EMAIL"/></a></td>
                    </tr>
                  </xsl:if>

                </table>
              </div-->
            </div>
          </div>
        </li>
    </xsl:for-each>
    </ul>
    </div>
    </xsl:if>
</xsl:template>