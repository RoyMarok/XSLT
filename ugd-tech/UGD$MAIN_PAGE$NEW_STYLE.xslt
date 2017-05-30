 <style>
            #headerPage > div#headerButtons{
              height:1px;
              width:1px;
            }
            body{
              overflow-x:hidden;
            }
            
            a.inactive{
              color:#A6A6A6 !important;
              text-decoration:none !important;
              cursor:default;
            }
             #messageInfo{
              font-size: 14px;
              padding: 10px 10px;
              margin-bottom: 15px;
              background: rgba(246,246,224,1);
              line-height: 23px;
              text-align:center;
            }
            #messageInfo .closeInfo{
                float: right;
                font-size: 14px;
                font-family: cursive;
                font-weight: bold;
                margin-left: 20px;
                color:#737373;
                cursor:pointer;
            }
            
            
            body, .tabInfoView{
              background: #fff; /*rgba(250,250,250,1);*/
            }
 
            .documents div .noActiveLink {
                color: #CACAC9;
            }

            .red {
                color: #FF0000;
                font-size: 13px;
                font-weight: bold;
                padding-left: 5px;
            }

            body div.rightBlock {
                padding: 0;
                /*background: white;
                position:relative;*/
            }

            div.rightBlock ul {
                list-style: none;
                overflow: hidden;
            }

            div#subSecondMenu {
                line-height: 38px; 
                background:white;
                cursor:pointer;
            }
            div.rightBlock #subSecondMenu ul li:hover a{  
              color:#AEAEAE;
            }
            div.rightBlock #subSecondMenu ul li {
                float: left;
                margin-right: 25px;
                line-height:58px;
               font-size: 15px;
            }

            div.rightBlock #subSecondMenu ul li.active {
                color:#000000;
            }

            div.rightBlock #subSecondMenu ul li.active a {
                color: #000000;                
            }

            div.rightBlock #subSecondMenu ul li a {
                color: #737373;
              font-size:15px
            }
   
   
      div.rightBlock #subSecondMenu ul li.nextMunu {border-bottom:2px solid white;  color: #737373;}
        div.rightBlock #subSecondMenu ul li.nextMunu.active {  color:black}
       div.rightBlock #subSecondMenu ul li.nextMunu.active a { color: #737373;}
       div.rightBlock #subSecondMenu ul li.nextMunu.active:hover { /*background: #f2f2f2 none repeat scroll 0 0;*/}
       div.rightBlock #subSecondMenu ul li.nextMunu .activeSubMenu a {color:black}
        div.rightBlock #subSecondMenu ul li.nextMunu.showMenu ul {display:block;z-index: 2;}
        
       div.rightBlock #subSecondMenu ul.subSecondMenu {margin-left: -10px;  padding: 0 10px; position: absolute; display:none; overflow:visible;
          background: #fff none repeat scroll 0 0;  border: 1px solid #c8c8c8;    box-shadow: 0 3px 5px 0 rgba(0, 0, 0, 0.2);padding: 8px 0 11px;}
       div.rightBlock #subSecondMenu ul.subSecondMenu li{line-height:20px; padding:7px 10px; margin:0px }
   
   
   
   div#subSecondMenu .arrow::after {
    border-color: transparent transparent #fff;
    border-style: solid;
    border-width: 0 10px 10px;
    content: " ";
    display: block;
    height: 0;
    margin-left: -10px;
    position: absolute;
    top: 1px;
    width: 0;
}
div#subSecondMenu .arrow {
    border-color: transparent transparent #c8c8c8;
    border-style: solid;
    border-width: 0 11px 11px;
    display: block;
    height: 0;
    left: 50px;
    line-height: normal;
    margin-left: -11px;
    margin-top: -19px;
    position: absolute;
    width: 0;
}
   
        div.resources {border:0px solid}
        div.rightBlock #subSecondMenu ul li.nextMunu ul li {}
        

            div.resources {
                                      
                padding-top: 17px;
                background:white;
            }

            div.resources .rcolumn {
                float: left;
                /*margin-right: 50px;*/
                width: 25%;
            }

            div#indicators {
                border-bottom: 1px solid #e9e9e9;
                padding: 30px 40px;
                background:white;

            }

            div#indicators table {
                width: 100%;
            }

            div.rcolumn ul li a {
                text-decoration: underline;
                color: rgba(0, 112, 192, 1);
            }
            div.rcolumn ul li a:visited{
              color: #7030a0;
            }
            div.rcolumn ul li a:hover{
              color:red;
            }
            div.rcolumn h3.listHeader {
                font-weight: bold;
                font-size: 15px;
                margin-bottom: 7px;
            }

            div.rcolumn ul li {
                line-height: 25px;
            }

            div.rcolumn ul {
                margin-bottom: 20px;
            }

            div#indicators td {
                padding: 0 5px;
                width: 25%;
                min-width: 186px;
            }

            div#indicators td div {
                color: white;
                padding: 3px 5px;
            }

            div#indicators td div img {
                width: 41px;
                margin-left: 11px;
                margin-top: 2px;
            }

            div#indicators td div div {
                font-weight: bold;
            }

            div#indicators td div.counts {
                float: right;
                text-align: right;
                margin-top: 5px;
            }

            div#indicators td div.counts span.big {
                font-size: 23px;
                font-weight: normal;
            }

            div#indicators td div.counts span.small {
                font-size: 11px;
                font-weight: normal;
            }

            div#graphs {
                padding: 30px 40px;
            }

            div#graphs > table {
                width: 100%;
            }

            div#graphs > table td {
                width: 25%;
                padding: 0 10px;
                min-width:230px;
            }

            div#graphs table td div.graphContainer {
                height: 165px;
                background: white;
                border: 1px solid #e9e9e9;
                padding: 10px 15px;
            }

            div#graphs table td div.graphContainer span.graphCounts {
                float: right;
            }

            div.placeholder1 {
                height: 130px !important;
                /*width: 185px;*/
                margin-left: auto;
                margin-right: auto;
            }

            div.graphsHeader {
                margin-bottom: 15px;
            }

            div.graphsHeader div.graphControls {
                float: right;
            }

            div.graphsHeader div.graphControls span {
                margin-right: 15px;
                color:rgba(166,166,166,1);
                cursor:pointer;
            }
            div.graphsHeader div.graphControls span.active{
              color:#404040;
            }
            div.gheader span.graphName {
                color: rgba(166, 166, 166, 1);
                font-size: 14px;
                font-family: 'PTSans', Roboto;
            }

            div.gheader {
                height: 32px;
            }

            div.gheader span.graphCounts {
                font-size: 23px;
                font-family:'PTSans', Roboto;
                font-weight:300;
            }

            

            div.flot-y-axis {
                display: none !important;
            }

            div#today {
                float: left;
                text-align: center;
                overflow: hidden;
            }

            div#today ul {
                text-align: left;
            }

            div#today ul li {
                margin-bottom: 7px;
                padding-left: 40px;
            }

            div#today ul li span.time {
                display: inline-block;
                margin-right: 10px;
                width: 30px;
                color: rgba(166, 166, 166, 1);
            }

            div#today h3.todayTitle {
                color: rgba(16, 130, 62, 1);
                font-size: 19px;
                margin-bottom: 5px;
                margin-left:40px;
            }
            #photomonitor{
              padding:0 40px;
            }
 /*----------------------------bxSlider------------------------------------*/
