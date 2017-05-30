<style>
body {
  background-color: #f7f7f7;
}
a:link, a {color: #235dc1;text-decoration: none;}
  .bold {font-weight:bold}
  #objCard a:hover {
    color: #c00;
    text-decoration: underline;
  }
  
  #tabsContentArea {
    overflow:visible;
    border: 1px solid #ccc;
    border-top: 0;
    padding: 20px;
    background: #fff;
    border-bottom-left-radius: 3px;
    border-bottom-right-radius: 3px;
  }
 /*===============================================================*/ 

 
   /* --------   Стили табов -------*/
  #tabCard  { border-bottom: 1px solid #e4e4e4;  overflow: hidden;   width: 100%; margin-bottom:10px}
  #tabCard  li {color: #1f7bb6;  float: left;   list-style: outside none none;   margin-right: 20px;    padding-bottom: 18px; cursor:pointer}
  #tabCard  li.active   {border-bottom: 1px solid;    color: black; font-weight:bold; cursor:default}
    
 /*===============================================================*/


  /* -------- Стили основного блока в карточки ------*/  
  #objCard {font-size: 14px;}
  
  /* clearfix */
  #objCard::before,
  #objCard::after {
  	content: '';
    display: table;
    clear: both;
  }
  
  #objCard .cat { height: auto;  margin-bottom: 5px;  overflow: hidden; display:table;}
  #objCard .key {  background: url("/portal_static/img/ps/pointCell.png") repeat-x scroll 0 bottom transparent;  border-bottom: medium none;   max-width: none; width: 400px; float:left; color: #7d8fa4; padding-right:5px; line-height: 17px; }
  #objCard .key > span {padding-right:5px; background-color:white}
  #objCard div.value {   float: none; line-height: inherit;  padding: 2px 0 3px 10px; overflow: hidden; display:table-cell}
  #objCard  hr {border:0 solid; border-top:1px solid #e4e4e4; margin:20px 0 ;  display:block}
  #objCard  .files_block {float:right; width:335px; padding-bottom:260px}
  #objCard  .files_block + .content_block {margin-right:453px;}
  #objCard  .files_block + .content_block .content {float:left;}

  /* #objCard.content-block,	
   #objCard .content-block {
    background: #fff;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;    
  }*/
   #objCard .pdoc-left-side  a[target="_blank"]::after {
	content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPBAMAAADJ+Ih5AAAAGFBMVEX///9fmezw8PA2eMihw/M5eMeiwvOnxO40va+0AAAAPklEQVQI12PAChIFBUXADAEGBkYII9QYymAAMxwFBZiZQQwhpYIAKEOZgQHCMCoUFAMzlBSBFDaGI9gCBAAAc7wGGRqx47YAAAAASUVORK5CYII=');
	display: inline-block;
    margin-left: 4px;
  }
    #objCard .sectionTitle {
    color: #2B2B2B;
    position: relative;
    text-align: left;
    font-size: 20px;
    margin: 15px 0;
  }
  #objCard .block .sectionTitle {
    cursor: pointer;
  }


  /*
  #objCard .sectionTitle::before {
    display: block;
    content: '';
    border-top: 1px solid #E4E4E4;
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
  }
  #objCard .block .sectionTitle::after {
    content: '';
    display: block;
    position: absolute;
    left: -15px;
    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAIAAAB1kpiRAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACASURBVHjaZEw7CgMhFDRaCIK9bCN4A73/FSx0K1dbexsRREwGLBLIFI/5vSHe+977+w9jDERUa51SmnOSH6y17vtWShEUa60xRljnb+8dQiilgFN0r+uSUj7PAw2JgFJqjAF/HQs35wxXCIEx5xxj7BsD2MRAa81ayzk/5keAAQBCGGUamY+cSQAAAABJRU5ErkJggg==");
  	background-repeat: no-repeat;
    background-position: center center;
    width: 10px;
    height: 6px;
    top: 50%;
    margin-top: -3px;
  }
*/


  #objCard  .block.close .sectionTitle::after {
    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAIAAAB1kpiRAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACGSURBVHjaZI4xCgMhEEVX8QBbW9goe/9zCCrY2MiChVvZiYiImtkkJIH8ZubPmz8MWmttT7XWjDH7vh/HgTF+Dd9ljGGtZYwRQrz3n8yNwTjnIEcp5ZzDagjhi8/znHMKIaBHCMHxnPN1XTePMUope+/rR/CH1jqltCmlaq3rT6UUQA8BBgAJcWT3t+GChAAAAABJRU5ErkJggg== ");
  }
  #objCard  .sectionTitle span {
    position: relative;
    padding: 0;
    background: #fff;
  }
  
  #objCard .pdoc-left-side,
  #objCard .pdoc-right-side {
    overflow: hidden;
  }

  #objCard .gray {color:rgb(128,128,128);font-weight:normal;}
  #objCard .common .value { padding: 2px 0 3px 0; font-size: 13px}
  /* --------   Стили таблиц в карточках -------*/
  
  #objCard  .tableCardStyle{ border-collapse: collapse; margin-bottom:20px; width:auto}
  #objCard  .tableFullWidth { width:100% }
  #objCard  .tableCardStyle thead th { font-size: .8em;  font-weight:bold; color:#565656; background:#f9fafb; height: 38px; }
  #objCard  .tableCardStyle th {padding:0 12px}
  #objCard  .tableCardStyle th, .tableCardStyle td {border: 1px solid #E2E2E2;  }
  #objCard .tableCardStyle td {padding:12px; vertical-align:top;}
  #objCard .tableCardStyle td span {padding-right:5px;}
 
 /*===============================================================*/ 
  


  /*  -------------------------Новые стили --------------------------  */
    .files_block {}
    .files_block .signatureName {margin-bottom:8px; line-height:18px}
    .files_block .signatureStatus {margin-bottom:14px; color:#565656}
    .files_block .signatureStatus.signTrue{color:#499f19; font-weight:bold}
    .files_block .signatureStatus.signFalse{color:red}
    .files_block .signatureButton {margin-bottom:25px;}
    .files_block .signatureButton a:link{color:black; margin-right:20px}
  /*===============================================================*/ 
      
  
  /* -----------------------Стили Отчет-витрина ------------------------------*/    
  
    .tableCardStyle{ border-collapse: collapse; margin-bottom:20px; width:auto; box-sizing: content-box;}
    .tableCardStyle th{ font-size: .8em;  font-weight:bold; color:#565656; background:#f9fafb; height: 38px; border: 1px solid #E2E2E2; padding:0 12px }
    .tableCardStyle td {padding:12px; vertical-align:top; border: 1px solid #E2E2E2;  }
    .tableCardStyle td span {padding-right:5px}
    
  
  
/*===============================================================*/ 
 
 
/*------------------------------ОТЧЕТ_ВИТРИНА -------------------------------------*/
  #analiticsView .tableCardStyle {width:100%}
  #analiticsView .tableCardStyle img.arrow {padding-right:5px}
  #analiticsView .tableCardStyle tr th {padding: 0 10px; font-size:9pt}
  #analiticsView .tableCardStyle tr.bold {font-weight:bold}
  #analiticsView .tableCardStyle tr td {text-align:right;}
  #analiticsView .tableCardStyle tr td.right {text-align:right}
  #analiticsView .tableCardStyle tr.item td {cursor:pointer; font-weight:bold;}
  #analiticsView .tableCardStyle tr td:first-child {text-align:left; padding-left:0px}
  #analiticsView .tableCardStyle tr.active td, #analiticsView .tableCardStyle tr.active.active_child td {background-color: #ffe989; }
  #analiticsView .tableCardStyle tr.active_child td {background-color: #ffffdd} 
  #analiticsView h1 {display: block !important; font-family: 'PTSans', Arial; font-size: 16pt;  margin-bottom: 40px;  padding: 0;  text-align: center;  }
          
  #analiticsView   .progressBar { background: #f2f2f2 none repeat scroll 0 0;  height: 20px;  min-width: 150px;   overflow: hidden;   width: 100%;}
  #analiticsView .progressBar .progressLine { background: #2f7195 none repeat scroll 0 0;   height: 100%;   width: 0;}
 /*===============================================================*/ 
 
  
 /*------------------------------Стили индикатора в формах /карточка -------------------------------------*/
  #overlayCard {  bottom: 0;  position: fixed;  top: 70px;  z-index: 2;}        
  div#loadingIndicatorCard {  height: 70px;  left: 50%;  margin-left: -35px;  position: fixed;  top: 30%;  width: 70px;    z-index: 105;}
  #loadingIndicatorCard {  left: 50%;  position: fixed;  text-align: center;  top: 0;   vertical-align: middle;   z-index: 10;}
  #loadingIndicatorCard img {   position: relative;   top: 40%;}
/*===============================================================*/ 


/*------------------------------Стили для подписи------------------------------*/ 
  div.checkWindow{ border: 1px solid #808080; width: 565px; position: fixed; top:20%;  background:white; z-index:9999; }
  div.checkWindow p{ font-family: 'PTSans', Arial; margin-top:1em; margin-bottom:1em;}
  div.checkWindow ._headBlock{ width: 525px; border-bottom: 2px solid #808080; font-size: 10pt; margin-left: auto;   margin-right: auto; }
  div.checkWindow .close_icon{ float: right; }
  div.checkWindow .close_icon img{ width: 18px;}
  div.checkWindow .signStatus{ margin-bottom: 23px;      }
  div.checkWindow .status{ margin-bottom: -8px; }
  div.checkWindow .contentBlock,
  div.checkWindow .signInfo,
  div.checkWindow .signStatus { width: 525px; margin-left: auto; margin-right: auto; }
  div.checkWindow p.info{ font-weight: bold; margin-left: 32px; font-size: 9pt;      }
  div.checkWindow ._headBlock p{ color: #808080;        }
  div.checkWindow .signStatus p.status{ color: #339933; font-weight: bold; font-family:Calibri, sans-serif !important; font-size: 16pt; margin-bottom: -8px;        }
  div.checkWindow label{font-size: 10pt;color: #808080;vertical-align: top;display:inline-block; width:217px;  overflow:hidden; white-space:nowrap;         }
  div.checkWindow span{font-size: 14px;        }
  div.checkWindow .status img{ height: 32px;  width: 32px;          }
  div.checkWindow p.status{ margin-bottom: -20px;        }
  div.checkWindow{  font-family: 'PTSans', Arial       }
  div.checkWindow .signInfo{  margin-left: 32px;   }
  div.checkWindow .btn{  text-align: center; margin-top: 10px; margin-bottom: 10px;      }
  div.checkWindow .field p{ display: inline-block; font-size: 10pt; width: 261px; text-align: left; margin-top: 0;          }
  .classname { -moz-box-shadow:inset 0px 1px 5px 0px #ffffff; -webkit-box-shadow:inset 0px 1px 5px 0px #ffffff;box-shadow:inset 0px 1px 5px 0px #ffffff;background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6) );  background:-moz-linear-gradient( center top, #ffffff 5%, #f6f6f6 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6'); background-color:#ffffff;-moz-border-radius:6px; -webkit-border-radius:6px; border-radius:6px;  border:1px solid #9ec7de;  display:inline-block;   color:#666666; font-family:'PTSans', arial;  font-size:15px;  font-weight:normal; padding:6px 28px; text-decoration:none; text-shadow:1px 1px 0px #ffffff;} 
  .classname:hover { background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff) );
  background:-moz-linear-gradient( center top, #f6f6f6 5%, #ffffff 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff'); background-color:#f6f6f6;}
  .classname:active { position:relative; top:1px; }
  div.preview-block > img { margin-right:11px; } 
 /*===============================================================*/ 
 
 
.printLink {
  border-bottom: 1px dashed #006699;
  color: #006699;
  margin-left: 25px;
  margin-bottom: 10px;
  display: inline-block;
  position: relative;
  text-decoration: none;
}
.printLink:hover {
  color: red;
  border-color: red;
}
.printLink::before {
    background-repeat: no-repeat;
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQAgMAAABinRfyAAAACVBMVEUAAAB9j6R9j6T06Ua4AAAAAnRSTlMAw3T+XjIAAAAvSURBVAjXY4CAVSsgBARIrVo1gUFr1YIFQGIVMqHBwAAkVq1YwCCxasUEhDaEXgBSkxXjyZbzcQAAAABJRU5ErkJggg==');
  	background-position:  center center;  
  	content: '';
    display: block;
    height: 20px;
    left: -25px;
    margin-top: -10px;
    position: absolute;
    top: 50%;
    width: 20px;
}

.nested-list li[data-leaf="1"]::before {
  content: url("/portal_static/img/indent.png");
  margin-right: 2px;
  margin-left: -18px;
}
.nested-list ul {
  list-style: none;
}
.nested-list li {
  display: block;
  margin-left: 18px;
}
.nested-list ul ul {
  margin-left: 20px;
  margin-top: 4px;
}
.nested-list-collapsable > ul {
  padding-left: 14px;
}
.nested-list-collapsable li[data-leaf="0"] > span {
  cursor: pointer;
  position: relative;
}
.nested-list-collapsable li[data-leaf="0"] ul {
  display: none;
}
.nested-list-collapsable li[data-leaf="0"] > span::before {
  content: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAIAAAB1kpiRAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACASURBVHjaZEw7CgMhFDRaCIK9bCN4A73/FSx0K1dbexsRREwGLBLIFI/5vSHe+977+w9jDERUa51SmnOSH6y17vtWShEUa60xRljnb+8dQiilgFN0r+uSUj7PAw2JgFJqjAF/HQs35wxXCIEx5xxj7BsD2MRAa81ayzk/5keAAQBCGGUamY+cSQAAAABJRU5ErkJggg==");
  position: absolute;
  left: -14px;
  top: -3px;
}
.nested-list-collapsable li.nested-list-expanded > span::before {
  content: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAIAAAB1kpiRAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACGSURBVHjaZI4xCgMhEEVX8QBbW9goe/9zCCrY2MiChVvZiYiImtkkJIH8ZubPmz8MWmttT7XWjDH7vh/HgTF+Dd9ljGGtZYwRQrz3n8yNwTjnIEcp5ZzDagjhi8/znHMKIaBHCMHxnPN1XTePMUope+/rR/CH1jqltCmlaq3rT6UUQA8BBgAJcWT3t+GChAAAAABJRU5ErkJggg== ");
}
.nested-list-collapsable li.nested-list-expanded ul {
  display: block;
}


.obj-passed {
  background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAAeCAYAAACxHzfjAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAJFJREFUeNpi/P//P8NgB0wMQwAw1vYvITUoGalg7/9hF5IsJIQQLRIvY1NBNE7JuglL/6M7kiZRRcuM85/ejgGFGizk8EX3oM04LDR0CEkAmDYZaRXdyOqIYZMV3UOuCCInuhlJZI9G92h0j0b3aHSPRvdodI9G92h0j0b3gEQ3Rd0NcqJ7yI9g0B0MiZAECDAATtl9ZTvbaUgAAAAASUVORK5CYII=');
  background-repeat: no-repeat;
  width: 41px;
  height: 30px;
  position: absolute;
  top: 50%;
  left: 20px;
  margin-top: -15px;
}
.obj-planned {
  background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAAeCAYAAACxHzfjAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAASNJREFUeNrcV1sSwjAILB1u6SW8gH54AT2EnhPtDMYayYMU2kZ+GpK0JcuypXC63mnYuSFfYccx0jh0YG8kh8vx8LN4vj1WpcIrBhBi+ASZsbWokASki3SPypOSox/S2xRkzFdLfxpL9SAWTs74dODhS8j9Lyc5HYFDln4p1d0giYq94Oz3g6SUfnednF7KFVylk5sgWSMxlkFCxCNQftdhro3cTIBp4ZS+IqV7ObDiM6R9NUGSMmXx/uC3ph6VsrMJf1ErB7sQc+7GgeUDEt05pA7g0c1jJsUQdy/KSibhXsqsJTmOCdEGQWjnc6UXUOaXgEyRXFBINUguCrLmQRZIkheSnpycz32N0Uk1WpEkaYxO2rgUSbG6yaJbMUYy2FOAAQBGcaxyMrlMXwAAAABJRU5ErkJggg==');
  background-repeat: no-repeat;
  width: 41px;
  height: 30px;
  position: absolute;
  top: 50%;
  left: 20px;
  margin-top: -15px;
}
.obj-inconstruction {
  background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAAeCAYAAACxHzfjAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAX5JREFUeNpirO1fwjAAgAmIVYDYAIgNoTQI3wDihqaC6IPIihnp4EguINZFc5A2EL8E4vNAfBGIL0GxHRBXA/EzZMeCHPmfREsZ8chJQB2hD8UgtgIQXwfiC0gY5LBPIA1Ah6AYUDdhKQuQikJ2LLUc+Z+WUcFCZAjR3CHEOpISwAj1BCOpGmHRDYzm/1A+I7ZchivU6BZyMAeiswk5clABFjJy8IAUqtSKbkZ6O5IcQHYaRs4spGQcRjwh8x8J7wdiqYEKSWKj2wGITwKx0UCkSUJpD4RFgfgwEMsA8SEgjqVVaUFOdMPAGyB2AeL5QMwNxIuA+C9aciCE6RLdv4A4CYjjgfjmYM/doFDUQIoBQni0MMenjhj2gLaCqNnY+IseeJRGNyOJbLJil4VAFUdsQ5iRSDaGfmDIoYttBVaNPsjNtsHUVPsNxGuBOJrauZvS6GZE74gN6twNilpsrfIR0zJnpJIarO3IIRuSxNYK/0mQJ6gWSxE0NEMSIMAAdbWIQLI/UbMAAAAASUVORK5CYII=');
  background-repeat: no-repeat;
  width: 41px;
  height: 30px;
  position: absolute;
  top: 50%;
  left: 20px;
  margin-top: -15px;
}

.obj-destroy {
  background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAAeCAYAAACxHzfjAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAARxJREFUeNpirO1fwkApaCqIZqAlYGIYAoAFiP+TqIeR3o4cMiFJbAj9HyhHDomQZMITav8HuyOHREgykpKL6yYsHY3uYRvd/5HwfiCWorUjGYF1938s5SQ+MXTwBIj9gfgcrep9cqIbFsqiQHwYiGWA+BAQx9Iq+VCSu98AsQsQzwdibiBeBMR/0ZIDIUyX3P0LiJOAOB6Ibw723A0KRQ2kGCCEyW5gDGhzjJbRjayOGDbFTbUBBcCqFeaRf+iBR2l0M5LIJit2WQg0cIltCDMSycbQj6VxshVYwPsgh+5gqrt/A/FaII6mdu6mNLoZKakW6Z67QVGLlHmGdm+R0uimqJ8OjHbGYdPvJrZW+E+CPEG1xPSPhkRIAgQYAHbQYc7LIXcBAAAAAElFTkSuQmCC');
  background-repeat: no-repeat;
  width: 41px;
  height: 30px;
  position: absolute;
  top: 50%;
  left: 20px;
  margin-top: -15px;
}

#objCard .block .obj-blockText {
  position: relative;
  padding: 10px 0px 10px 85px;
  border-bottom: 1px solid #f0f0f0;  
  border-top: 1px solid transparent;
  margin-left: -20px;
}
#objCard .block .obj-blockText:last-child {
  border-bottom: 1px solid transparent;
}
.obj-blockText:only-child {
  border-bottom: 1px solid transparent; 
}
#objCard .block .obj-blockText:hover {
  background-color: #f8f8f8;
  border-top: 1px solid #f0f0f0;
  border-bottom: 1px solid #f0f0f0;
}
#objCard .block .obj-blockText:hover .obj-passed {
  background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAAeCAYAAACxHzfjAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAJRJREFUeNpi/P//P8NgB0wMQwCw1E1YSmpQMlLB3v/DLyRhjKaCaLwKgSFOdcuJtZOF1lFFs4wD8gEtQo5QqOGyk4XaUUSsg8hKk9R2CDU9T1F0I6sjhk1udA+tIoic6EZWRwx7NLpHo3s0ukejezS6R6N7NLpHo3s0ugckuintbpAc3YMNMNb2Lxn0g0FDIiQBAgwA1ZLDpk2zjXgAAAAASUVORK5CYII=');
}
#objCard .block .obj-blockText:hover .obj-planned {
  background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAAeCAIAAAA+faC0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAALtJREFUeNpirO1fwjBAgAWImwqi6W9x3YSlTAwDB1hwOYrqNmGGLgvxSikMYUzBgQxzJoLuhTuZEjY5dtMWAPP3fwyAVZASgGkgUGQ0vkfjezS+B6IuwVqqE1PCk6R+UPqbmGoUWQ0Z1S4LHSrQQR/mwHAD+hhOEgwJSps3lBRhEL1oJmAVxKoXu7+RvQvh4koBEFm0ACA2PAbQ34xADPcT1pge8vEN5yIzUPxNlZbv4PU3enwPVNkCEGAAxqovUyRJKIkAAAAASUVORK5CYII=');
}
#objCard .block .obj-blockText:hover .obj-inconstruction {
  background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAAeCAYAAACxHzfjAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAZBJREFUeNpirO1fwjAAgAmIVYDYAIgNoTQI3wDihqaC6IPIihnp4EguINZFc5A2EL8E4vNAfBGIL0GxHRBXA/EzZMeCHPmfREsZ8chJQB2hD8UgtgIQXwfiC0gY5LBPIA1Ah6AYUDdhKQuQikJ2LLUc+Z+WUcECY6D7CB0AfcgwUICFSuYwQkOTkVSNsMABBsJ/KJ8RWy7DGmr0DDmYA9HZeB052AALvigYLICa0c1IV0eSCcguhpAzC7aMQ050IzvmABBHQwtdxsEa3Q5AfBKIjQZVOQkL5W/ffzIs33KI4eHTVzJA7iEgzgRikM/+DZrczcXJzpAQ5Mywad8phvNX73IDhRZBMdUzG0XRzczMxBDoasEQ5G7JICLIN7irRQNNJTAmoYYZLcxxqiOGPdCtIGo2Nv6iBx5F0Y2sjhg2ubHLgi9hE9sQBqkjho2t9kJPCmqK0gwx/g4o5g+a6GZmYmJQV5JhCAAWaVTN3ZRGN7H2DJrcjU/d8G+ZE6OOGmYNiZAkZ3BgcFSLgw0ABBgAppC3/bhQarkAAAAASUVORK5CYII=');
}
#objCard .block .obj-blockText:hover .obj-destroy {
  background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAAeCAYAAACxHzfjAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAARdJREFUeNpi/P//P8NgB0wMQwCw1E1YSmpQMlLTAU0F0cMkJIn1ETDER9MkyY4EhdpAhtzQTpOk5rjR6B4p0Y1c+B8AYpDiZ4M5uh2A+CQQG9E9JImpxr59/8mwfMshhodPX8kAuYeAOBOIQT77N2hyNxcnO0NCkDPDpn2nGM5fvcsNFFoExVRvB1AU3czMTAyBrhYMQe6WDCKCfIMnurEBA00lMCYWkFq8Df/CHFkdMewBjW5qAKTG9z/0wKMoupHVEcMmN3ZZ8CVsYhvCIHXEsLHVXuhJQU1RmiHG3wHF/EET3cxMTAzqSjIMAcAijaq5m9LoJtaeQZO78akb/i1zYtRRw6whEZKMtf1LBv1g0JAISYAAAwCiMI4WbBZBxAAAAABJRU5ErkJggg==');
}

#objCard .block .obj-name {
  font-size: 12px;
}

</style>








