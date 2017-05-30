<style>

  a:link, a {color: #235dc1;}
  .bold {font-weight:bold}

  #tabsContentArea {overflow:visible}
 /*===============================================================*/ 

 
   /* --------   Стили табов -------*/
  #tabCard  { border-bottom: 1px solid #e4e4e4;  overflow: hidden;   width: 100%; margin-bottom:10px}
  #tabCard  li {color: #1f7bb6;  float: left;   list-style: outside none none;   margin-right: 20px;    padding-bottom: 18px; cursor:pointer}
  #tabCard  li.active   {border-bottom: 1px solid;    color: black; font-weight:bold; cursor:default}

 /*===============================================================*/

  /* -------- Стили основного блока в карточки ------*/
  #objCard {font-size: 14px;}
  #objCard .cat { height: auto;  margin-bottom: 5px;  overflow: hidden; display:table;}
  #objCard .key {  background: url("/portal_static/img/ps/pointCell.png") repeat-x scroll 0 bottom transparent;  border-bottom: medium none;   max-width: none; width: 400px; float:left; color: #333; padding-right:5px; line-height: 17px; }
  #objCard .key > span {padding-right:5px; background-color:/*#ECEDF1*/#fff}
  #objCard div.value {   float: none; line-height: inherit;  padding: 2px 0 3px 10px; overflow: hidden; display:table-cell}
  #objCard  .sectionTitle { font-size: 20px; line-height:27px; margin-bottom:10px;  margin-top:19px; color: #333;display: inline-block;}
  #objCard  .block .sectionTitle {cursor:pointer;/*background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAIAAAB1kpiRAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACASURBVHjaZEw7CgMhFDRaCIK9bCN4A73/FSx0K1dbexsRREwGLBLIFI/5vSHe+977+w9jDERUa51SmnOSH6y17vtWShEUa60xRljnb+8dQiilgFN0r+uSUj7PAw2JgFJqjAF/HQs35wxXCIEx5xxj7BsD2MRAa81ayzk/5keAAQBCGGUamY+cSQAAAABJRU5ErkJggg==") no-repeat scroll left 5px rgba(0, 0, 0, 0);margin-left: -20px;   padding-left: 20px;*/}
  #objCard  .block.close .sectionTitle {background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAIAAAB1kpiRAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACGSURBVHjaZI4xCgMhEEVX8QBbW9goe/9zCCrY2MiChVvZiYiImtkkJIH8ZubPmz8MWmttT7XWjDH7vh/HgTF+Dd9ljGGtZYwRQrz3n8yNwTjnIEcp5ZzDagjhi8/znHMKIaBHCMHxnPN1XTePMUope+/rR/CH1jqltCmlaq3rT6UUQA8BBgAJcWT3t+GChAAAAABJRU5ErkJggg== ") no-repeat scroll left 5px rgba(0, 0, 0, 0);}
  #objCard  .block.close .cat,  #objCard  .block.close table {display: none;}
  #objCard  hr {border:0 solid; border-top:1px solid #e4e4e4; margin:20px 0 ;  display:block}
  #objCard  .files_block {float:right; width:300px; padding-bottom:230px}
  #objCard  .files_block + .content_block {margin-right:320px;}
  #objCard  .files_block + .content_block .content {float:left;}

  #objCard .gray {color:/*rgb(128,128,128)*/#7D8FA4;font-weight:normal;}
  #objCard .common .value { padding: 2px 0 3px 0; font-size: 13px}
  /* --------   Стили таблиц в карточках -------*/
  
  #objCard  .tableCardStyle{ border-collapse: collapse; margin-bottom:20px; width:auto; min-width: 800px}
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
  position: relative;
  text-decoration: none;
}
.printLink:hover {
  color: red;
  border-color: red;
}
.printLink::before {
    background: url('/ugd/img/ps/print.png') center center no-repeat;
    content: '';
    display: block;
    height: 20px;
    left: -25px;
    margin-top: -10px;
    position: absolute;
    top: 50%;
    width: 20px;
}
#objCard .text-bold {
  font-weight: bold;
}
#objCard .table-block {
  margin-bottom: 20px;
}
#objCard  td .table-block:last-child {
  margin-bottom: 0;
}
#objCard .table-block .cat {
  display: block;
  margin-bottom: 0;
}
#objCard .table-block .key {
  background: none;
  float: none;
  display: inline;
  font-weight: bold;
  padding-right: 0;
  width: auto;
  color: inherit;
}
#objCard .table-block .value {
  padding: 0;
  display: inline;
}
.cardWrapper {
    background: #fff;
    margin: 15px;
    padding: 20px 30px;
    border: 1px solid #D7D8DB;
    border-radius: 5px;
}
.card-history {
  table-layout: fixed;
  font-size: 12px; 
  border-top: 1px dashed #ccc;
}
.card-history td {
  padding: 10px 0 0;
}
</style>