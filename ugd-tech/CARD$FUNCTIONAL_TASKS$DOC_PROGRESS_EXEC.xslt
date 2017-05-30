<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>
    <xsl:variable name="DATA" select="//FT_PROGRESS_EXECUTION/XMLDOC"/>

    <xsl:template match="/">
      <style>
        #tabs-container.ui-tabs .ui-tabs-nav a:hover {
          border: 0;
        }
        .pe-item {
          border-radius: 3px;
          border: 1px solid #e7e8ec;
          display: inline-block;
        }

        .pe-inprogress-task {
          border-left: 3px solid #319adc;
        }
        .pe-inprogress-task .pe-item-status {
          color: #319adc;
        }
        .pe-inprogress-task:hover {
          box-shadow: 0px 10px 15px rgba(68, 138, 255, .3);
        }

        .pe-fuckup-task {
          border: 1px solid #f66;
          border-left: 3px solid #f66;
        }
        .pe-fuckup-task .pe-item-deadline strong,
        .pe-fuckup-task .pe-item-status {
          color: #f66;
        }
        .pe-fuckup-task:hover {
          box-shadow: 0px 10px 15px rgba(255, 0, 0, .4);
        }

        .pe-completed-task {
          border-left: 3px solid #339900;
        }
        .pe-completed-task .pe-item-status {
          color: #339900;
        }
        .pe-completed-task:hover {
          box-shadow: 0px 10px 15px rgba(51, 153, 0, 0.3)
        }
        .pe-rejected-task {
          border-left: 3px solid #e7e8ec;
        }
        .pe-rejected-task .pe-item-status {
          color: #e7e8ec;
        }
        .pe-readyToAccept-task {
          border-left: 3px solid #c4e590;
        }
        .pe-readyToAccept-task .pe-item-status {
          color: #c4e590;
        }
        .pe-readyToAccept-task:hover {
          box-shadow: 0px 10px 15px rgba(51, 153, 0, 0.3)
        }
        .pe-item-isCurrent-1 {
          border: 3px solid #319adc;
        }
        .pe-item-inner {
          display: -webkit-flex;
          display: -ms-flex;
          display: flex;
          background-color: #fff;
        }
        .pe-item-left {
          position: relative;
          margin: 10px 15px;
          display: block;
          width: 300px;
        }
        .pe-item-right {
          padding: 10px 15px;
          background: #FAFBFD;
          max-width: 400px;
        }
        .pe-item-people {
          max-width: 166px;
        }
        .pe-item-people-info {
          position: absolute;
          width: 400px;
          display: none;
          background: #fff;
          box-shadow: 0px 0px 17px 0px rgba(0, 0, 0, .4);
          padding: 15px 20px 15px 60px;
          transform: translateY(-100%);
          margin-left: -200px;
          left: 50%;
          z-index: 10;
        }
        .pe-item-people-photo {
          position: absolute;
          left: 13px;
        }
        .pe-item-people-photo span {
          display: block;
          width: 34px;
          height: 34px;
          border: 2px solid #BCCAD3;
          border-radius: 50%;
          position: relative;
          -webkit-background-size: cover;
          background-size: cover;
          background-repeat: no-repeat;
          background-position: center center;
          background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAMAAAANmfvwAAAAh1BMVEUAAADY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+WKk5iPmJ2NlpvU2+Grs7nDy9G+xsuttrugqa7N1Nqyur+VnqOSm6DW3eOjrLGcpaqXoKXJ0de6wseosLadpqvP192aoqh4jQezAAAAFXRSTlMA+uy0s6BgIhbyy35aPcxZ83w+ejxHN123AAABYklEQVQ4y42U2XLCMAxFnZUQdlpvsbMCAUL///vaNLIsmtLpfZPnjCVdyWZEWZrkYRCEeZJm7Ddt4oCjgngzAxYR/6Fo8Uzslnym5ZoSKw4yg7gYhFaeeIMjfRajztoxB8wCB6dKTKpOjtlBpa4OK5ws1jPVjL0UiBS+r5F4x1AiIjlq9CfGqEek90jMWOY97RBpic8ZS32kEFHcK2WJDypEPgiSsNwHN0QaguQs9AFad9EECVlAohqQKycKKKKv92lGV00Rn6huWlUXUsl7LdumJomgXF2q79mYxnAztl24m7bQtB6mFLwRJZ/SDcAkYF0Js9GmNRpcLk5gXRbQCd6sullnsZkGAGNEWwtRXFxQwhjZhiJfgN+ayi0Di+iqdLbFpRlviXAxH7as+k4qJaRQSnZ9VdqHX0y25i+FT+nwiliRp/YnAbn2c2C//v+zRx1jujrxcQbAF7Qdv6Dt8xf0CQt3TYPhEUP4AAAAAElFTkSuQmCC');
        }
        .pe-item-people-info > span {
          display: block;
        }
        .pe-item-people-info > strong {
          display: block;
          font-size: 11px;
          color: #7d8fa4;
          margin-bottom: 13px;
        }
        .pe-item-people-info th {
          width: 116px;
          text-align: left;
          overflow: hidden;
          font-weight: normal;
          vertical-align: top;
          padding: 4px 0;
        }
        .pe-item-people-info th span {
          background-color: #fff;
          position: relative;
          z-index: 2;
          padding-right: 3px;
        }
        .pe-item-people-info th span:after {
          content: '........................................';
          display: block;
          white-space: nowrap;
          position: absolute;
          color: #000;
          opacity: .2;
          bottom: 0;
          z-index: -1;
        }
        .pe-item-people-info td {
          padding: 4px;
          vertical-align: top;
        }
        .pe-item-people-info strong {
          font-weight: bold;
        }
        .pe-item-people:hover .pe-item-people-info {
          display: block;
        }
        .pe-item-status {
          position: absolute;
          font-size: 12px;
          right: 0;
          top: 1px;
          right: 0;
          text-align: right;
          line-height: .7;
        }
        .pe-item-status:after  {
          content: '\00B7';
          font-size: 40px;
          padding-left: 1px;
          position: absolute;
          line-height: 0;
          top: 50%;
          margin-top: -2px;
        }
        .pe-item-name {
          margin: 10px 0 29px;
        }
        .pe-item-deadline {
          font-size: 12px;
          position: absolute;
          bottom: 0;
        }

        .pe-report-list {
          list-style: none;
          padding: 0;
          margin-bottom: 8px;
        }
        .pe-item-right .pe-report-list:last-child {
          margin-bottom: 0;
        }
        .pe-report-list li {
          margin-bottom: 2px;
          position: relative;
          padding: 0 7px 0 17px;
          display: block;
          min-height: 10px;
        }
        .pe-report-list li:last-child {
          margin-bottom: 0;
        }
        .pe-report-list li input {
          position: absolute;
          top: 2px;
          left: 0;
        }
        .pe-report-list li label {
          cursor: pointer;
          font-size: 11px;
        }
        .pe-nested-list-wrap {
          padding-left: 10px;
          font-size: 13px;
        }
        .pe-nested-list-wrap a:visited,
        .pe-nested-list-wrap a {
          color: #0144dd;
          text-decoration: none;
          line-height: 1.4em;
        }
        .pe-nested-list-wrap a:hover {
          color: #c00;
          border-bottom: 1px solid  #c00;;
        }
        .pe-nested-list-wrap a[target="_blank"]::after {
            content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPBAMAAADJ+Ih5AAAAGFBMVEX///9fmezw8PA2eMihw/M5eMeiwvOnxO40va+0AAAAPklEQVQI12PAChIFBUXADAEGBkYII9QYymAAMxwFBZiZQQwhpYIAKEOZgQHCMCoUFAMzlBSBFDaGI9gCBAAAc7wGGRqx47YAAAAASUVORK5CYII=');
            display: inline-block;
            margin-left: 4px;
            position: absolute;
        }
        .pe-nested-list-wrap ul.pe-nested-list {
          list-style: none;
          padding: 0;
        }
        .pe-nested-list-wrap ul.pe-nested-list ul.pe-nested-list {
          margin-left: 20px;
        }
        .pe-nested-list-item {
          position: relative;
        }
        .pe-nested-list-wrap > .pe-nested-list > .pe-nested-list-item > .pe-nested-list-toggle{
          left: -25px;
          top: 0;
        }
        .pe-nested-list-wrap ul.pe-nested-list ul.pe-nested-list .pe-nested-list-item {
          border-left: 2px solid #c3d1de;
          padding: 10px 20px;
        }
        .pe-nested-list-wrap ul.pe-nested-list ul.pe-nested-list .pe-nested-list-item:last-child {
          border-left-color: transparent;
          padding-bottom: 0;
        }
        .pe-nested-list-wrap ul.pe-nested-list ul.pe-nested-list .pe-nested-list-item:before,
        .pe-nested-list-wrap ul.pe-nested-list ul.pe-nested-list .pe-nested-list-item:after {
          content: '';
          position: absolute;
          background-color: #c3d1de;
          display: block;
          left: -2px;
        }
        .pe-nested-list-wrap ul.pe-nested-list ul.pe-nested-list .pe-nested-list-item:before {
          height: 20px;
          width: 2px;
          top: 0;
        }
        .pe-nested-list-wrap ul.pe-nested-list ul.pe-nested-list .pe-nested-list-item:after {
          width: 22px;
          height: 2px;
          top: 20px;
        }
        .pe-nested-list-wrap .pe-nested-list-item {
          padding-bottom: 15px;
        }
        .pe-nested-list-toggle {
          width: 20px;
          height: 20px;
          border: 2px solid #319ADC;
          border-radius: 50%;
          position: absolute;
          background: #fff;
          top: 11px;
          left: -11px;
          z-index: 1;
          cursor: pointer;
        }
        .pe-nested-list-toggle:before,
        .pe-nested-list-toggle:after {
          content: '';
          display: block;
          position: absolute;
          background-color: #319ADC;
        }
        .pe-nested-list-toggle:before {
          width: 12px;
          height: 2px;
          top: 7px;
          left: 2px;
        }
        .pe-nested-list-toggle:after {
          display: none;
          width: 2px;
          height: 12px;
          top: 2px;
          left: 7px;
        }
        .pe-nested-list-collapsed > .pe-nested-list {
          display: none;
        }
        .pe-nested-list-collapsed > .pe-nested-list-toggle:after {
          display: block;
        }
      </style>

      <xml style="display: none">
        <xsl:copy-of select="*"/>
      </xml>

      <div class="pe-nested-list-wrap">
        <xsl:apply-templates select="$DATA" />
      </div>

        <script>
        <xsl:text disable-output-escaping="yes">
        <![CDATA[
          $('.pe-nested-list-toggle').on('click', function() {
            $(this).closest('li.pe-nested-list-item').toggleClass('pe-nested-list-collapsed');
          });

          var today = Date.parse(new Date());
          $('.pe-item').each(function(){
            var $t = $(this),
                status = $t.data('status'),
                deadline = Date.parse($t.data('deadline'));
            switch (status) {
              case 'TASK_INPROGRESS': $t.addClass((today <= deadline) ? 'pe-inprogress-task' : 'pe-fuckup-task'); break;
              case 'TASK_READY_TOACCEPT': $t.addClass('pe-readyToAccept-task'); break;
              case 'TASK_READY': $t.addClass('pe-completed-task'); break;
              case 'TASK_REJECTED_TOACCEPT':
              case 'TASK_REJECTED':
              case 'TASK_CANCELED':
                $t.addClass('pe-rejected-task'); break;
              default: return;
            }
            console.log(status, today, deadline)
          });
        ]]>
        </xsl:text>
        </script>
    </xsl:template>

    <xsl:template match="MENU">
        <ul class="pe-nested-list">
            <xsl:apply-templates select="TASK" />
        </ul>
    </xsl:template>

    <xsl:variable name="TASKS_COUNT" select="count($DATA/MENU/TASK)" />

    <xsl:template match="TASK">
        <li class="pe-nested-list-item pe-nested-list-collapsed" data-pos="{position()}">
            <xsl:call-template name="task">
              <xsl:with-param name="TASK" select="." />
              <xsl:with-param name="TASKS_COUNT" select="$TASKS_COUNT" />
            </xsl:call-template>
            <xsl:if test="TASK">
              <span class="pe-nested-list-toggle"></span>
              <ul class="pe-nested-list">
                  <xsl:apply-templates select="TASK" />
              </ul>
            </xsl:if>
        </li>
    </xsl:template>

    <xsl:template name="task">
      <xsl:param name="TASK" />
      <xsl:param name="TASKS_COUNT" />
      <div data-deadline="{$TASK/EXECUTE_DEADLINE}" data-status="{$TASK/STATUS}">
        <xsl:choose>
          <xsl:when test="TASKS_COUNT = '1' and $TASK/IS_CURRENT = '1'">
            <xsl:attribute name="class">pe-item pe-item-isCurrent-{$TASK/IS_CURRENT}</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="class">pe-item</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <div class="pe-item-inner">
          <div class="pe-item-left">
            <div class="pe-item-status">
              <xsl:choose>
                <xsl:when test="$TASK/STATUS = 'TASK_INPROGRESS'">
                  <xsl:text>В работе</xsl:text>
                </xsl:when>
                <xsl:when test="$TASK/STATUS = 'TASK_READY_TOACCEPT'">
                  <xsl:text>Выполнена</xsl:text>
                  <br />
                  <xsl:text>ожидает подтверждения</xsl:text>
                </xsl:when>
                <xsl:when test="$TASK/STATUS = 'TASK_READY'">
                  <xsl:text>Выполнена</xsl:text>
                </xsl:when>
                <xsl:when test="$TASK/STATUS = 'TASK_REJECTED_TOACCEPT'">
                  <xsl:text>Отклонена</xsl:text>
                  <br />
                  <xsl:text>ожидает подтверждения</xsl:text>
                </xsl:when>
                <xsl:when test="$TASK/STATUS = 'TASK_REJECTED'">
                  <xsl:text>Отклонена</xsl:text>
                </xsl:when>
                <xsl:when test="$TASK/STATUS = 'TASK_CANCELED'">
                  <xsl:text>Отменена</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$TASK/STATUS"/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
            <div class="pe-item-people">
              <a href="#"><xsl:value-of select="$TASK/EXECUTOR/FIO" /></a>
              <div class="pe-item-people-info">
                <div class="pe-item-people-photo">
                  <span>
                    <xsl:if test="$TASK/EXECUTOR/FOTO_ID != ''">
                      <xsl:attribute name="style">background-image: url(/portal/getThumb.action?cardId=<xsl:value-of select="$TASK/EXECUTOR/FOTO_ID"/>)</xsl:attribute>
                    </xsl:if>
                  </span>
                </div>
                <span><xsl:value-of select="$TASK/EXECUTOR/FIO" /></span>
                <strong>Исполнитель</strong>
                <table>
                  <xsl:if test="count($TASK/EXECUTOR/POSITIONS/POSITION) &gt; 0">
                  <tr>
                    <th><span>Должность</span></th>
                    <td>
                      <xsl:for-each select="$TASK/EXECUTOR/POSITIONS/POSITION">
                          <xsl:value-of select="text()"/>
                          <xsl:if test="position() != last()">
                            <xsl:text>, </xsl:text>
                          </xsl:if>
                      </xsl:for-each>
                    </td>
                  </tr>
                  </xsl:if>
                  <xsl:if test="$TASK/EXECUTOR/PHONE">
                    <tr>
                      <th><span>Позвонить</span></th>
                      <td><strong><xsl:value-of select="$TASK/EXECUTOR/PHONE"/></strong></td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="$TASK/EXECUTOR/EMAIL">
                    <tr>
                      <th><span>Написать</span></th>
                      <td><a href="mailto:{$TASK/EXECUTOR/EMAIL}"><xsl:value-of select="$TASK/EXECUTOR/EMAIL"/></a></td>
                    </tr>
                  </xsl:if>
                </table>
              </div>
            </div>
            <div class="pe-item-name">
              <a href="tabInfo.action?tab=CARD$FUNCTIONAL_TASKS$TASKS&amp;documentId={$TASK/ID}&amp;app=PRIVATEOFFICE" target="_blank">
                <xsl:value-of select="$TASK/NAME"/>
              </a>
            </div>
            <div class="pe-item-deadline">
              <xsl:text>выдано: </xsl:text>
              <xsl:value-of select="$TASK/CREATE_DATE"/>
              <xsl:text> до </xsl:text>
              <strong><xsl:value-of select="$TASK/EXECUTE_DEADLINE_STR"/></strong>
            </div>
          </div>
          <xsl:if test="$TASK/REPORT">
          <div class="pe-item-right">
            <xsl:if test="$TASK/REPORT/TEXT != ''">
              <ul class="pe-report-list">
                <li>
                  <input type="checkbox" name="{$TASK/REPORT/ID}" id="{$TASK/REPORT/ID}" />
                  <label for="{$TASK/REPORT/ID}"><xsl:value-of select="$TASK/REPORT/TEXT"/></label>
                </li>
              </ul>
            </xsl:if>

            <xsl:if test="count($TASK/ATTRS/ATTR[NAME='REPORT_DOC_NAME']/VALUES/VALUE) > 0">
              <ul class="pe-report-list">
                <xsl:for-each select="$TASK/ATTRS/ATTR[NAME='REPORT_DOC_NAME']/VALUES/VALUE">
                  <li>
                    <input type="checkbox" name="REPORT_DOC_NAME-{position()}" id="REPORT_DOC_NAME-{position()}" />
                    <label for="REPORT_DOC_NAME-{position()}"><xsl:value-of select="text()" disable-output-escaping="yes"/></label>
                  </li>
                </xsl:for-each>
              </ul>
            </xsl:if>

            <xsl:if test="count($TASK/ATTRS/ATTR[NAME='REPORT_OBJ_NAME']/VALUES/VALUE) > 0">
              <ul class="pe-report-list">
                <xsl:for-each select="$TASK/ATTRS/ATTR[NAME='REPORT_OBJ_NAME']/VALUES/VALUE">
                  <li>
                    <input type="checkbox" name="REPORT_OBJ_NAME-{position()}" id="REPORT_OBJ_NAME-{position()}" />
                    <label for="REPORT_OBJ_NAME-{position()}">
                      <img style="width: 12px; margin-right:5px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADgAAAAyCAMAAAA+w+hKAAAAM1BMVEUAAAB8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6RmPp9rAAAAEHRSTlMAQIC/78+fEGAw348gr1Bwcwx2KAAAAX5JREFUSMfF1tFygyAQBVCEBRTU3v//2rK7ZJwGMQMzbe9LJHIIkB3U/HLiIhl2G0HiR6EFuRJgGYZYy4ebgVjnILFs4bY8J8CGIh2+pBlf7sTHWFMk4W1zHbzjeJSQq5FuepkKZKn9SGd87VYs0PFaJFkaQdfIkOVSu19QHKNQOwee3lpwVKj3Wyjf08ZCZJBfZumjQHF3sDrtHNhpg4pkyPdTC4P1wGE1XnauNg6+dMg8LvcruTbH4nN4Pu51GU3NqkNnqwN6+xbHTmfG2c2PJIRaDdtYkS8iYkI2N5C2LjTHtYIGsuzCnQSepoW6qww7we2t638ch1o5M5BX8ghz7EFzPMAEpL0DAx7gbgnuFrKjDjy/mAJ7C+uZ04EkxGN5PuXaeF7JBuyj5+oKHJlwmDton07yDMhRMVLkms1artSxIr8yXOSaqSLX9It8CrKcgyZMwoApyI7GoRb57KP8T18e2M3BbG7g6T4lIenD32v7uFYwmKhyGc1u/iHfLV4giWgbeFwAAAAASUVORK5CYII=" alt=""/>
                      <xsl:value-of select="text()" disable-output-escaping="yes"/>
                    </label>
                  </li>
                </xsl:for-each>
              </ul>
            </xsl:if>

            <xsl:if test="count($TASK/REPORT/FILES/FILE) > 0">
              <ul class="pe-report-list">
                <xsl:for-each select="$TASK/REPORT/FILES/FILE">
                  <li>
                    <input type="checkbox" name="{ID}" id="{ID}" />
                    <label for="{ID}">
                      <xsl:element name="img">
                        <xsl:attribute name="style">width: 12px; margin-right:5px;position: relative;top: 1px;</xsl:attribute>
                         <xsl:choose>
                             <xsl:when test="contains(FILE_EXTENSION, 'image') or contains(FILE_EXTENSION, 'bmp') or contains(FILE_EXTENSION, 'jpg')  or contains(FILE_EXTENSION, 'gif')  or contains(FILE_EXTENSION, 'png')">
                                 <xsl:attribute name="src">/portal_static/img/mime/image.png</xsl:attribute>
                             </xsl:when>
                             <xsl:when test="contains(FILE_EXTENSION, 'xlsx') or contains(FILE_EXTENSION, 'xls')">
                                 <xsl:attribute name="src">/portal_static/img/mime/x_office_spreadsheet.png</xsl:attribute>
                             </xsl:when>
                             <xsl:when test="contains(FILE_EXTENSION, 'doc') or contains(FILE_EXTENSION, 'docx')">
                                 <xsl:attribute name="src">/portal_static/img/mime/document.png</xsl:attribute>
                             </xsl:when>
                             <xsl:when test="contains(FILE_EXTENSION, 'ppt') or contains(FILE_EXTENSION, 'pptx')">
                                 <xsl:attribute name="src">/portal_static/img/mime/image_x_eps.png</xsl:attribute>
                             </xsl:when>
                             <xsl:when test="contains(FILE_EXTENSION, 'rar')">
                                 <xsl:attribute name="src">/portal_static/img/mime/zip.png</xsl:attribute>
                             </xsl:when>
                             <xsl:when test="contains(FILE_EXTENSION, 'pdf')">
                                 <xsl:attribute name="src">/portal_static/img/mime/pdf.png</xsl:attribute>
                             </xsl:when>
                             <xsl:when test="contains(FILE_EXTENSION, 'zip')">
                                 <xsl:attribute name="src">/portal_static/img/mime/zip.png</xsl:attribute>
                             </xsl:when>
                             <xsl:when test="contains(FILE_EXTENSION, 'txt')">
                                 <xsl:attribute name="src">/portal_static/img/mime/text_plain.png</xsl:attribute>
                             </xsl:when>
                              <xsl:when test="contains(FILE_EXTENSION, 'xml')">
                                 <xsl:attribute name="src">/portal_static/img/mime/xml.png</xsl:attribute>
                             </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="src">/portal_static/img/mime/application_octet_stream.png</xsl:attribute>
                             </xsl:otherwise>
                         </xsl:choose>
                   </xsl:element>

                      <a class="pe-file-{FILE_EXTENSION}" href="/ugd/getFile.action?cardId={ID}">
                        <xsl:value-of select="FILE_NAME"/>
                      </a>
                      <small> - <xsl:value-of select="FILE_SIZE"/></small>
                    </label>
                  </li>
                </xsl:for-each>
              </ul>
            </xsl:if>

          </div>
          </xsl:if>
        </div>
      </div>
    </xsl:template>
</xsl:stylesheet>
