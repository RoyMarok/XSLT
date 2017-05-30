<style>
 body {background-color: #F7F7F7;}
 
#headerContentArea, #tabs-container {
    display: none;
}
div.headerWrap {
  z-index: 200;
}
.whiteBlock {
    background: #fff;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
}
.whiteBlock + .whiteBlock {
    margin-top: 14px;
}
#objCard .head-wrapper {
    background: #FAFBFC;
    border: 1px solid #ccc;
    padding: 15px;
    margin: 0;
    border-radius: 3px 3px 0 0;
}
#objCard .head-wrapper + .whiteBlock {
    margin-top: -1px;
    border-radius: 0 0 3px 3px;
}
div.envelope {
    max-width: none;
}
.cardProperty {
    font-size: 13px;
    padding: 5px 0;
}
.cardPropertyName {
    color: #7D8FA4;
}

#objCard .pdoc-right-side {
    width: 304px;
}
#objCard .pdoc-left-side {
    margin-right: 318px;
}
#objCard  .sectionTitle {
    color: #7D8FA4;
    position: relative;
    text-align: center;
    font-size: 13px;
    margin: 15px 0;
}
#objCard  .sectionTitle:before {
    display: block;
    content: '';
    border-top: 1px solid #E4E4E4;
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
}
#objCard  .sectionTitle span {
    position: relative;
    padding: 0 14px;
    background: #fff;
}
#reportText {
    width: 100%;
    border-color: #EBEBEB;
}
.buttonBlock {
    margin: 15px 0 0;
    position: relative;
}
.buttonBlock::before,
.buttonBlock::after {
  content: '';
  display: table;
  clear: both;
}
#objCard .pdoc-left-side .head-section .head-block {
    text-align: left;
}
 