/**
 * BxSlider v4.1.2 - Fully loaded, responsive content slider
 * http://bxslider.com
 *
 * Written by: Steven Wanderski, 2014
 * http://stevenwanderski.com
 * (while drinking Belgian ales and listening to jazz)
 *
 * CEO and founder of bxCreative, LTD
 * http://bxcreative.com
 */


/** RESET AND LAYOUT
===================================*/

.bx-wrapper {
  position: relative;
  margin: 0 0 48px;
  padding: 0;
  *zoom: 1;
}

.bx-wrapper img {
  max-width: 100%;
  display: block;
}

/** THEME
===================================*/

.bx-wrapper .bx-viewport {  
  
  /*fix other elements on the page moving (on Chrome)*/
  -webkit-transform: translatez(0);
  -moz-transform: translatez(0);
      -ms-transform: translatez(0);
      -o-transform: translatez(0);
      transform: translatez(0);
}

.bx-wrapper .bx-pager,
.bx-wrapper .bx-controls-auto {
  position: absolute;
  bottom: -30px;
  width: 100%;
}

/* LOADER */

.bx-wrapper .bx-loading {
  min-height: 50px;
  background: url(/portal_static/img/loading.gif) center center no-repeat #fff;
  height: 100%;
  width: 100%;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 2000;
}

/* PAGER */

.bx-wrapper .bx-pager {
  text-align: center;
  font-size: .85em;
  font-family: 'PTSans', Arial, sans-serif;
  font-weight: bold;
  color: #666;
  bottom: -40px;
}

.bx-wrapper .bx-pager .bx-pager-item,
.bx-wrapper .bx-controls-auto .bx-controls-auto-item {
  display: inline-block;
  *zoom: 1;
  *display: inline;
}

.bx-wrapper .bx-pager.bx-default-pager a {
  background: url("/portal_static/img/controls_page.png") repeat scroll -15px 0 rgba(0, 0, 0, 0);
  text-indent: -9999px;
  display: block;
  width: 12px;
  height: 12px;
  margin: 0 2px;
  outline: 0;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  border-radius: 5px;
}

.bx-wrapper .bx-pager.bx-default-pager a:hover,
.bx-wrapper .bx-pager.bx-default-pager a.active {
  background: url("/portal_static/img/controls_page.png") repeat scroll 0 0 rgba(0, 0, 0, 0)
}

/* DIRECTION CONTROLS (NEXT / PREV) */

.bx-wrapper .bx-prev {  
  background: url(/portal_static/img/controls.png) no-repeat 0 0px;
  left:0;
}

.bx-wrapper .bx-next {  
  background: url(/portal_static/img/controls.png) no-repeat 0px -35px;
  right:0
}

.bx-wrapper .bx-prev:hover {
  background-position: 0 0;
}

