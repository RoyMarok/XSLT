<style type="text/css">
  /*   -------- Стили для галереи ------------*/

    .gallery-right {  width: 300px; margin-bottom:20px; }
      
      .gallery-right .main-image {  display: block;  width: 100%; border: 1px solid #e9e9e9;}
        .gallery-right .main-image img { width: 298px; border: 1px solid #e9e9e9;}
      
      .gallery-right .other-images {  width: 100%;   height: 200px;   overflow-x: auto; margin-bottom:35px}
        .gallery-right .other-images .wrp-images { width: auto; height: 150px; margin-top: 19px; overflow: hidden;}
          .gallery-right .other-images .wrp-images a.link-image { width: 113px; height: 146px; border: 1px solid #e9e9e9; float: left;}
          .gallery-right .other-images .wrp-images a.link-image + a.link-image {  margin-left: 11px;}
          .gallery-right .other-images .wrp-images a.link-image img {  width: 111px;  height: 144px;}
          
      .baloon-arrow { border-color: rgba(0, 0, 0, 0) rgba(0, 0, 0, 0) #DEDEDE; border-style: solid; border-width: 0 10px 10px;  left: 20%;  margin-top: -15px; position: absolute;}
      .sub-arrow { border-color: rgba(0, 0, 0, 0) rgba(0, 0, 0, 0) #F7F7F7; border-style: solid;  border-width: 0 9px 8px;  margin-right: 0;margin-top: 2px;  position: absolute; right: -9px;}
      .p-doc-scroller {  overflow: hidden;}

      .button-baloon-block { clear: both; margin-bottom: 7px; margin-top: 5px;}
        .button-baloon-block span.singleButton a { color: #595959; text-decoration: none;}
        .baloon-wrapp div.preview-block {border-radius: 5px; margin-bottom: 5px; position: relative;}

      .gallery-images {height: 155px; overflow-x: auto; overflow-y: hidden; white-space: nowrap; width: 100%;}
      
      .thumb-image { border: 1px solid #E8E8E8; display: inline-block;  margin-right: 7px;}
        div.baloon-wrapp .thumb-image img {  height: 119px;   width: 84px;}

      .document div.baloon-wrapp { width:300px;}
        .document .preview-block img {height:20px; }
        .document .prew-description-block {float:left;}
        .document .baloon-wrapp { margin-top:33px; }
        .document .preview-block {min-height:100%; cursor: pointer;}
        
      .preview-wrapper .pr-desc-name p{ margin:0; font-size:10.5pt; border-top:0px; border-bottom: 0; padding:0}
        
      
      .preview-wrapper .singleButton {border-radius:0px; padding:0px 12px 0; box-shadow:1px 1px 0px rgba(0, 0, 0, 0.05); height:34px; border-width:1px; border-color: #e8e8e8 #dedede #d4d4d4;border-style: solid;;
                       background-image: linear-gradient(270deg, white, #f9f9f9);
                       background-image: -o-linear-gradient(top, white, #f9f9f9);
                       background-image: -ms-linear-gradient(top, white, #f9f9f9);
                       background-image: -moz-linear-gradient(top, white, #f9f9f9);
                       background-image: -webkit-linear-gradient(top, white, #f9f9f9);
                       background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(100%, #f9f9f9));
                      margin-right:-1px;    line-height: 34px;}
         .preview-wrapper .singleButton:hover { background:white}
         .preview-wrapper .singleButton:first-child{border-radius:3px 0 0 3px;}
         .preview-wrapper .singleButton:last-child{border-radius:0 3px 3px 0; margin-right:0}
         .preview-wrapper .singleButton + .singleButton {border-left-width: 1px;}
         
      .preview-block { margin-bottom: 0; min-height: 35px;  border-radius: 5px; position: relative; width: 100%; cursor:pointer;}
        div.preview-block > img {  margin-left: -4px;  margin-right: 7px;  float: left;    position: relative;}

      .prew-description-block {margin: 5px 0 15px; width:260px;  position: relative;}
       .pr-desc-name p {line-height: 1.8em;}
      .pr-desc-name p span.fileSize {border: medium none; color: rgb(136, 136, 136);  font-size: 10px;} 

      
      .baloon-wrapp { padding: 5px 10px; background: none repeat scroll 0 0 #F7F7F7; border: 1px solid #DEDEDE;  border-radius: 5px;  box-shadow: 1px 1px 5px 0 #CCCCCC;
                       display: none; position: absolute;   width: 301px; z-index: 10;}
                       
      .button-baloon-block span.singleButton .printFile img {margin-top:-3px}
      
      .pr-desc-name span {  border-bottom: 1px dashed rgb(68, 68, 68);}
      
      
    .button-baloon-block  .singleButton { background-image: -moz-linear-gradient(center top , #ffffff, #f9f9f9);  border-color: #e8e8e8 #dedede #d4d4d4;
    border-radius: 3px;    border-style: solid;   border-width: 1px;  color: #595959;  cursor: pointer;   display: inline-block;    height: 35px;
    line-height: 34px;    margin: 0;        position: relative;    vertical-align: middle;}
   
     .button-baloon-block  .singleButton img{  margin-bottom: -3px;    margin-right: 5px;}
      .preview-block .signIcon { left: 25px;   position: absolute;    top: 30px;    width: 19px;}
 /*===============================================================*/ 
 </style>