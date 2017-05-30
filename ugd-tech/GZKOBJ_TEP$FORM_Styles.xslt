       <style type="text/css">                
                body{
                   background: #f9f9f9;
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
                .line.checkbox input.masked[type="checkbox"] { margin-left: 5px;  margin-top: 7px;}
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
                   
                   #tepDialogWrap{
                     top: 0;
                     position: absolute;
                     margin: 0 0 0 -320px;
                     padding: 20px;
                     z-index: 20;
                     min-height: 440px;
                     width:640px;
                     left:50%;
                     display: none;
                   }
                   
                   #tepDialog{
                     min-height: 400px;
                     width:600px;
                     background: white;
                     display: none;
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
            </style>