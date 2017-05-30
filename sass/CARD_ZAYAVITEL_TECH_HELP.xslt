<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:layout="URN:html-form-layout:v0.1" xmlns="http://www.w3.org/1999/xhtml" xmlns:ex2="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLTExtension" xmlns:ctx="http://www.oracle.com/XSL/Transform/java/org.fx.xml.XSLDataContext" xmlns:gbu="http://xmlns.oracle.com/MSG_GBU_doc">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" undeclare-prefixes="yes" exclude-result-prefixes="#all"/>

    <xsl:template match="/">

        <XML>
          <xsl:copy-of select="."/>
        </XML>

        <style>
            div#headerContentArea {
                padding: 0;
            }
#headerContentArea {
    background: #fff;
    padding: 10px 0;
    border-left: 1px solid #D7D8DB;
    border-right: 1px solid #D7D8DB;
    border-bottom: 1px solid #D7D8DB;
    margin-top: -1px;
}
            #tabs-container {
                display: none;
            }
            .lk-header {
                position: relative;
                width: 100%;
                height: 185px;
                line-height: 185px;
                padding: 0;
                background: #0985c5;
                background: -moz-linear-gradient(top,  #0985c5 0%, #41b7dd 99%);
                background: -webkit-linear-gradient(top,  #0985c5 0%,#41b7dd 99%);
                background: linear-gradient(to bottom,  #0985c5 0%,#41b7dd 99%);
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0985c5', endColorstr='#41b7dd',GradientType=0 );
            }
            .lk-header-link {
                display: inline-block;
                vertical-align: middle;
                position: relative;
                line-height: 1.25;
                margin: 32px 56px 0;
                text-align: center;
                color: #fff;
                text-decoration: none;
            }
            .lk-header-link i {
                display: block;
                width: 90px;
                height: 90px;
                margin: 0 auto 6px;
                border-radius: 50%;
                background-repeat: no-repeat;
                background-position: center center;
            }
            .lk-header-link span {
                font-weight: bold;
                font-size: 19px;
                white-space: nowrap;
            }
            .lk-header-link-requests i {
                background-color: #E06953;
                background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyFpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpERjEyNUY4ODcwRjExMUU2OTRFMEY4Q0U4M0E1NDFGMCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpERjEyNUY4OTcwRjExMUU2OTRFMEY4Q0U4M0E1NDFGMCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkRGMTI1Rjg2NzBGMTExRTY5NEUwRjhDRTgzQTU0MUYwIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkRGMTI1Rjg3NzBGMTExRTY5NEUwRjhDRTgzQTU0MUYwIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+N92VfQAAAQNJREFUeNpi+P//PwMBnALEP/5TF2yAmc8IIvAAJyDeBcTMDNQHjGACjwN0gfgwEPOja6IQ/Ec2iwmHIhkg3oZmOU0ANgdwAfEmqCO+AfEJejoAFNfLgdgQiP8CcSQQn6enAyYDsR+UnQsNCbpFQSEQZ0LZL4FYHog7gNiClg5AzgXfgZiDmKxDq1xAyPJztAgBFhr5kqJsyDDqAChQAOJr0ERDCb4KxHLkOEAdiMWp4EkJINYgJhv+p1MiJKoyGk2EIOAGxF+okAi/QM0i2QG3gPgxFTz5GGrWaCIcvkUxocRKdiIkFhBKrKOJcLQ9MLgdwIInkdA9BHbS0d5tMAZAgAEA48XUP8atavQAAAAASUVORK5CYII=);
            }
            .lk-header-link-instruction i {
                background-color: #7CD88D;
                background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgBAMAAACBVGfHAAAAG1BMVEUAAAD////////////////////////////////rTT7CAAAACHRSTlMAB5lcoXM4LDPtcR8AAABTSURBVCjPY2DtQAADBiDgQBJoAAsASSjgIE0AZpwCukADUADEgDOxC0ABRQKEbWEUBAEBGtsCBdQTQIkosAAbkkABVD1TB0wTLgEW9PhmRhJQAAA8Y2KV+Uz3sgAAAABJRU5ErkJggg==);
            }
            .lk-header-link-payment i {
                background-color: #EFC62E;
                background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAV1BMVEUAAAD8/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v1ejuUOAAAAHHRSTlMA7hHmkW76BWtJtZQkCfXbiHdK9NPDpVpMPC0fMMv0eQAAAJ9JREFUOMvNktsKwyAQRHVXjebSJum9nf//zqKl9SG6KRRKzosIh2WZHfUdjdH7Lgx1wSCya31fETScpfvIQGUQYNN763R5EEDvba7nA5aDAJUZLq3LGy2EBPkTIto08dv7j5B5TMeojDECCGhlIPOKQBUh64AUQZUpCVQXKAlK4I9CYA6iwAD/JszMc1HYTA7ysdbPLRdGrpxc2lz7FZ6LNBvxQseM5gAAAABJRU5ErkJggg==);
            }
            .lk-header-link-info i {
                background-color: #6839AB;
                background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAb1BMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8v0wLRAAAAJHRSTlMA+IALB+z05+HPmJaHbFpWSCwPIiDmx8a6uT49I7+vQzXSrHUJLfp+AAABF0lEQVQ4y4WT63KCMBCFdwMhQLgJoqCgtj3v/4y1I2FJgeH7l5mTvZ4lISjtxTCbiy0DWnNOI8xE6Zl8wowB7lRRVYXqGeAs9L4nQJzX7lnnMZAsgpxasPLyBorRntxraKFv9I+bRjxM+RNoJ36p1xxWI/nUkQF3VwuD59R3IKM3DUPRxBPAkxzqo04Rh3O3I8ZQeo+REgURchK8XnJEAZXgmnaoGSVZdIukb75I6GDpKiXSN/4gQeFKGgUt8QQFDDGqfUEFPhQcppiKFFZFWvT7gh52NSjAH5SMWgT+qGVZIghkWf66f/Tk7Idbd+Mb5oGJUQwjlnOsLUeD2TZtO8xis2V7swjbbB1Oc3h6Po1/vPL96Px/AWepHkGudPdMAAAAAElFTkSuQmCC);
            }
            .TOP_MENU_element.ugdButton.TOP_MENU.getXslt.left.st_showMenu.MAIN{
                display: none;
            }
            body { background-color: #f0f0f0; margin: 0;     font-family: 'PTSans', Arial, sans-serif; }
h1 {
    color: #5f5f5f;
    text-shadow: 1px 1px 0px #fff;
    font-family: Arial;
    font-weight: bold;
    text-align: center;
    margin-top: 130px;
    font-size: 48px;
}

        </style>

<!--div id="headerContentArea">
     <div class="lk-header">
      <a class="lk-header-link lk-header-link-requests" href="/portal/tabInfo.action?tab=SECTION_ZAYAVITEL#tab::id=0/filter::id=E41F4951210C4470AB378DF57D2F1178/vitrina::viewId=E41F4951210C4470AB378DF57D2F1178&amp;offset=0&amp;limit=50">
       <i></i>
        <span>Заявки</span>
      </a>

      <a class="lk-header-link lk-header-link-instruction" href="/portal/getCardHtml.action?cardId=CARD_ZAYAVITEL_INSTRUCTION">
        <i></i>
        <span>Инструкция</span>
      </a>
      <a class="lk-header-link lk-header-link-info" href="/portal/getCardHtml.action?cardId=CARD_ZAYAVITEL_TECH_HELP">
        <i></i>
        <span>Тех. поддержка</span>
      </a>
    </div>

  </div-->

<h1>СТРАНИЦА В РАЗРАБОТКЕ</h1>


    </xsl:template>
</xsl:stylesheet>
