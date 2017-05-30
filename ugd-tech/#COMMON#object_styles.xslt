<style>
    .content-block {
      background: #fff;
      padding: 15px;
      border: 1px solid #ccc;
      border-radius: 3px;    
    }
    .comObjHodLeft { width:80px; vertical-align:top; }
    .comObjHodRight { text-align:left; }
    #tepTitleWrap { border-bottom: 1px dashed #000000; }
    .orgTabIcon { background: transparent url(/portal_static/img/isio/dirIcon.gif) no-repeat scroll 0 3px; }
    .orgTabLeft { background: transparent url(/portal_static/img/isio/dots.gif) repeat-x scroll 0 14px; width: 244px; }
    
    .regTepTitleRow .regTepRowTitle, .regTepDataRow .regTepRowProj, .regTepDataRow .regTepRow { font-weight:bold; }
    .regTepTitleRow td {
        margin-top: 1px;
        padding-top: 3px;
        padding-bottom: 4px;
        border-top: 1px solid #CFCFCF;
        border-bottom: 1px solid #CFCFCF;
    }
    .regTepTitleRow .regTepRowTitle { text-align:center; }
    .regTepRowProj, .regTepRow { width:150px; }
    .doHeaderLink .activeLink:link, .doHeaderLink .activeLink:visited { color:#ADADAD; }
    .doHeaderLink .activeLink:hover, .regB_PlanStr a:hover { color:#003399; }
    
    /* Полностью или частично дублируются со стилями в портальных файлах BEGIN */
    .doIcon, .doIconEmpty, .doGrayDoc, .doRedCrossDoc, .spRdYellDoc, .doBlackDoc, .doBlackCrossDoc, .doGreenDoc, .doGreenCrossDoc, .orgTabIcon { width: 16px; }
    .spObjImgWrap { border:0px none; height:100%; width:100%; }
    .spObjPicCell { height:100%; vertical-align:middle; }
    /* Полностью или частично дублируются со стилями в портальных файлах END */
    
    /* Удалить после передиплоя BEGIN */
    .orgLinkWrap span { padding-left: 5px; display: block; }
    .orgLinkWrap { background: none; padding-left: 0px; }
    /* Удалить после передиплоя END */
    
    .progLineAdd { margin-left: 20px; }
    .hodv3 .spObjBuildCell {width:86px}
    .hodv3 .spObjConditionCell{padding-left:1px;}
    
    .hodv3 .spObjConditionCell p{padding:3px 0px 0px}
    .progLineAdd { margin-left: 20px; }
    .hodv3 a img {border:0px;}
    span.perm{background:url(img/sp/1.gif) no-repeat top left;}
    span.ind{display:inline-block;margin-right:5px;width:10px;height:10px;}        
    div#Percents{display:block;width:200px;height:10px;background-color:#ccc;margin:5px 10px 0 0;padding:0px;overflow:hidden;float:left;}
    div#donePercents{display:block;height:10px;background-color:#009900;margin:0px;padding:0px;}
    
     *html div.colored{width:auto !important; width:130px;white-space:nowrap;display:inline-block;}
    *+html div.colored{white-space:nowrap !important;_overflow:hidden;*zoom:1;*display:inline;}
    div.colored{
            color:#fff;
            padding:3px 1.9em 2px;
            text-transform:uppercase;
            font-size:87%;
            text-align:center;
            height:20px;
            border-radius:5px;
            line-height:12px;
            min-width:130px;
            display:inline-block;
            -webkit-border-radius:5px;
            -moz-border-radius:5px;
        } 
    
     /*div.colored{behavior:url('css/isio/PIE.htc');}*/
     
     div#videoCamsZayav {
        behavior: url(css/isio/PIE.htc);
    }
    div#videoCamsZayav {
        position:relative;
        display:block;
        border:1px solid #000000;
        border-radius:5px;        
        -moz-border-radius:5px;
        padding:10px;
        margin:0px;
    }
    div#videoCamsZayav p.videoCamsZayavTitle {
        font-size:0.85em;
        line-height:0.85em;
        padding:0 0 8px 0;
        margin:0px;                
    }

    div#videoCamsZayav div.videoCamsZayavInfo {        
        padding:8px 0;
        margin:0px;
        font-size:1em;
        line-height:1em;
        border-top:1px solid #ccc;        
    }
    div#videoCamsZayav span.videoCamsZayavDate {        
        margin:8px 0;
        padding:0px;        
    }
    div#videoCamsZayav span.videoCamsZayavStatus {        
        margin:0 0 0 30px;
        padding:0px;               
    }
    div#videoCamsZayav p.videoCamsZayavObject {
        font-weight:bold;
        padding: 0 0 10px 0;
        margin:0px;                
    }
    div#videoCamsZayav div.videoCamsZayavDo{
        padding:8px 0 0 0;
        margin:0px;
        text-align:center;
        border-top:1px solid #ccc;
    }
    div#videoCamsZayav div.videoCamsZayavDo input {
        text-align:center;       
        width:115px;
        height: 25px;
        overflow:visible;
        margin:0px
    }  
</style>