.bx-wrapper .bx-next:hover {
  background-position: 0px -35px;
}

.bx-wrapper .bx-controls-direction a {
  position: absolute;  
  margin-top: 15px;
  outline: 0;
  width: 40px;
  height: 34px;
  text-indent: -9999px;
  z-index: 0;
}

.bx-wrapper .bx-controls-direction a.disabled {
  display: none;
}

/* AUTO CONTROLS (START / STOP) */

.bx-wrapper .bx-controls-auto {
  text-align: center;
}

.bx-wrapper .bx-controls-auto .bx-start {
  display: block;
  text-indent: -9999px;
  width: 10px;
  height: 11px;
  outline: 0;
  background: url(/portal_static/img/controls.png) 0px 0px no-repeat;
  margin: 0 3px;
}

.bx-wrapper .bx-controls-auto .bx-start:hover,
.bx-wrapper .bx-controls-auto .bx-start.active {
  background-position: -86px 0;
}

.bx-wrapper .bx-controls-auto .bx-stop {
  display: block;
  text-indent: -9999px;
  width: 9px;
  height: 11px;
  outline: 0;
  background: url(/portal_static/img/controls.png) 0px -35px no-repeat;
  margin: 0 3px;
}

.bx-wrapper .bx-controls-auto .bx-stop:hover,
.bx-wrapper .bx-controls-auto .bx-stop.active {
  background-position: -86px -33px;
}

/* PAGER WITH AUTO-CONTROLS HYBRID LAYOUT */

.bx-wrapper .bx-controls.bx-has-controls-auto.bx-has-pager .bx-pager {
  text-align: left;
  width: 80%;
}

.bx-wrapper .bx-controls.bx-has-controls-auto.bx-has-pager .bx-controls-auto {
  right: 0;
  width: 35px;
}

/* IMAGE CAPTIONS */

.bx-wrapper .bx-caption {
  position: absolute;
  bottom: 0;
  left: 0;
  background: #666\9;
  background: rgba(80, 80, 80, 0.75);
  width: 100%;
}

.bx-wrapper .bx-caption span {
  color: #fff;
  font-family: 'PTSans', Arial;
  display: block;
  font-size: .85em;
  padding: 10px;
}

.bx-wrapper li:hover .tooltip {display:block}
.bx-wrapper li .tooltip
{
    background: none repeat scroll 0 0 #FFFFFF;  
    border-radius: 5px;
    box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.8);
    left: 5px;
    opacity: 0.8;
    padding: 5px;
    position: absolute;
    top: 5px;
    display:none;
    font-size:8.5pt;
    text-alight:center;
    max-width:135px;
    max-height:100px;
}
.bx-wrapper li .tooltip h3
{
   font-weight: bold;
    line-height: 1em;
    margin-bottom: 3px;
    max-height: 45px;
    overflow: hidden;
    font-size:8.5pt;
    margin:0;
  }
.bx-wrapper li .tooltip .date
{ text-align:right}

.bx-wrapper li .tooltip .address {
   line-height: 1em;
    max-height: 33px;
    overflow: hidden;
    }
.bx-wrapper li {overflow:hidden; height:140px!important; margin-right:7px !important;}
.bx-wrapper li img.imgObj{  min-width:140px;
    min-height: 150px;
    min-width: auto;}
            
#advSearchPanelTable .fastSearchBtn{
    background: url('/portal_static/img/srchBtn.png') 0 0 no-repeat !important;
    margin-left:-3px;
}   
    
    
a:visited {
  color: #7030a0; 
  }           
  
  table #advSearchPanel{
    padding:40px;
    padding-top: 15px;
    width:793px;
    
    }
    .searchline input {
        font-style: italic;
        font-size: 100%;
        height: 33px;
        border: 1px solid #d4d4d4;
        line-height: 33px;
        padding: 0 0 0 10px;
        width: 100%;
        color: #bfbfbf;
        font-family: 'PTSans', Arial, "Helvetica CY", "Nimbus Sans L", sans-serif;
        border-radius: 5px;
        -o-border-radius: 5px;
        -moz-border-radius: 5px;
        -icab-border-radius: 5px;
        -khtml-border-radius: 5px;
        -webkit-border-radius: 5px;
        box-shadow: none;
        background-image: none; 
        background-repeat: no-repeat;
        background-position: 5px center;
        background-attachment: scroll;
        border-top-right-radius: 0px;
        border-bottom-right-radius: 0px;
}
.searchline input[type=text]{
  background-color: white;
}
            
#advSearchPanelTable .searchline input{
  height:38px;
  line-height:38px;
  
}
#advSearchPanelTable .fastSearchBtn{
  height:38px;
}

.fixHeight {
  height: 235px;
  border-bottom: 1px solid #e9e9e9;
  margin-bottom: 15px;
}
span.bbSupport{
  right:-40px;
}

.footerSpacer {
  display: none;
}
.footerWrap {
  padding: 81px 60px 0;
  background-image: url(data:image/png;base64,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);
  background-repeat: no-repeat;
  background-position: top center;
}

@media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {
   span.bbSupport { right: -40px; }
}




        </style>