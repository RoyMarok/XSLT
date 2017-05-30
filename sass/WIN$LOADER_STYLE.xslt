<style>
/* 
===============================================
/pgu/resources/css/common.css
*/

html, body{
    margin:0;
    padding:0;
    position: relative;
    font-family: Verdana;
}
#header {
    position : realtive;
    top : 0;
    left: 0;
    right: 0;
    height: 49px;
    background: url("/portal_static/img/headTopLineBG.png") repeat-x scroll 0 0 transparent;
}
h1.logo {
    opacity: 0.95;
    -moz-opacity: 0.95;
    -khtml-opacity: 0.95;
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=95);
    background: url("/portal_static/img/headTopLogoMin.png") no-repeat scroll 0 0 transparent;
    color: white;
    display: inline-block;
    float: left;
    font-size: 18px;
    font-weight: normal;
    line-height: 20px;
    margin: 11px 0 0 10px;
    margin: 13px 0 0 8px;
    padding-left: 26px;
    -moz-text-shadow: #333333 1px 1px 1px;
    -webkit-text-shadow: #333333 1px 1px 1px;
    text-shadow: #333 1px 1px 1px;
    -ms-filter: progid:DXImageTransform.Microsoft.Shadow(Strength=1, Direction=135, Color='#333333');
    filter: progid:DXImageTransform.Microsoft.Shadow(Strength=1, Direction=135, Color='#333333');
}
h1.logo.logoMgsn {
    background: url("/portal_static/img/headTopLogoMgsnMin.png") no-repeat scroll 0 0 / 20px 20px transparent;
}
h1.logo  a{
    text-decoration: none;
    color: white;
    font: normal 18px Verdana !important;
}
table td {
    font-size: 13px;
    
}
#mainForm {
    margin-top: -30px;    
    font-size: 13px;
    clear: both; /* fix for FF v41 */
}


#serviceBar {
    margin-top: 30px;
    margin-left: 30px;
}
#serviceBar input{
    padding: .5em 1em;
    margin-right: 1.1em;
}
.razdel{
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 5px;
    font-weight: bold;
}

.actButton {
    border-style: solid;
    border-width: 1px;
    color: #000000;
    cursor: pointer;
    font-size: 11px;
    line-height: 23px;
    text-decoration: none;
}

#formTable{
    margin-top: 30px;
    border: none;
    border-collapse: collapse; 
    cellspacing: 0;
    cellpadding: 4;
    width: 100%;
}

#formTable td {
   border: 1px solid #D1D1D1;
   padding: 5px;
}
#formTable td.text {   
   font-size: 13px;
}

#formTable .delete{
    border-left: none;
    border-top: none;
    border-bottom: none;
    padding-right: 10px;
}

.toms{
    padding-top: 10px;
    padding-bottom: 10px;
    text-align:center;
}

.spanned{
    padding-right: 5px;
    padding-left: 5px;
    text-align:center;
}

.littleFont{
    text-align:center;
    font-size: 11px;
}

.number{
    text-align:center;
}

.data {
    padding-top: 5px;
    padding-bottom: 5px;
    padding-right: 5px;
    padding-left: 5px;
    text-align: center;
}

.rowName{
    padding-top: 5px;
    padding-bottom: 5px;
    padding-right: 5px;
    padding-left: 5px;
}

.data input{
    width: 50%;
}

.total{
    padding-left: 20px;
    padding-top: 10px;
    padding-bottom: 10px;
    font-weight: bold;
}

#antyTerror{
    margin-left: 50px;
    margin-top: 15px;
    margin-bottom: 80px;
}

#submitPanel{
    background-color: #EEE !important;
    border-top:2px solid #5b5b5b;
    padding: 1px 0 2px 0;
    width: 100%;
    position: fixed;
    bottom: 0;
    left: 0;
}

#submitPanel input {
    float: right;
    padding: .5em 1em;
    margin-right: 1.1em;
}

.nonvisible{
    background-color:transparent;
    border:0px solid white;
    width: 100%;
}
#addNewRazdel {
    background-color: #EEE;
    width : 100%;
    height: 100%;
}

#addNewRazdel_input1 {
    width: 70px;
}

#addNewRazdel_input2 {
    width: 320px;
}
.dottedTd {
    width: 250px;
    background-image:url("/portal_static/img/pointCell.png");
    background-position:1px 15px;
    background-repeat:repeat-x;
    vertical-align:top;
}
.dottedTd span {
    background-color: #fff;
    padding-right: 3px;
}
#dataTable {
    margin-top: 85px;
}

