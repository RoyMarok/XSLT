<style>
      #cardHeader {position:relative; margin:10px;}
      #cardHeader:after {content:''; display:table;clear:both;}      
      #cardHeader .blockLeft{bottom: 0;  position: absolute; top: 0;  width: 20%;}
        #cardHeader .blockLeft .blockLeftTop {display: table-row; text-align: left; vertical-align: top; width: 100%;}
         #cardHeader .blockLeft .blockLeftBottom {display: table-row; text-align: left; vertical-align: bottom; width: 100%;position:absolute; bottom:0;}
         
      #cardHeader .blockCenter{float:left; width:60%;position:relative; margin-left:20%;  text-align: center;}
         #cardHeader .blockCenter .titleCard { font-size:11pt; color:#ccc; margin-bottom:8px;  }
         #cardHeader .blockCenter .subTitleCard { font-size:7pt;  /*text-transform: uppercase;*/ color:#bababa; margin-bottom:8px;   letter-spacing: 1px; font-weight:bold}
         #cardHeader .blockCenter  .nameObj {font-size: 1.83em; color:#215968; margin-bottom: 10px; /*text-transform: uppercase;*/}
         #cardHeader .blockCenter  .descriptObj_1 {font-size: 1.83em; color:#7D8FA4; margin-bottom:8px}
         #cardHeader .blockCenter  .descriptObj_2 {font-size:11pt; color:#7D8FA4;}
         #cardHeader .blockCenter  .descriptObj_3 {margin-top:7px;}
      
      #cardHeader .blockRight{ width:20%; bottom: 0; position: absolute; right: 0;  top: 0;}
        #cardHeader .blockRight .blockRightTop { display: table-row; text-align: right; vertical-align: bottom; width: 100%; float:right}
        #cardHeader .blockRight .blockRighrBottom {width: 100%; position:absolute; bottom:0; text-align: right;}
        
      #cardHeader .red {color:rgb(165, 42, 42)}
      #cardHeader .green {color:rgb(0, 128, 0)}
      #cardHeader .status_style {display: inline-block;background-color: rgb(83,141,213); padding: 5px 10px; color: #fff;}

</style>