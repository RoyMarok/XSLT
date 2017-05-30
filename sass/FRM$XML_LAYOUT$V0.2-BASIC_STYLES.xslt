       <style type="text/css">

body  {background-color: #f9f9f9;}
.xf0_table_sectionBtnAddV, .xf0_table_sectionBtnDeleteV {
  width: 35px;
  height: 31px;
  display: inline-block;
  cursor: pointer;
  text-align: center;
  line-height: 31px;
  margin: 0 0 0 5px;
  padding: 0;
  vertical-align: top;
  color: #8d8d8d;
  font-weight: bold;
  font-size: 0;
  border-width: 1px;
  border-style: solid;
  border-color: #e8e8e8 lightgrey #bfbfbf;
  font-family: "Trebuchet MS", "Helvetica CY", sans-serif;
  background-image: linear-gradient(270deg, white, #f4f4f4);
  background-image: -o-linear-gradient(top, white, #f4f4f4);
  background-image: -ms-linear-gradient(top, white, #f4f4f4);
  background-image: -moz-linear-gradient(top, white, #f4f4f4);
  background-image: -webkit-linear-gradient(top, white, #f4f4f4);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(100%, #f4f4f4));
  zoom: 1;
  filter:  progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='white', endColorstr='#f4f4f4');
  -ms-filter: " progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='white', endColorstr='#f4f4f4')";
}

  .xf0_table_sectionBtnAddV:hover, .xf0_table_sectionBtnDeleteV:hover  {
    box-shadow: #d7d7d7 0px 2px 2px -1px;
    -moz-box-shadow: #d7d7d7 0px 2px 2px -1px;
    -webkit-box-shadow: #d7d7d7 0px 2px 2px -1px;
    background-image: linear-gradient(270deg, white, #f6f6f6);
    background-image: -o-linear-gradient(top, white, #f6f6f6);
    background-image: -ms-linear-gradient(top, white, #f6f6f6);
    background-image: -moz-linear-gradient(top, white, #f6f6f6);
    background-image: -webkit-linear-gradient(top, white, #f6f6f6);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(100%, #f6f6f6));
    zoom: 1;
    filter:  progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='white', endColorstr='#f6f6f6');
    -ms-filter: " progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='white', endColorstr='#f6f6f6')";
}

 .xf0_table_sectionBtnAddV span {
    vertical-align: baseline;
    display: inline-block;
    position: relative;
    top: 0;
    width: 33px;
    height: 29px;
    background-image: url("/static/typeForm/img/buttonAddRemAdd.gif");
    background-repeat: no-repeat;
    background-position: center center;
    background-attachment: scroll; }
  .sectionAddRemBtnV.btnClick {
    background-image: linear-gradient(90deg, white, #f4f4f4);
    background-image: -o-linear-gradient(bottom, white, #f4f4f4);
    background-image: -ms-linear-gradient(bottom, white, #f4f4f4);
    background-image: -moz-linear-gradient(bottom, white, #f4f4f4);
    background-image: -webkit-linear-gradient(bottom, white, #f4f4f4);
    background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0%, white), color-stop(100%, #f4f4f4));
    zoom: 1;
    filter:  progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#f4f4f4', endColorstr='white');
    -ms-filter: " progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#f4f4f4', endColorstr='white')";
}

 .xf0_table_sectionBtnDeleteV span {
    vertical-align: baseline;
    display: inline-block;
    position: relative;
    top: 0;
    width: 33px;
    height: 29px;
    background-image: url("/static/typeForm/img/buttonAddRemRem.gif");
    background-repeat: no-repeat;
    background-position: center center;
    background-attachment: scroll; }
  .sectionAddRemBtnV.btnClick {
    background-image: linear-gradient(90deg, white, #f4f4f4);
    background-image: -o-linear-gradient(bottom, white, #f4f4f4);
    background-image: -ms-linear-gradient(bottom, white, #f4f4f4);
    background-image: -moz-linear-gradient(bottom, white, #f4f4f4);
    background-image: -webkit-linear-gradient(bottom, white, #f4f4f4);
    background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0%, white), color-stop(100%, #f4f4f4));
    zoom: 1;
    filter:  progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#f4f4f4', endColorstr='white');
    -ms-filter: " progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#f4f4f4', endColorstr='white')";
}





                div.formWrapper h2{
                  margin-top:25px;
                  clear:both;
                }

                div#overlay{
                    position: fixed;
                    width: 100%;
                    z-index: 10;
                    height:100%;
                    top:0;
                    left:0;
                    display: none;
                    background:white;
                    opacity:0.4;
                }

                div#loadingIndicator{
                    position: fixed;
                    top:300px;
                    width:66px;
                    left:48%;
                    z-index: 10001;
                    display:none;
                }
                .line.checkbox input.masked[type="checkbox"] { margin-left: 5px;  margin-top: 11px;}
                .textInputWrap {font-size:10pt; margin-left:250px; display:block; line-height: 15pt !important;}
                #tepsTable{
                  width:905px;
                  margin:15px auto 0;
                  clear:both;
                  border-collapse:collapse;
                  font-size:13px;
                  font-weight:bold;
                }
                #tepsTable td,#tepsTable th{
                  border:1px solid silver;
                  padding:5px 0;
                  text-align:center;
                  vertical-align:middle;
                }
                #tepsTable .line{
                  width:auto;
                }
                 #tepsTable .line .inputWrap{
                  margin-left:0;
                 }
                 #tepsTable tr.tep{
                  background:white;
                  line-height:30px;
                 }
                 #tepsTable tr{
                  background:rgb(238, 238, 238);
                  line-height:30px;
                  }

                 .horizontal1.line.medium .customSelect {
                    width: 285px;
                  }
                  .horizontal2.line.medium .customSelect {
                    width: 313px;
                  }
                  div[id^=tab] {
                      display: none;
                      }

                  .tabs {
                      margin: 0 0 20px;
                      padding: 0;
                      background: none repeat scroll 0 0 transparent;
                      line-height: 1.2em;
                      border-bottom: 1px solid #d1d1d1;
                      height: 35px; }
                .tabs li {
                      border-color: #dedede;
                      border-radius: 6px 6px 0 0;
                      -o-border-radius: 6px 6px 0 0;
                      -moz-border-radius: 6px 6px 0 0;
                      -icab-border-radius: 6px 6px 0 0;
                      -khtml-border-radius: 6px 6px 0 0;
                      -webkit-border-radius: 6px 6px 0 0;
                      border-style: solid;
                      border-width: 1px 1px 0;
                      float: left;
                      list-style: none outside none;
                      margin: 0 3px 1px 0;
                      padding: 0;
                      position: relative;
                      top: 0;
                      white-space: nowrap;
                      background-image: linear-gradient(270deg, white, #f4f4f4);
                      background-image: -o-linear-gradient(top, white, #f4f4f4);
                      background-image: -ms-linear-gradient(top, white, #f4f4f4);
                      background-image: -moz-linear-gradient(top, white, #f4f4f4);
                      background-image: -webkit-linear-gradient(top, white, #f4f4f4);
                      background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(100%, #f4f4f4));
                      zoom: 1;
                      filter:  progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='white', endColorstr='#f4f4f4');
                      -ms-filter: " progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='white', endColorstr='#f4f4f4')";
                      color: #404040;
                      font-weight: normal;
                      height: 34px;
                      line-height: 34px;
                      outline: medium none; }
                  .tabs li a {
                      color: #404040;
                      font-size: 80%;
                      padding: 0 1.5em;
                      display: inline-block;
                      height: 33px;
                      text-decoration: none;
                      text-shadow: none; }
                  .tabs li.active {
                      background: none repeat scroll 0 0 #f9f9f9;
                      color: #404040;
                      filter: none;
                      font-weight: normal;
                      height: 35px; }
                   div.docSection{
                      width:905px;
                      margin:15px auto;
                   }
                   .addDocSection{
                      float:right;
                   }
                   .deleteDocSection{
                      float:right;
                   }

                   #tepDialog{
                     position: fixed;
                     background: white;
                     width:600px;
                     min-height:400px;
                     left:50%;
                     margin-left:-300px;
                     display: none;
                     z-index: 20;
                     border: 1px solid silver;
                     padding: 20px;
                     box-shadow: 1px 1px 9px 1px rgba(0,0,0,0.2);
                   }

                  #tepDialog li{
                    margin:10px;
                  }


                  #tepDialog li label{
                    font-size:13px;
                    margin-left:30px;
                  }

                  #tepDialog li input{
                    vertical-align:middle;
                  }

                  #tepDialog div#listWrap{
                    min-height:300px;
                  }

                  #tepDialog .button.appendTep{
                    margin-right:100px;
                  }

                  #tepDialog .button{
                    width:100px;
                  }

                  #tepDialog .buttonsLine{
                    text-align:center;
                  }
                  table#tepsTable tr td span.addRem{
                      margin:0 5px;
                  }
                  table#tepsTable tr td span.addRem span{
                    background-image: url("/static/typeForm/img/buttonAddRemRem.gif");
                    background-repeat: no-repeat;
                    background-position: center center;
                    background-attachment: scroll;
                  }
                  #tepDialog p {
                    font-weight: bold;
                    font-size: 13px;
                    margin-left: 10px;
                  }
                  #tepDialog p span.tepToggle{
                    background: url(img/toggle_plus.gif) no-repeat;
                    width: 18px;
                    height: 15px;
                    display: inline-block;
                    vertical-align: baseline;
                  }
                  #tepDialog p span.tepToggle.expand{
                    background: url(img/toggle_minus.gif) no-repeat;
                  }
                  div.divider{
                    margin:10px 0;
                  }
                  div.line span.textInputWrap p{
                    line-height:31px;
                  }

                 .wrapTable {display:table; width:auto; margin:0px auto; margin-bottom:15px}
                  .wrapTable .theadAFT, .wrapTable .rowWrapTable {display:table-row;}
                    .wrapTable .theadAFT .headWrapTable {text-align:center; font-weight:bold; background-color:white; vertical-align: middle; line-height:12px; color:black; height:34px}
                    .wrapTable .rowWrapTable .cellWrapTable {display:table-cell; padding:5px; border:1px solid #e8e8e8}
                    .wrapTable .rowWrapTable .cellWrapTable.buttonsWrap  {border:0px}

                 .moveRemLine .top,  .moveRemLine .bottom {width: 40px; display: block; border: 1px solid rgb(232, 232, 232); text-align: center; background-image:linear-gradient(center top , white, rgb(244, 244, 244));
                  background-image: linear-gradient(270deg, white, #f4f4f4);
  background-image: -o-linear-gradient(top, white, #f4f4f4);
  background-image: -ms-linear-gradient(top, white, #f4f4f4);
  background-image: -moz-linear-gradient(top, white, #f4f4f4);
  background-image: -webkit-linear-gradient(top, white, #f4f4f4);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(100%, #f4f4f4));
  zoom: 1;
  filter:  progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='white', endColorstr='#f4f4f4');
  -ms-filter: " progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='white', endColorstr='#f4f4f4')";
   border-width: 1px;
  border-style: solid;
  border-color: #e8e8e8 lightgrey #bfbfbf; }
                  .moveRemLine .bottom {}
                  .checkbox::before,
                  .checkbox::after {
                    content: '';
                    display: table;
                    clear: both;
                  }
                  .checkbox label {
                    display: inline-block;
                  }


.sectionCaption{
  line-height:42px;
}

.section{
  padding-top:10px;
}
.line .inputWrap input.readOnly,
            .line .inputWrap input.readOnly + img,
            .line .inputWrap textarea.readOnly{
                background-color: #f7f7f7;
            }
            .line .inputWrap input.readOnly:hover,
            .line .inputWrap textarea.readOnly:hover,
            .line .inputWrap input.readOnly:hover + img{
                border-color: #D9DBDD;
            }
            .line .inputWrap input.readOnly:focus,
            .line .inputWrap textarea.readOnly:focus,
            .line .inputWrap input.readOnly:focus + img{
                box-shadow: none;
            }
            #cboxClose{
                border: none;
                top: 10px;
            }
.formWrapper h2.header{
  text-align: center;
}
h4, .formWrapper h4.line{
  font-weight: bold;
    color: #969494;
    font-size: 20px;
    text-align: center;
    border-top: 1px solid #efefef;
    padding-top: 20px;
}
.sectionContainer .sectionBtnAdd{
    display: block;
    max-width: 905px;
    text-align: left;
    margin: 15px auto;
}
.sectionContainer .sectionBtnAdd.topSection{
    width: 905px;
}
.popup{
    padding: 20px;
    text-align: center;
    font-family: 'PTSans', "Helvetica CY", "Nimbus Sans L", sans-serif;
    padding-top: 55px;
}
.popup p{
    margin-bottom: 20px;
}
.form_button{
    width: auto;
    padding: 3px 15px;
    margin-left: 10px;
    background: white;
    font-weight: normal;
    font-size: 16px;
    border: 0;
    text-shadow: none;
    line-height: 32px;
    text-align: center;
    cursor: pointer;
    transition: all .3s ease;
    border: 1px solid #D9DBDD;
    vertical-align: top;
}
.form_button:hover {
    background-color: #0092ff;
    border-color: #0092ff;
    color: white;
}
#cboxLoadedContent{
    padding: 0;
    background-image:none;
}
#cboxContent{
    margin-bottom: 0px;
}
.rightBlock{
  float: right;
}
@-moz-document url-prefix() {
    .rightBlock {
        margin-top: -32px;
    }
}
.line .rightBlock input.form_button{
    background: white;
    color: #0086bd;
    border: 1px solid #0086bd;
}
.line .rightBlock input.form_button:hover{
    background: #44b2f7;;
    color: white;
    border: 1px solid #44b2f7;;
}
.readOnly+span.overTrop, .line .inputWrap input.date.readOnly + img{
                background-color: #f2f2f2;
            }
            </style>