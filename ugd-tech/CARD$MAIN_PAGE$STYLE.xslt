<style>
/*========================== Стили дла ГЛАСНОЙ  страницы, закладка MAIN*/
 a, a:visited {color:#0070c0}
        hr {border:none; height:3px; margin-bottom:0px}
        hr.small {border:none; height:1px; margin-bottom:0px; background-color:#eaeaea; clear:both}
       
        .itemMenu {height:175px; width:295px;   text-align: center; background-color:#f3f3f3; background-position: center bottom; background-repeat: no-repeat;}       
        
        .bigBlock {float:left; margin-left:13px; cursor:pointer;}
        .bigBlock:hover {opacity:0.85}
        
        div.rightBlock #subSecondMenu ul li.nextMunu li{ float: none;  }
        div.rightBlock #subSecondMenu ul li.nextMunu li:hover {background: #f2f2f2 none repeat scroll 0 0;}
        
        .loadDataPageFirst .mainHeaderPage {margin-top:30px}
        
        .resources  {display:none; } 
           .resources .itemMenu h2 {text-align:center;margin-top:13px; padding-top:20px;  color: #363636;  font-family: "Roboto Regular","Roboto", arial;  font-size: 20px;  font-style: normal; font-weight: 400;}
        
          .resources h1 {font-size:30px; margin-bottom:20px; font-weight:normal; margin:0 0px 20px 0;  font-family: "Roboto Regular","Roboto", arial;}       
          .resources h2 {font-size:20px; line-height: 20px; font-weight:normal; padding-top:20px;  font-family: "Roboto Regular","Roboto", arial;}        
        
             .resources table.tabStyle tr {}
            .resources table.tabStyle tr:last-child {display:none}
            .resources table.tabStyle tr td {vertical-align:top; padding-bottom:15px; width:33%; padding-right:30px}
        
          div.resources ul { margin-top:30px; list-style-type: disc;font-size: 16px;  padding-left:17px; margin-left:-27px; margin-bottom:25px}
            .resources ul li { margin-bottom:16px;  color:#ccc; padding-left:10px}
              .resources ul li a {text-decoration:none;font-size:17px; color:#0070c0}
              .resources ul li span.count {color:gray; font-size:17px;   white-space: pre;}
              .resources ul li a:hover {color:#e11414}
          .resources  .col_30 {float:left; width:30%}       
          .resources.visible {display:block}
          
          .flex_box {   /*display: flex;   justify-content: space-between;*/ width:100%; float:left; margin-bottom:0px}
          .flex_block { /*flex-basis: 32%; */float: left; margin-right: 2%;  width: 32%;}
          .flex_block:last-child {margin-right:0}
        #MAIN .MAIN_tab {display:none}        
        
        .searchPanel {}
        .searchPanel input, .searchPanel .simpleSearchBtn{ height:44px; border:1px solid #d7d7d7}
        .searchPanel input:hover, .searchPanel .simpleSearchBtn:hover {border-color:#bcbcbc}
         .searchPanel input {padding:0 10px; color: color: rgb(27, 27, 27);    font-family: "Roboto Regular","Roboto", arial;   font-size: 17px;border-right-width: 0; width:100%}
         .searchPanel .simpleSearchBtn {text-align:center; line-height:44px; display:block;  color: rgb(27, 27, 27);   font-size: 16px; cursor: pointer;}
  
        .searchPanel input::-moz-placeholder     {color: rgb(201, 201, 201);} 
        .searchPanel input:-moz-placeholder      {color: rgb(201, 201, 201);} 
        .searchPanel input:-ms-input-placeholder {color: rgb(201, 201, 201);}    
        
 
      //  div.headerWrap {  background: rgb(255, 255, 255) none repeat scroll 0 0;   border-bottom-width: 0;  }
        div#secondMenu {display:none} 
         

/*=================== Стили для закладки ГЗК  - КАЛЕНДАРЬ===================*/

      #firstColPage table {width:100%}
      #firstColPage table tr td {width:14%; border:1px solid #efefef; vertical-align:top; color:#808080; padding:5px}
      #firstColPage table tbody tr td {font-size:13pt; height:130px; }
      #firstColPage table thead tr td {border-width:0px; font-size:10pt;  text-transform: lowercase; color:black; corsor:pointer}
      .mainHeaderPage {font-size: 20px; margin-bottom:30px}
      .titleCalendar {padding-right:20px}
      .currentMonth {color:rgb(107, 107, 107)}
      
      .mettingBlock {padding:5px; color:black; margin-bottom:10px; font-size:12pt}
      .gzkMeeting {background-color:#ffdf66; }
      .rgGdMitting {background-color:#67c1eb;}
      .cancelMeeting {background-color:#e11414;}
      
      .sliderControls {float:right}
      .sliderControls &gt; div{  background-color: rgb(255, 255, 255); border: 1px solid rgb(234, 234, 234);   cursor: pointer;   display: inline-block;}
      .sliderControls &gt; div &gt; b {   background-position: center center;   background-repeat: no-repeat; display: block;  height: 34px;    width: 43px;}
      .sliderNext b {   background-image: url("data:image/jpg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAf/AABEIAA0ACAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP6YvGfxS+LH/BPb9qvwb4b8T+PNc+Pv7M/7ZnxXn0zwf4P8Q+JItd+OvwN+KnizU4Wvx4RsL111Txn8FWvtQtFnsbXA8HRXdvEgg1dYh8RAD+bv4Nf8HQP/AASV8C/Hv4kftQfFX4d/8FFfjv8AHLxdq2r2HgXxZ4t+C/7MthY/Br4XPc3seg/D74daDZ/tWS6bos1vpF0bHxH4nsY7K+8QyS38otdP/tnxB/bQB//Z");}
      .sliderPrev b {  background-image: url("data:image/jpg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAf/AABEIAA0ACAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP6YfAHxU+Kn/BQ79qfxbpvhvx9rfwG/Zl/Y1+LUGmeJvAvh/wASQaJ8cPjp8UfCmoyNAPHVjpOpSal4O+DNtqWnTraWFypj8ZQwXduxuNWFwfh+AfzefF//AIOgf+CS3jX9oL4b/tS/Cv4ef8FF/gZ8bPCuq6Pp3xD8R+Ffg3+zbf6Z8a/hXbzQjWPh58Q/D9x+1lbaZqs9xYwQ2mh+KbuK81DQhb2L/Z76XRfDcuhAH//Z");
}
     #firstColPage   .mainTableGZRDmessage {    position: relative;  overflow:visible;    margin-left: 0px;  padding-left: 0;   padding-top: 0;      }
 
    .mainTableGZRDmessage &gt; li {
    background: rgba(0, 0, 0, 0) linear-gradient(to bottom, rgb(251, 251, 251) 0%, rgb(249, 249, 249) 25%, rgb(247, 247, 247) 37%, rgb(246, 246, 246) 48%, rgb(245, 245, 245) 56%, rgb(243, 243, 243) 64%, rgb(242, 242, 242) 99%) repeat scroll 0 0;   border-radius: 5px;   box-shadow: 1px 3px 5px rgb(128, 128, 128);   list-style: outside none none;   padding: 10px;  position: absolute;   right: -160px; white-space: nowrap;    font-size:10pt;
}
    .RGmainListMessage {    font-size: 18px;    margin: 10px 40px 10px 0;    color:black;    font-weight:bold;}
    .RGmainListMessage .red {color:#ff0000}
    .RGMainListLink {    font-size: 18px;    margin: 0 0 10px;}
    .RGMainListLink a:first-child {    margin-left: 0;}

    .RGMainListLink a {    margin-left: 20px;}
    .activTableGRtd   {    cursor: pointer;   }

    .backBox {bottom: 0; left: 0; position: fixed;  right: 0;   top: 0;    }
    .messageBox {display:none}
    td.weekend {background-color:#fbfbfb}
/* =========== Стили для вкладки ГЗК - Главная страница =================*/
 a.blockMainPageGZK, 
      a.blockMainPageGZK:visited {
        display: inline-block;
        height: 165px;
        width: 32%;
        margin-right: 2%;
        vertical-align: top;

        font-size: 17px;
        font-style: normal;
        font-weight: normal;
        color: rgb(65, 65, 65);
        text-align: center;
        cursor: pointer;
        text-decoration: none;
      }
      a.blockMainPageGZK:hover {
        color: #5D5D5D;
      }
      a.blockMainPageGZK:first-of-type,
      a.blockMainPageGZK:first-of-type:visited {
        background-color: #67C1EB;
        padding-top: 24px;
      }
      a.blockMainPageGZK:first-of-type:hover {
        background-color: #7DCAEE;
        padding-top: 24px;
      }
      .blockMainPageGZK:last-child {
        margin-right: 0;
      }
      .noSubpoena {
        background-color: #F4F4F4;
        color: rgb(161, 161, 161);
        padding-top: 60px;
      }
      .noSubpoena:hover {
        background-color: #F3F3F3;
        color: #AFAFAF;
      }
      .hasSubpoena {
        background-color: #FFDF66;
        padding-top: 18px;
      }
#ORG .orgs-legend {
    color: #737373;
    margin-top: -10px !important;
}
      
      .hasSubpoena:hover {
        background-color: #FFE37C;
      }
      .hasSubpoena&gt;div {
        margin-top: 15px;
      }
      .hasSubpoena&gt;div:nth-child(2){
        font-size: 28px;
      }
      .hasSubpoena.canceled&gt;div:last-child {
        color: #F00;
      }
</style>