#dataTable tr td {
    padding-top: 10px;
}
#dataTable td.fieldLabel {
    width: 33%;
    color: #565656;
}
#dataTable td.fieldData {
    padding-top: 1px;
}
div.ui-datepicker{
 font-size:12px;
}
div.formContent{
    width: 465px;
    margin: 100px auto;
}
div.formContent p.formTitle{
    font-size: 1.5em;
    color: #333;
    margin: 0 0 .5em;
}
div.formContent p .formData{
    font-size: 1em;
    color: #333;
    margin: .3em 0;
}
div.formContent p .formData  .radio{    
    margin-left: 0;
}
input.roundedButtons{
    background: #eaeaea;
    border: 1px solid #AEAEAE;
    border-radius: 5px 5px 5px 5px;
    -webkit-border-radius: 5px 5px 5px 5px;
    -moz-border-radius: 5px 5px 5px 5px;
    background: -webkit-gradient(linear, 0 0, 0 bottom, from(#fefefe), to(#ebebeb));
    background: -webkit-linear-gradient(#fefefe, #ebebeb);
    background: -moz-linear-gradient(#fefefe, #ebebeb);
    background: -ms-linear-gradient(#fefefe, #ebebeb);
    background: -o-linear-gradient(#fefefe, #ebebeb);
    -pie-background: linear-gradient(#fefefe, #ebebeb);

    -moz-box-shadow: 1px 1px 3px -1px #ffffff;
    -webkit-box-shadow: 1px 1px 3px -1px #ffffff;
    -o-box-shadow: 1px 1px 3px -1px #ffffff;
    box-shadow: 1px 1px 3px -1px #ffffff;
    position: relative;
    font-size: 11px;
    line-height: 17px;
    height: 23px;
    text-decoration: none;
    color:#000;
    cursor: pointer;

    padding: 0px 16px;
    overflow: visible;
}
input.roundedButtons{
    behavior: url('css/ps/pie.htc');
}
input.roundedButtons:hover{
    border: 1px solid #848484;
}

/*
===============================================
/pgu/resources/css/button.css
*/

.submit {
    width: 160px;
    height: 32px;
    padding: 0 0 2px;
    font: 14px "Trebuchet MS", Tahoma, Arial, sans-serif;
    outline: none;
    position: relative;
    cursor: pointer;
    border-radius: 3px;
    color: #555;
    border: 1px solid #BBB;
    border-top: 1px solid #D0D0D0;
    border-bottom: 1px solid #A5A5A5;
    text-shadow: 1px 1px #FAFAFA;
    box-shadow:
        inset 0 1px #F5F5F5,
        inset 1px 0 #EDEDED,
        inset -1px 0 #EDEDED,
        inset 0 -1px #E7E7E7,
        0 2px #B2B1B1,
        0 3px #A5A5A5,
        0 4px 2px rgba(0,0,0,0.4)
    ;
    background: -moz-linear-gradient(top,  #eeeeee 0%, #e2e2e2 100%); /* FF3.6+ */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#eeeeee), color-stop(100%,#e2e2e2)); /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(top,  #eeeeee 0%,#e2e2e2 100%); /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(top,  #eeeeee 0%,#e2e2e2 100%); /* Opera 11.10+ */
    background: -ms-linear-gradient(top,  #eeeeee 0%,#e2e2e2 100%); /* IE10+ */
    background: linear-gradient(top,  #eeeeee 0%,#e2e2e2 100%); /* W3C */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eeeeee', endColorstr='#e2e2e2',GradientType=0 ); /* IE6-9 */
    background-color: #E8E8E8;
}
.submit::-moz-focus-inner{border:0}
.submit:hover {
    border-top: 1px solid #C2C2C2;
    box-shadow:
        inset 0 1px #EFEFEF,
        inset 1px 0 #EDEDED,
        inset -1px 0 #EDEDED,
        inset 0 -1px #EDEDED,
        0 2px #B2B1B1,
        0 3px #A5A5A5,
        0 4px 2px rgba(0,0,0,0.4)
    ;
    background: -moz-linear-gradient(top,  #e4e4e4 0%, #e9e9e9 100%); /* FF3.6+ */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#e4e4e4), color-stop(100%,#e9e9e9)); /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(top,  #e4e4e4 0%,#e9e9e9 100%); /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(top,  #e4e4e4 0%,#e9e9e9 100%); /* Opera 11.10+ */
    background: -ms-linear-gradient(top,  #e4e4e4 0%,#e9e9e9 100%); /* IE10+ */
    background: linear-gradient(top,  #e4e4e4 0%,#e9e9e9 100%); /* W3C */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e4e4e4', endColorstr='#e9e9e9',GradientType=0 ); /* IE6-9 */
    background-color: #E8E8E8;
}
.submit:active {
    top: 3px;
    border: 1px solid #B9B9B9;
    border-top: 1px solid #959595;
    border-bottom: 1px solid #CACACA;
    background: #E3E3E3;
    box-shadow: inset 0 1px 2px #B9B9B9;
}


button::-moz-focus-inner {
  border: 0; }

/* minimal
*******************************************************************************/
.minimal {
  background: #E6E6E6 url(/portal_static/img/ui-bg_highlight-soft_75_e6e6e6_1x100.png) 50% 50% repeat-x;
  border: 1px solid lightGrey;
  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  -ms-border-radius: 6px;
  -o-border-radius: 6px;
  border-radius: 6px;
  color: #555;
  font-weight: normal;
  font-size: 12px;
  font-family: Tahoma,Helvetica,sans-serif;
  line-height: 1;
  padding: 0.5em 1em;
  text-align: center;
  position: relative;
  zoom: 1;
   }
  .minimal:hover {
    border: 1px solid #999;
    color: #212121;
    cursor: pointer; }
  .minimal:active {
    color: #555; }
    


/*
===============================================
\pgu\webapp\src\main\webapp\WEB-INF\jsp\edocs\elFinder.jsp
*/

        html, body { margin: 0; padding: 0; height: 100%; }
        #bar { height: 50px; background-color: #BEBEBE; width: 100%;}
        iframe {
            position: relative;
            top: 0; left: 0; width: 100%; height: 100%;
            height: calc(100% - 100);
            border: none; padding: 0px;
            box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;
        }

/*
===============================================
*/

</style>