/*   Карточка Задачи     */
      #cardProcessTask .formWrapper .tasks h2 {display:none} 
      #errorsTask {color:red; padding:0px 0}
      #cardProcessTask .formWrapper .line { padding-top: 8px; padding-bottom: 8px; }
      #cardProcessTask .formWrapper .line .inputWrap {font-size:12px}
      #cardProcessTask .formWrapper .pseudoA  {border-bottom: none!important}
      #cardProcessTask .formWrapper #attachments .chapterHeader .addFileButton .qq-upload-button, 
       #cardProcessTask  .formWrapper #attachments .chapterHeader .scanButton input {background-position: 10px center;}
      #cardProcessTask div.GreyLineDivider.GreyLineDivider2 {margin: 0;}
      #cardProcessTask .content .formWrapper {background-color:white}
      /*#cardProcessTask .formWrapper .ui-datepicker-trigger {width:32px; height:31px}*/
      #cardProcessTask .content .block_number_document {margin-bottom:10px}
      #bubbleItem .bubbleContainer {background:white; padding:10px}
      #cardProcessTask .attechment_header.correspondenceTable {margin-top:10px}
      #cardProcessTask  #autoformPlace .formWrapper{background-color: #fff; border:1px solid #e0e0e0; padding:15px 40px} 
      #cardProcessTask .reassignTaskAction   {margin-top: 20px}
        
      #cardProcessTask a {
        color: #4364c8;
        text-decoration: none;

      }
      #cardProcessTask a:hover {
        text-decoration: underline;
        color: #c00;
      }
      #cardProcessTask a[target="_blank"] {
        display: inline-block;
      }
      #cardProcessTask a[target="_blank"]::after {
        content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPBAMAAADJ+Ih5AAAAGFBMVEX///9fmezw8PA2eMihw/M5eMeiwvOnxO40va+0AAAAPklEQVQI12PAChIFBUXADAEGBkYII9QYymAAMxwFBZiZQQwhpYIAKEOZgQHCMCoUFAMzlBSBFDaGI9gCBAAAc7wGGRqx47YAAAAASUVORK5CYII=');
        display: inline-block;
        margin-left: 4px;
      }
      #cardProcessTask  .btn_menu {overflow: hidden;}

      #cardProcessTask  .reports_Menu {
        padding: 0 10px 0 27px;  
        text-align: center;  
        font-family: 'PTSans', arial;
        cursor: pointer; 
        margin: 12px 0 0 0;
        background: #fff;
        border: 0;
        color: #333;
        border: 1px solid transparent;
        height: 38px; 
        line-height: 36px; 
        font-size: 16px; 
        position: relative; 
        border-radius: 3px;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQBAMAAADt3eJSAAAAJFBMVEUAAAAzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzN41ygbAAAAC3RSTlMA8wTRs6uHPDa7k2iUBc8AAABCSURBVAjXY1i9GwQaGBg2cO9mYNgpDmVsCiyAMDaoSkAZTM5QBgM3kAHUBGYwgAAKgw1kYAJIDUhgA3EM791gsBkApAQm2ZecDSwAAAAASUVORK5CYII=');
        background-repeat: no-repeat;
        background-position: 10px 10px;
      }
      #cardProcessTask  .reports_Menu:hover {
        border-color: #999;
      }
      #cardProcessTask .reports_Menu.disabled {opacity:0.4; cursor:default!important}
      #cardProcessTask .btn_close .reports_Menu  {
        padding: 0 10px;
        height:38px; 
        margin-right: 20px;
        min-width:130px;
        cursor:pointer; 
        background: #319ADC; 
        border: 0;
        color:white; 
        text-shadow: 0 0 1px rgba(0, 0, 0, 0.5); 
        font-size: 16px;
        outline: none;
      }
      .assignResponsibleAction {
        display: block;
        margin-right: 75px;
      }
      .createReportAction {
        position: absolute;
        display: block;
        right: 0;
        top: 0;
      }
      .createReportAction .reports_Menu{
        margin: 0;
      }
      #cardProcessTask #readOnlyDocument {display:none}
      #cardProcessTask #editDocument {display:none; margin-top:20px}
      
      #cardProcessTask #reportText {
        font-size:12px;
        color: #7D8FA4;
        padding: 10px;
        font-size: 16px;
        opacity: .3;
        border: 1px solid #999;
      }

      #cardProcessTask #reportText:hover,
      #cardProcessTask #reportText:focus {
        outline: none;
        opacity: 1;
        border-color: #41a3e0;
      }
       #cardProcessTask .preview-wrapper {padding-bottom:0px}
       #cardProcessTask .key.objProcess {background:none!important; display: none}
       #cardProcessTask  .signIcon,  .preview-block .signIcon  { left: 25px;    position: absolute;    top: 30px;    width: 19px;}
       #cardProcessTask .formWrapper .formSpace,   #cardProcessTask  div[panel_id] {clear:none}
       
      #cardProcessTask  .formWrapper .docField, #cardProcessTask  .formWrapper .line {  padding: 8px 0 !important}
        
      .attechment_header.correspondenceTable {margin-top:10px;  border-collapse: collapse;   width: 100%;}
      table.correspondenceTable tr td, table.attechment_header th, table.instructionTasks tr td, table.instructionTasks tr th { border: 1px solid #E2E2E2!important; height: 30px;  color: #404040; font-weight: bold; font-size: 10pt;}
      table.correspondenceTable {margin-top: -1px}
      table.correspondenceTable tr td {padding: 5px 10px; text-align: left}
      table.correspondenceTable tr td a {font-weight: normal; text-decoration: none; color: #538DD5}
      div.content .size_8{font-size: 8pt !important;}

      /* autoForm conflicts fix */
      #globalWrapper form div[panel_id],   #globalWrapper form .formSpace {  clear: left;}
      
      #tabsContentArea {
        width: 1250px;
        margin: 0 auto;
      }
      .processUrl:hover {
        text-decoration: underline;
      }
      .process-executor {
        position: relative;
        display: inline-block;
        color: #4364c8;
        border-bottom: 1px dotted #4364c8;
        cursor: pointer;
        margin-left: 13px;
      }
      .process-executor:hover {
        color: #c00;
        border-bottom: 1px dotted #c00;
      }
      .process-executor::before {
        content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAFBAMAAACKv7BmAAAALVBMVEUAAAAzMzMyMjIyMjIzMzMzMzMyMjIzMzMzMzMyMjIyMjIyMjIyMjIzMzM1NTVYimMDAAAAD3RSTlMAj6twPCj78+/n49fDVBhNZvXwAAAAIUlEQVQI12PQZWDwYTBzYG1kYC59JcDAILmJgYGBUYEBADMgA9QLM5bRAAAAAElFTkSuQmCC');
        display: inline-block;
        position: absolute;
        left: -13px;
        top: -1px;
        opacity: .4;
      }

      /*gallery customize*/
      .gallery-controls {
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        background: #000;
        height: 48px;
        font-size: 14px;
        color: #fff;
        display: none;
        z-index: 999999999;
      }
      .gallery-controls-inner {
        width: 1200px;
        margin: 0 auto;
        display: table;
        height: 100%;
      }
      .gallery-controls-left {
        text-align: left;
        display: table-cell;
        vertical-align: middle;
        height: 100%;
      }
      .gallery-controls-right {
        text-align: right;
        display: table-cell;
        vertical-align: middle;
        height: 100%;
      }

      .gallery-controls-close {
        width: 16px;
        height: 16px;
        display: inline-block;
        cursor: pointer;
        font-size: 28px;
        margin-left: 34px;
        position: relative;
        top: -2px;
      }
      .gallery-controls-save {
        display: inline-block;
        width: 18px;
        height: 16px;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAQCAMAAAAs2N9uAAAAS1BMVEUAAAD////+/v7+/v7+/v7////////+/v7+/v7+/v7////////+/v7+/v7+/v7////////+/v7////+/v7+/v7+/v7+/v7+/v7////fSdJ7AAAAGHRSTlMAQJ778yAU59pwUgzTwbd4PDYoy6+rSCziZdg8AAAAZ0lEQVQY063LSw6AIAxF0VoRVPzi7+1/pdJAQ3DsGTU3fZRNgPNUQdT9kAIzS7qY95z2FmrUt1HbUKaNkdDGUmwmFl3ZRtjNmNunkyaI3obHzxCOkLh16JFoSr+MZanTvIIZdOLjeAFfVgymulBzTwAAAABJRU5ErkJggg==');
        background-repeat: no-repeat;
        background-position: center center;
        position: relative;
        top: -4px;
        opacity: .7;
        margin-left: 20px;
        cursor: pointer;
      }
      #downloadWithEP.gallery-controls-save::after {
        content: "";
        width: 13px;
        display: block;
        position: absolute;
        height: 15px;
        background-image: url('/portal_static/img/signIcon.png');
        background-repeat: no-repeat;
        background-size: 13px 15px;
        background-position: center center;
        bottom: -10px;
        right: 8px;
      }
      .gallery-controls-print {
        display: inline-block;
        width: 18px;
        height: 16px;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAQCAMAAAAs2N9uAAAAPFBMVEUAAAD////////////+/v7+/v7////+/v7+/v7+/v7////+/v7+/v7////////////+/v7+/v7+/v7///9uHEA4AAAAE3RSTlMAQCBg3euAWJ2HdnBcKAwE08OrfbLEeAAAAGRJREFUGNN1ztsOhCAMRdEDFPA2OjP7//9VI16QxPXU7KRNJc0/CkuLCscQdpH/ciZfBoOuSR3wuVPhcS/Jj3Uat80J6gSDvjykFMWTGaL1kprzKIe+Tn2Y9lezO+Tj+9m4RC+tS/cKG6Z8W7UAAAAASUVORK5CYII=');
        background-repeat: no-repeat;
        background-position: center center;
        position: relative;
        top: -4px;
        opacity: .7;
        margin-left: 20px;
        cursor: pointer;
      }
      .gallery-controls-checkEP {
        display: inline-block;
        width: 18px;
        height: 16px;
        background-image: url('/portal_static/img/signIcon.png');
        background-repeat: no-repeat;
        background-position: center center;
        position: relative;
        background-size: 18px;
        top: -4px;
        opacity: .7;
        margin-left: 20px;
        cursor: pointer;
      }
      .gallery-controls-checkEP:hover,
      .gallery-controls-print:hover,
      .gallery-controls-save:hover {
        opacity: 1;
      }
      .fancybox-lock .fancybox-overlay {
        overflow-y: hidden;
      }
      .fancybox-nav span {
        visibility: visible;
        background-image: none;
        color: red;
        top: 0;
        margin-top: 0;
        width: 100%;
        height: 100%;
      }
      .fancybox-nav span::before {
        content: '';
        position: absolute;
        top: 50%;
        margin-top: -18px;
        display: inline-block;
        width: 2em;
        height: 2em;
        border-right: 0.6em solid #999;
        border-top: 0.6em solid #999;
        transform: rotate(45deg);
      }
      .fancybox-nav span:hover::before {
        border-color: #fff;
      }
      .fancybox-prev span::before {
        transform: rotate(225deg);
        left: 20px;
      } 
      .fancybox-next span::before {
        right: 20px;
      }
      .fancybox-prev {
        left: -140px;
      }
      .fancybox-next {
        right: -140px;
      }
      .document-gallery-thumb {
        position: relative;
        display: inline-block;
        width: 103px;
        height: 136px;
        border: 1px solid #ebebeb;
        background-repeat: no-repeat;
        background-position: center center;
        -webkit-background-size: cover;
        background-size: cover;
        margin-left: 8px;
        margin-bottom: 8px;
        outline: none;
      }
      .document-gallery-thumb::before {
        content: '';
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background: rgba(0, 0, 0, .3) url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAPCAMAAADJev/pAAAAeFBMVEUAAAD+/v7+/v7+/v7+/v7+/v7+/v7+/v7////+/v7////////+/v7+/v7+/v7+/v7+/v7////+/v7////////+/v7+/v7////////////+/v7+/v7+/v7+/v7+/v7+/v7////+/v7////+/v7////+/v7+/v7///8XIa5CAAAAJ3RSTlMA3vv2u7GdlQzQgQTvy7+niEAcFQjmq3tFMSzXo49waGJcPDgQTCT5kH6MAAAAxElEQVQY003QV47DMAwEUFJWd6/xOmXT5/43DCHIQd4XKYigRpSNF9swN/Yw0K8/WyBTy5125UEB4H66IDlPlAwaRwf2q0ljpxrhTcIf4bzG2iskXEY1y6ZSIxIxni0yoitqTxGtjAWc9vWVtB0sceWlsvjSJFiRQyeFLNjdpP2HoanGNQ1nizSr4lEyzyqWOQvgJrlfFBuJLUAPkj4upuuJ5HnzgxJvodp7/hxXwIy0e2mgCsaECqhv9Gs7Nwxw4x754APRqxcSS1FsxAAAAABJRU5ErkJggg==')
 center center no-repeat;
        z-index: 200;
        opacity: 0;
        -webkit-transition: opacity .3s;
        -o-transition: opacity .3s;
        transition: opacity .3s;
      }
      .document-gallery-thumb:hover::before {
        opacity: 1;
      }


      #documentPages {
        position: fixed;
        left: 0;
        width: 100%;
        overflow: hidden;
        z-index: 8050;
        text-align: center;
      }

      #documentPages.bottom {
        bottom: 2px;
      }

      #documentPages.top {
        top: 2px;
      }

      #documentPages ul {
        position: relative;
        list-style: none;
        margin: 0;
        padding: 0;
      }

      #documentPages ul li {
        display: inline-block;
        position: relative;
        overflow: hidden;
        margin: 5px;
        opacity: 0.5;
        cursor: pointer;
        border: 1px solid transparent;
      }

      #documentPages ul li.active {
        opacity: 0.95;
        border-color: #222;
      }

      #documentPages ul li:hover {
        opacity: 1;
      }

      #documentPages ul li a {
        display: block;
        position: relative;
        overflow: hidden;
        border: 1px solid #222;
        background: #111;
        outline: none;
      }

      #documentPages ul li img {
        display: block;
        position: relative;
        border: 0;
        padding: 0;
        max-width: none;
      }

    /*header*/
    .head-section.bottom .head-block.middle .adress {
      margin: 0;
      font-size: 24px;
      color: #333;
    }
    .head-section.top .head-block.middle .appeal {
      color: #7d8fa4;
      font-size: 16px;
    }

    /*Document status*/
    #objCard .pdoc-left-side .head-section .head-block.state-block {
      text-align: right;
    }
    .state {
      display: inline-block;
      padding: 5px 10px;
      background-color: #80b766;
      color: #fff;
      border-radius: 3px;
      font-size: 11px;
    }

    /*Stages*/
    .process-stages {}
    .process-stages h2 {
      font-family: 'PTSans', arial;
      font-weight: normal;
      font-size: 18px;
      margin: 0 0 20px 0;
      color: #333;
    }
    .process-stages ul {
      list-style: none;
      margin-top: 0;
    }
    .process-stages li {
      position: relative;
      padding-bottom: 10px;
      margin-left: 18px;
      padding-left: 9px;
      font-size: 14px;
      color: #333;
    }
    .process-stages li::before {
      content: '';
      width: 8px;
      height: 8px;
      display: block;
      position: absolute;
      top: 1px;
      left: -18px;
      border-radius: 50%;
      background-color: #ccc;
      box-shadow: 0 0 0 2px #ccc;
      border: 4px solid #fff;
      z-index: 2;
    }
    .process-stages li::after {
      content: '';
      position: absolute;
      display: block;
      width: 2px;
      top: 0;
      bottom: 0;
      left: -11px;
      background: #ccc;
    }
    .process-stages li:last-child {
      padding-bottom: 0;
    }
    .process-stages li:last-child::after {
      display: none;
    }
    li.process-stages__PERFORMED::before {
      background-color: #80b766;
      box-shadow: 0 0 0 2px #80b766;
    }
    li.process-stages__PERFORMED::after {
      background: #80b766;
    }
    li.process-stages__IN_PROGRESS::before {
      box-shadow: 0 0 0 2px #1CB8E7;
      width: 16px;
      height: 16px;
      border: 0;
      background-color: #fff;
      background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAJCAMAAAA4jZ0cAAAAPFBMVEUAAAAEsuUFseQDsuUEsuUDseMDs+MEseUEsuUDs+UFr+QAreQAv/8DsuUEsuUDsuQDsuYEseMGsuUEsuXgV39+AAAAE3RSTlMAn2DBrUZA6beDMA4Ex6OTj3AohsT9EQAAADtJREFUCNclx0cWQBEUBNHmBfEH7H+v+nBHVVAJlAXtB40KvJGUY4siqKQUQPXrvRgjm7s/QFvHhN6QDURLAkV3FyeHAAAAAElFTkSuQmCC');
      background-position: center center;
      background-repeat: no-repeat;
    }
</style>