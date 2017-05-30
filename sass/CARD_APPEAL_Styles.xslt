<style type="text/css">
    .cardWrapper {padding: 2px 17px;}
    .cardLeftSide {float: left; width: 435px;}
    .cardRightSide {margin-left: 435px;}
    .dataBlock {border: 1px solid #D7D8DB; margin: 9px 5px; border-radius: 5px; padding: 20px 0;}
    .grayBlock {background: #FAFBFC;}
    .whiteBlock {background: #FFF;}
    .paddingBlock {padding: 0 18px;}
    .transparentBlock {border: 0; background: none;}
            
    .greenLabel {
        display: inline-block; 
        width: 13px; 
        height: 9px; 
        background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAJCAMAAADepFZYAAAANlBMVEUAAACPswCMsgCOtACUqgCPtACOtACKtACOtACPtACQswCQtACPtACPswCOswCMsQCNsQCPtACLg+49AAAAEXRSTlMA5yfyDNfTGMOJPi6rcFRMOKvD/Y0AAABISURBVAjXRcwJCoBADAPAdG93vfL/z9pI0UIJAyH4ruyj/xhk8yhCbyQ3LLMFpPoCHvlK5ji8MjNJ/QndbZRnrKlmKaC9GngApIECniFftD0AAAAASUVORK5CYII=');
    }
    
    .greenText {
        color: #8FB400;
    }
    
    .editIcon {
        display: inline-block;
        margin-left: 10px;
        cursor: pointer;
        opacity: 0.7;
        width: 13px;
        height: 13px;
        background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAANCAMAAABFNRROAAAAS1BMVEUAAACfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbWfpbUYe/psAAAAGHRSTlMA8JpVMxLXvUU7I/Wuj20p5OPfyHthWAZHheD9AAAAVklEQVQI103MSRaAIAwE0SQyiQPO9v1PqjwDWKv+m6ZScCx3QToWQBTdNlsPVgDwlndF7ppMA1z6gfsMI0MDjSG6ighIHNh85zOAIAryryZL2jqeddMD6PoFU2OvVgMAAAAASUVORK5CYII=') center center no-repeat;
    }
    .editIcon:hover {
        opacity: 1;
    }
    .addIcon {
        display: inline-block;
        width: 12px;
        height: 12px;
        vertical-align: middle;
        background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMAQMAAABsu86kAAAABlBMVEUAAACYsceuuZhtAAAAAXRSTlMAQObYZgAAABJJREFUCNdjYGNAQf8/ABGaIABKJQQb5VHmHwAAAABJRU5ErkJggg==') center center no-repeat;
    }
    
    .enterGreenIcon {
        width: 8px;
        height: 7px;
        display: inline-block;
        vertical-align: middle;
        margin-right: 5px;
        background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAHAQMAAAAPl54dAAAABlBMVEX///+PtAA/AuR/AAAAFElEQVQI12NoAMIWhjaG/wxsDCwAGW0DFJVqsE0AAAAASUVORK5CYII=') center center no-repeat;
    }
            
    .dataBlock .cat {margin-bottom: 4px; overflow: hidden; position: relative;}
    .dataBlock .key {
        background: transparent url("/portal_static/img/ps/pointCell.png") repeat-x scroll 0 8px;
        border-bottom: medium none;
        float: left;
        line-height: 20px;
        max-width: none;
        padding-right: 5px;
        width: 380px;
    }
    .dataBlock .whiteCat .key {background-image: none;}
    .dataBlock .key &gt; span {background-color: #fff; padding-right: 5px;}
    .dataBlock div.value {float: none; line-height: 18px; overflow: hidden; padding: 2px 0 3px 10px;}
            
    .dataBlock .sectionHead {
        position: relative;
        text-align: center;
        font-size: 20px;
        margin-bottom: 15px;
    }
    .dataBlock .sectionHead span {
        background: #fff;
        display: inline-block;
        padding: 0 10px;
        position: relative;
    }
    .dataBlock .sectionHead:before {
        content: '';
        display: block;
        border-bottom: 1px solid #D7D8DB;
        position: absolute;
        top: 50%;
        left: 0;
        right: 0;
        z-index: 0;
    }
    .dataBlock .data_create {
        font-size: 12px;
        border-top: 1px solid #D7D8DB;
    }
    .dataBlock .data_create td {
        padding: 14px;
    }
            
    .iMembers .iMembersItem:hover {
        background: #F2F5FA;
    }
    .iMembers .iMembersItem .iMembersItemHead {
        padding: 16px 20px;
    }
    .iMembers .iMembersItem .iMembersItemBody {
        padding: 0 20px 16px;
    }
    .iMembers .iMembersItem .iMembersName {
        font-size: 18px;
        padding-left: 63px;
    }
    .iMembers .iMembersItem .iMembersNote {
        color: #9D9FA3;
        padding-left: 63px;
    }
    .iMembersProp {
        padding: 3px 0;
        clear: both;
    }
    .iMembersProp .propName {
        float: left;
        clear: left;
        width: 172px;
        text-align: right;
    }
    .iMembersProp .propValue {
        margin-left: 188px;
    }
            
    .expertItem {
        padding-left: 60px;
        cursor: pointer;
        position: relative;
        min-height: 50px;
        margin-bottom: 20px;
    }
    .expertItem .expertImage {
        position: absolute;
        background: #ccc;
        border-radius: 100%;
        position: absolute;
        top: 0;
        left: 0;
        width: 50px;
        height: 50px;
    }
    .expertItem .expertDepText {
        color: #7D8FA4;
        font-size: 12px;
    }
    .expertItem .expertInfo {
        position: absolute;
        top: 0px;
        left: 60px;
        width: 350px;
        padding: 18px;
        box-shadow: 0 5px 25px #CAD3DC;
        display: none;
        background: #fff;
    }
            
    .showHide {
        cursor: pointer;
    }
    .showHideTarget {
        display: none;
    }
            
            
    .stageBlock {padding: 8px;}
    .stageItem {
        position: relative;
        min-height: 40px;
    }
    .stageItem .stageName {
        padding: 11px 20px 11px 45px;
    }
    .stageItem .stageStatus {
        position: absolute;
        top: 12px;
        right: 10px;
    }
    .stageItem .stageNumber {
        position: absolute;
        left: 10px;
        top: 7px;
        border-radius: 100%;
        border: 2px solid #0092FF;
        background: #fff;
        text-align: center;
        width: 25px;
        height: 25px;
        line-height: 21px;
        z-index: 1;
    }
    .stageItem.completed .stageNumber {
        background: #0092FF;
        color: #fff;
    }
    .stageItem.disabled .stageNumber {
        background: #E6E6E6;
        color: #fff;
        border-color: #E6E6E6;
    }
    .stageItem.disabled .stageName {
        color: #E6E6E6;
    }
    .stageItem:before {
        content: '';
        width: 0;
        display: block;
        position: absolute;
        border-right: 3px solid #0092FF;
        top: 0;
        bottom: 0;
        left: 21px;
        z-index: 0;
    }
    .stageItem.disabled:before {
        border-color: #E6E6E6;
    }
    .stageItem:first-child:before {
        top: 15px;
    }
    .stageItem:last-child:before {
        bottom: inherit;
        height: 15px;
    }
    .stageInfo {
        border: 1px solid #D7D8DB;
        padding: 10px 0;
        border-radius: 5px;
        background: #fff;
        position: relative;
    }
    .stageInfo table td {
        border: 0;
        padding: 5px 8px;
    }
    .stageInfo table th {
        border: 0;
        color: #7D8FA4;
        font-weight: normal;
        text-align: left;
        padding: 5px 8px;
    }
            
            
            
    .dataBlock h2 {margin: 0 0 15px 0; font-weight: normal; font-size: 20px;}
    .dataBlock a {color: #235DC1; text-decoration: none;}
    .dataBlock a:hover {color: #c00;}
            
    .grayText {color: #7D8FA4;}
    .blueText {color: #235DC1;}
    .redText {color: #CC3300;}
    .right {text-align: right;}
</style>