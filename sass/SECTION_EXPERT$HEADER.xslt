<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>
    <xsl:template match="/">
        <style>
            #headerContentArea {padding: 0;}
            #tabs-container {display: none;}

            .lk-header {
                position: relative;
                width: 100%;
                height: 185px;
                line-height: 185px;
                padding: 0 50px;
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
                margin: 0 56px 0;
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
                white-space: nowrap
            }
            .lk-header-link-appeals i {
                background-color: #6839AB;
                background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAMAAADW3miqAAAAbFBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8+T+BWAAAAI3RSTlMA7hH5Bm6Rcok4FebdycWbd2NPJQr16piEehnz0rGqWzseD7aDDEYAAADfSURBVDjLvZNZrsIwDACzNl3hlZb17cz974iIKmiVkPCBmC8nGsWOZYt3U3fckYWJSmsWlDFnQDs1xcppZEw64GYnx8Sygg41k85EKMUnIoWy1wpApPmAvKRCqQRoNvOrUJIAtGkJjuMRkpI/mmck8S5J5aT6RwKTBMhDRPqDhQRjJN0e+luOHvaxmswKXU1xpfmOF163NCcfnRq68cHvhh0r49+krR+2oNqy9ruxGxLN3Gj+1S/bKtnxHkCH8xRMK1YEklpa7stGxtfmF0GircqtVEGWUphCksKv+cu4AGDkLi6XbJK8AAAAAElFTkSuQmCC);
            }
            .lk-header-link-document-flow i {
                background-color: #EFC62E;
                background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkBAMAAAATLoWrAAAAG1BMVEUAAAD////////////////////////////////rTT7CAAAACHRSTlMAB5lcoXM4LDPtcR8AAABYSURBVCjPYyASsHYggAFEiANJqAEqBKKhTNKFEMYqYAo1QIQ4INaBmbiFoIAyIZJsZBQEAQE62ggF1BdCi1qoEBuSUAFcD1MHTCs+IRbMlMKMJKRAZBoEALBTYpUSvEgjAAAAAElFTkSuQmCC);
            }
            .lk-header-link-payment i {
                background-color: #E06953;
                background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAV1BMVEUAAAD8/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v38/v1ejuUOAAAAHHRSTlMA7hHmkW76BWtJtZQkCfXbiHdK9NPDpVpMPC0fMMv0eQAAAJ9JREFUOMvNktsKwyAQRHVXjebSJum9nf//zqKl9SG6KRRKzosIh2WZHfUdjdH7Lgx1wSCya31fETScpfvIQGUQYNN763R5EEDvba7nA5aDAJUZLq3LGy2EBPkTIto08dv7j5B5TMeojDECCGhlIPOKQBUh64AUQZUpCVQXKAlK4I9CYA6iwAD/JszMc1HYTA7ysdbPLRdGrpxc2lz7FZ6LNBvxQseM5gAAAABJRU5ErkJggg==);
            }
            .lk-header-link-reports i {
                background-color: #7CD88D;
                background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAMAAADW3miqAAAAhFBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8g2+bRAAAAK3RSTlMABfHrCXGkE53f2dM/Gfehf+jjvl1fST0mEHwepZVLpnVpaENBIM6MiG0xYxmF2QAAAPxJREFUOMvtkMlygzAQRI0kkISNwGATg5eQzVv///9lqmRHRAJu3Nw3qKfpmbeYLc2V82sziYiYgcLjaJzZaICpnEC9GUHqM8DbhioLDpzrAeReEdI1j81awqq7h+wPwDoW/e3WQLLvIfJiUN6Ed8SthLnI51fHoD8H7ok+NFhn3ypqsnOD/FCnelzOweKhSWSN/7mQCli++cxqCSjZ/5ECSdZHsgRIV97owthO12SKfyucdFJHuwrU6ZqqXXRK9NO7OMIq2HIgz2wT31oFOPoKZA6ww7shVk4o+EpBSb+nFYiiLFvxUjCfApdQwSJMoCBMqGA0TsF4nIK58gt5kyfWyzESWQAAAABJRU5ErkJggg==);
            }
            .lk-header-link-instruction i {
    background-color: #7CD88D;
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgBAMAAACBVGfHAAAAG1BMVEUAAAD////////////////////////////////rTT7CAAAACHRSTlMAB5lcoXM4LDPtcR8AAABTSURBVCjPY2DtQAADBiDgQBJoAAsASSjgIE0AZpwCukADUADEgDOxC0ABRQKEbWEUBAEBGtsCBdQTQIkosAAbkkABVD1TB0wTLgEW9PhmRhJQAAA8Y2KV+Uz3sgAAAABJRU5ErkJggg==);
}
            .lk-header-link-info i {
    background-color: #6839AB;
        background-color: #EFC62E;
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAb1BMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8v0wLRAAAAJHRSTlMA+IALB+z05+HPmJaHbFpWSCwPIiDmx8a6uT49I7+vQzXSrHUJLfp+AAABF0lEQVQ4y4WT63KCMBCFdwMhQLgJoqCgtj3v/4y1I2FJgeH7l5mTvZ4lISjtxTCbiy0DWnNOI8xE6Zl8wowB7lRRVYXqGeAs9L4nQJzX7lnnMZAsgpxasPLyBorRntxraKFv9I+bRjxM+RNoJ36p1xxWI/nUkQF3VwuD59R3IKM3DUPRxBPAkxzqo04Rh3O3I8ZQeo+REgURchK8XnJEAZXgmnaoGSVZdIukb75I6GDpKiXSN/4gQeFKGgUt8QQFDDGqfUEFPhQcppiKFFZFWvT7gh52NSjAH5SMWgT+qGVZIghkWf66f/Tk7Idbd+Mb5oGJUQwjlnOsLUeD2TZtO8xis2V7swjbbB1Oc3h6Po1/vPL96Px/AWepHkGudPdMAAAAAElFTkSuQmCC);
}
        </style>

        <div class="lk-header">
            <a class="lk-header-link lk-header-link-appeals" href="tabInfo.action?tab=SECTION_EXPERTIZA&amp;c=4&amp;b=7EDF6ECC25214253BCB3C9E155610D67&amp;a=2D98307046DF44668AE2E512AAD9985C#tab::id=0/tree::rel=4/filter::id=2D98307046DF44668AE2E512AAD9985C/vitrina::viewId=2D98307046DF44668AE2E512AAD9985C&amp;offset=0&amp;limit=100">
                <i></i>
                <span>Обращения</span>
            </a>
            <a class="lk-header-link lk-header-link-payment" href="tabInfo.action?tab=SECTION_EXPERTIZA&amp;c=19&amp;b=1D2C177C0D874FB6A6158C58A6BB6843&amp;a=5CB571F9DC1F400092F50291CFBA5FEA#tab::id=0/tree::rel=19/filter::id=5CB571F9DC1F400092F50291CFBA5FEA/vitrina::viewId=5CB571F9DC1F400092F50291CFBA5FEA&amp;offset=0&amp;limit=10">
                <i></i>
                <span>Оплата</span>
            </a>
            <!--a class="lk-header-link lk-header-link-document-flow" href="javascript:void();">
				        <i></i>
				        <span>Документооборот</span>
			      </a-->
                  <a class="lk-header-link lk-header-link-instruction" href="/portal/tabInfo.action?tab=SECTION_EXPERTIZA#tab::id=0/card::cardId=CARD_EXPERT_INSTRUCTION"><i></i>
                        <span>Инструкция</span></a>

                  <!--a class="lk-header-link lk-header-link-reports" href="javascript:void();">
                        <i></i>
                        <span>Отчеты</span>
                  </a-->
			      <a class="lk-header-link lk-header-link-info" href="/portal/tabInfo.action?tab=SECTION_EXPERTIZA#tab::id=0/card::cardId=CARD_EXPERT_TECH_HELP">
				        <i></i>
				        <span>Техподдержка</span>
			      </a>
        </div>
        <xml class="head" style="display: none"><xsl:copy-of select="*"/></xml>
    </xsl:template>
</xsl:stylesheet>
