<style>

.spObjHeadTab td, .navigationPanel td, html, body {
    padding: 0;
}
a, a:link {color:rgb(35, 93, 193)}
.mainWrapper table .tableTitle {font-size:12pt}
#menuTable, #mainTable, #mainTable div, #leftSection td, #rightSection td {
    font-family: 'PTSans', Arial,Tahoma;

}
.printLink {
  border-bottom: 1px dashed #006699;
  color: #006699;
  margin-left: 25px;
  margin-bottom: 15px;
  position: relative;
  text-decoration: none;
  display: inline-block;
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
.topBorderRow td {
    border-top: 1px solid rgb(207, 207, 207);
}
#menuTabLeft, #leftMenuWrap, #rightMenuWrap, #menuTabRight {
    white-space: nowrap;
}
#menuTabLeft, #leftMenuWrap {
    width: 915px;
}
.spProgMenu #menuTabLeft, .spProgMenu #leftMenuWrap {
    width: 715px;
}
#leftMenuWrap {
    margin-bottom: -8px;
}
#colRightAl {
    text-align: right;
}
#pageHeader {
    background: rgba(0, 0, 0, 0) url("getWebSource?id=header_bg.jpg") repeat-x scroll 0 0;
    height: 66px;
}
.strutStick {
    width: 1024px;
}
#pageLogo {
    background: rgba(0, 0, 0, 0) url("getWebSource?id=logo.gif") no-repeat scroll 0 0;
    height: 30px;
    left: 26px;
    position: absolute;
    top: 15px;
    width: 150px;
}
#logoTextTitle, #logoText {
    color: rgb(255, 255, 255);
    font-family: 'PTSans', Arial,Tahoma;
    left: 36px;
    position: absolute;
    width: 650px;
}
#logoTextTitle {
    font-size: 16px;
    font-weight: bold;
}
#logoText {
    font-size: 15px;
    top: 16px;
}
.grayText {
    color: rgb(185, 185, 185);
}
.doTitle.grayText, .spObjDoTitle.grayText {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0 !important;
}
.doHeaderLink {
    padding-left: 15px;
}
.doHeaderLink a, .doHeaderLink a:hover {
    color: rgb(173, 173, 173);
}
.mainWrap {
    padding-left: 30px;
    padding-right: 20px;
}
#pageTitle {
    margin-left: 3px;
    text-align: center;
    width: 100%;
}
#spPageTitle {
    margin-bottom: 16px;
    margin-left: 3px;
    text-align: center;
    width: 100%;
}
.blueTitle {
    color: rgb(16, 107, 189);
    font-family: 'PTSans', Arial,Tahoma;
    font-size: 22px;
    padding-left: 110px;
    padding-right: 110px;
}
.blackTitle {
    font-family:'PTSans', Arial,Tahoma;
    font-size: 16px;
    font-weight: bold;
}
#menuTable {
    width: 100%;
}
ul#menu {
    display: inline-block;
    margin: 0;
    padding: 19px 0 0 28px;
}
ul#menu li {
    border: 0 none;
    float: left;
    list-style: outside none none;
    padding-left: 5px;
    padding-right: 5px;
    position: relative;
}
ul#menu .first {
    background-color: rgb(16, 107, 189);
}
ul#menu li a {
    color: rgb(16, 115, 214);
}
ul#menu .first a {
    color: rgb(255, 255, 255);
    text-decoration: none;
}
#mainTable, #mainTableDoc {
    border-collapse: collapse;
    width: 100%;
}
#leftSection {
    padding-top: 4px;
    vertical-align: top;
}
.tableTitle {
    font-weight: bold;
    padding-bottom: 2px;
}
#docTabHeader, .spObjRelTab {
    margin-bottom: 4px;
}
#rsoDocTabHeader {
    margin-bottom: 4px;
}
#rsoDocTabHeader, #docTabHeader, .spObjRelTab, .spObjRelRowsTab {
    border-collapse: collapse;
    width: 100%;
}
#docTabHeader td {
    height: 16px;
    font-size:12pt
}
#docTabAll {
    width: 36px;
}
#docTabFiltr1 {
    width: 80px;
}
#docTabAll a {
    background-color: rgb(54, 110, 155);
    color: rgb(255, 255, 255);
    font-weight: normal;
    margin-right: 1px;
    text-align: center;
    text-decoration: none;
}
#docTabFiltr2 {
    width: 96px;
}
#docTabAll, #docTabFiltr1, #docTabFiltr2 {
    font-weight: normal;
    text-align: right;
}
#docTabFiltr1 a, #docTabFiltr2 a {
    color: rgb(17, 116, 209);
    font-weight: normal;
    text-align: center;
    text-decoration: underline;
}
#docTabAll a, #docTabFiltr1 a, #docTabFiltr2 a {
    margin-top: 6px;
    padding-bottom: 2px;
    padding-top: 2px;
}
#rsoDocTabHeader .rsoObjDocLinkWrap {
    margin-top: 8px;
}
#docTabAll a, #docTabFiltr1 a, #docTabFiltr2 a, #docTabHeader .rsoObjDocLinkWrap {
    display: block;
}
#docTabFiltr1 a {
    margin-left: 2px;
    margin-right: 2px;
    width: 77px;
}
#docTabFiltr2 a {
    margin-left: 2px;
    width: 98px;
}
.rsoObjLinkCel {
    width: 8em;
}
#docTabAll a:hover, #docTabFiltr1 a:hover, #docTabFiltr2 a:hover {
    cursor: pointer;
}
.spObjMenu ul#rightSubmenu {
    padding-top: 0 !important;
}
ul#rightSubmenu {
    display: inline-block;
    margin: 0;
    padding-bottom: 0;
    padding-left: 0;
    padding-right: 9px;
}
ul#rightSubmenu li {
    border: 0 none;
    list-style: outside none none;
    padding-left: 12px;
    position: relative;
}
#printLink {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/print_icon.gif") no-repeat scroll 0 0;
}
#rightSection {
    height: 100%;
    padding: 0 0 0 12px;
    text-align: left;
    vertical-align: top;
    width: 362px;
}
.innerTable {
    border-collapse: collapse;
    width: 100%;
}
.tepWrap, .tepWrap td, .objDescTitle2, .objDescTitle2 td, .objDocTab td, .spDocInfo td, .spObjDocTab td {
    vertical-align: top;
}
.progTab td, .spObjDocTab td, .spDazuTab td, .smOrgTab td {
    height: 22px;
}
.spPlanTab, .regB_PlanTab {
    width: 55%;
}
.objDescTab td, .spPlanTab td, .spMainTepTab td, .spObjRealRow td, .spObjIzoRow td {
    height: 18px;
}
.spMainTepTab {
    border-collapse: collapse;
    width: 100%;
}
.rsoObjDescTab td, .objDocTab td {
    height: 24px;
}
.rsoObjDescTab, .objDescTab, .progTab, .objDocTab, .rdTab, .orgTab, .spRdTab, .spObjDocTab, .spObjRelTab, .spObjIzoTab, .spDazuTab, .staticTab {
    border-top: 1px solid rgb(228, 228, 228);
}
.smOrgTab {
    border: 0 none;
}
.smOrgTab td {
    background-color: rgb(229, 233, 248);
    padding-bottom: 3px !important;
    padding-left: 5px;
    padding-top: 3px !important;
}
.objDocTab .tableTitle, .spObjDocTab .tableTitle {
    padding-top: 8px;
}
.rsoObjDescTab .tableTitle, .objDescTab .tableTitle {
    height: 22px;
    padding-bottom: 5px;
    padding-top: 8px;
}
.rdTab .tableTitle {
    height: 22px;
    padding-bottom: 6px;
    padding-top: 8px;
    text-transform: uppercase;
}
.spRdTab .tableTitle {
    height: 22px;
    padding-bottom: 5px;
    padding-top: 8px;
}
.spObjIzoTab .tableTitle {
    height: 22px;
    padding-bottom: 7px;
    padding-top: 8px;
}
.orgTab {
    margin-top: 17px;
}
.orgTab .tableTitle {
    height: 22px;
    padding-bottom: 1px;
    padding-top: 8px;
}
.orgTab .lastRowRight {
    padding-top: 3px;
}
.rsoObjDescTab, .objDescTab, .orgTab, .rdTab, .tepWrap table, .spRdTab, .staticTab {
    border-collapse: collapse;
}
.progTab, .spDazuTab {
    margin-top: 16px;
}
.progTab .tableTitle, .spDazuTab .tableTitle {
    padding-bottom: 3px;
    padding-top: 8px;
}
.objDocTab {
    margin-top: 14px;
}
.spObjDocTab, .spObjRelTab, .spObjIzoTab {
    margin-top: 15px;
}
.rdTab, .staticTab {
    margin-bottom: 15px;
}
.staticTab {
    margin-top: 4px;
}
.spRdTab {
    margin-bottom: 17px;
    margin-top: 0;
}
.rdTab td, .spRdTab rd {
    height: 22px;
}
.objDescInfo1, .objDescInfo2 {
    white-space: nowrap;
    width: 160px;
}
.objDescFirst {
    height: 16px;
}
.lastRowRight {
    text-align: right;
}
.activeLinkOrgs {
    color: rgb(148, 99, 49);
}
.detailLinkWrap {
    background: rgba(0, 0, 0, 0) url("getWebSource?id=i_icon.gif") no-repeat scroll 0 40%;
    float: right;
    height: 20px;
    width: 6.7em;
}
#docTabHeader .detailLinkWrap {
    background-position: 0 80%;
    height: 18px;
    padding-top: 7px;
}
.detailLink {
    display: block;
    float: right;
    text-decoration: underline;
    width: 5.3em;
}
.objDescTitle1, .objDescInfo1, .objDescTitle2, .objDescInfo2 {
    vertical-align: top;
}
.objDescTitle1, .doTitle, .spObjDoTitle {
    width: 230px;
}
.doLink {
    width: 180px;
}
.doDate {
    padding-right: 5px;
    text-align: right;
    width: 65px;
}
.rdLink {
    padding-right: 10px;
    white-space: nowrap;
    width: 100px;
}
.rdLink a {
    white-space: nowrap;
}
.rdDate {
    width: 75px;
}
.spRdDate {
    padding-top: 4px;
    vertical-align: top;
    width: 71px;
}
.rsoObjRdRow td, .spObjRdRow td, .spRdRow td {
    background-color: rgb(255, 255, 255);
}
.rdInfo, .spRdInfo {
    height: 10px !important;
    vertical-align: top;
}
.rsoObjRdRow .doGrayDoc, .rsoObjRdRow .doBlackCrossDoc, .rsoObjRdRow .doRedCrossDoc, .rsoObjRdRow .doGreenDoc, .rsoObjRdRow .doGreenCrossDoc {
    background-position: center 5px !important;
}
.rdInfo div, .spRdInfo div, .spObjContent2 div {
    display: block;
    overflow: hidden;
}
.rsoRdTextWrap, .spRdTextWrap {
    overflow: hidden;
    padding-bottom: 4px;
    padding-top: 4px;
    position: relative;
    width: 100%;
}
.rsoRdText, .spRdText {
    display: inline;
    overflow: hidden;
    padding-left: 4px;
    position: relative;
    width: 150%;
}
.rsoObjRdGradient, .spObjRdGradient {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/gradient_60.png") repeat-y scroll 0 0;
    display: block;
    height: 30px;
    position: absolute;
    right: -1.1%;
    top: 0;
    width: 45px;
}
.spRdInfo .spPointer {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/pointCell.png") repeat-x scroll 0 -13px;
    float: left;
    height: 1px;
    left: 98%;
    position: relative;
    top: -2px;
    width: 9px;
}
.rsoOrgTabLeft, .orgTabLeft {
    vertical-align: top;
    width: 190px;
}
.orgTabLeft, .orgLinkWrap {
    padding-bottom: 3px;
}
.rsoOrgTabLeft, .rsoOrgLinkWrap {
    padding-bottom: 8px;
}
.rsoOrgLinkWrap {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/dirIcon.gif") no-repeat scroll 0 3px;
    padding-left: 20px;
}
.rightSectTitle, .spSppTitle {
    font-weight: bold;
}
.spSppTitle {
    padding-top: 12px;
}
.rightSectWrap {
    padding-top: 8px;
}
.rightSectWrap table {
    border-collapse: collapse;
}
.progDiv {
    float: left;
    width: 40px;
}
.rsoObjBuildInf, .spObjBuildInf {
    float: left;
    font-weight: bold;
}
.titleGrayProg, .spObjBuildTitle, .rsoObjBuildTitle {
    color: rgb(139, 139, 139);
}
.titleGrayProg {
    padding-bottom: 28px;
    padding-top: 12px;
}
.spObjBuildTitle, .rsoObjBuildTitle {
    padding-bottom: 24px;
    padding-top: 8px;
}
.titleGrayProg span {
    background-color: rgb(139, 139, 139);
    color: rgb(255, 255, 255);
    margin-right: 5px;
    padding-left: 3px;
    padding-right: 3px;
}
.spObjBuildTitle span, .rsoObjBuildTitle span {
    background-color: rgb(139, 139, 139);
    color: rgb(255, 255, 255);
    display: block;
    float: left;
    margin-right: 5px;
    padding-left: 3px;
    padding-right: 3px;
    width: 66px;
}
.titleGray {
    color: rgb(139, 139, 139);
    font-weight: bold;
    padding-bottom: 4px;
    padding-top: 14px;
}
.titleGray span {
    background-color: rgb(139, 139, 139);
    color: rgb(255, 255, 255);
    font-weight: bold;
    margin-right: 5px;
    padding-left: 3px;
    padding-right: 3px;
}
.rightPicWrap {
    height: 176px;
    width: 176px;
}
.secondPic {
    margin-left: 6px;
}
.rightPic {
    border: 1px solid rgb(207, 207, 207);
    display: block;
    height: 170px;
    padding-left: 5px;
    width: 170px;
}
.rightPicBody {
    display: block;
    height: 112px;
    margin-left: 8px;
    margin-top: 30px;
    padding-left: 0 !important;
    width: 150px;
}
.rightPicWrap span {
    color: rgb(139, 139, 139);
    display: block;
    text-align: center;
    width: 100%;
}
.rsoObjPicCell {
    height: 176px;
    width: 176px;
}
.rsoObjImgWrap {
    border: 1px solid rgb(207, 207, 207);
    height: 190px;
    text-align: -moz-center;
    vertical-align: middle;
    width: 174px;
}
.rsoObjImgWrap span {
    color: rgb(139, 139, 139);
    display: block;
}
.rsoObjSecondPic {
    margin-left: 7px;
}
.rsoObjPicImg {
    border: 1px solid rgb(255, 255, 255);
    height: 112px;
}
.spObjPicCell {
    padding-top: 3px;
    vertical-align: top;
    width: 176px;
}
.spObjImgWrap {
    display: table-cell;
    text-align: -moz-center;
    vertical-align: middle;
}
.spObjImgWrap span {
    color: rgb(139, 139, 139);
    display: block;
}
.spObjPicImg {
    border: 1px solid rgb(255, 255, 255);
}
.spObjSecondPic {
    margin-left: 7px;
}
#rightPic1 {
    background: rgba(0, 0, 0, 0) url("getWebSource?id=photo1.jpg") no-repeat scroll 0 0;
}
#rightPic2 {
    background: rgba(0, 0, 0, 0) url("getWebSource?id=photo2.jpg") no-repeat scroll 0 0;
}
#rightPrPic2 {
    background: rgba(0, 0, 0, 0) url("getWebSource?id=projPic2.jpg") no-repeat scroll 0 0;
}
#addrList {
    margin-bottom: 0;
    margin-top: 0;
}
#addrLast {
    font-weight: bold;
    padding-left: 40px;
}
.detailWrap {
    text-align: right;
    width: 100%;
}
.spObjConditionVal {
    font-weight: bold;
}
.spObjBuildRow {
    margin-bottom: 7px;
}
.rsoObjConditionCell, .spObjConditionCell {
    font-weight: bold;
    vertical-align: top;
}
.rsoObjBuildTab, .spObjBuildTab {
    width: 100%;
}
.rsoObjBuildTab tr td, .spObjBuildTab tr td, .rsoObjBuildTab tr td {
    height: 24px;
}
.rsoObjBuildVal, .spObjBuildVal {
    background-color: rgb(255, 255, 255);
    padding-right: 1px;
    white-space: nowrap;
}
.rsoObjBuildCell, .spObjBuildCell {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/dots.gif") repeat-x scroll 0 13px;
    vertical-align: top;
    width: 185px;
}
#mapImg {
    border: 1px solid rgb(207, 207, 207);
    height: 238px;
    margin: 4px 0 0;
    overflow: hidden;
    width: 360px;
}
#mapFrame {
    border: 0 none;
    height: 240px;
    margin: -1px 0 0 -1px;
    overflow: hidden;
    width: 362px;
}
#leftPartStick {
    width: 551px;
}
#rdLast {
    height: 10px;
}
#rdBottom {
    border-bottom: 1px solid rgb(207, 207, 207);
    width: 100%;
}
.objDescTWrap {
    width: 230px;
}
.objDescVWrap {
    white-space: nowrap;
}
.objDescTWrap {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/pointCell.png") repeat-x scroll 0 0;
}
.objDescTitle1 {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/dots.gif") repeat-x scroll 0 13px;
}
.doTitle {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/dots.gif") repeat-x scroll 0 13px;
    padding-right: 10px;
}
.spObjDoTitle {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/dots.gif") repeat-x scroll 0 13px;
    padding-right: 10px;
}
.regObjGrLeft1, .regObjGrLeft2 {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/dots.gif") repeat-x scroll 0 13px;
    vertical-align: top;
    width: 262px;
}
.regObjGrCenter {
    vertical-align: top;
    width: 180px;
}
.regObjGrRight {
    vertical-align: top;
}
.doIcon, .doIconEmpty, .doGrayDoc, .doRedCrossDoc, .spRdYellDoc, .doBlackDoc, .doBlackCrossDoc, .doGreenDoc, .doGreenCrossDoc {
    width: 22px;
}
.doLinkEmptyIcon, .doLinkUpIcon, .doLinkDownIcon, .doRdDownIcon, .doRdDownIcon {
    width: 13px;
}
.doLinkUpIcon {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/hashUpIcon.gif") no-repeat scroll 0 1px;
}
.doLinkDownIcon {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/hashDownIcon.gif") no-repeat scroll 0 1px;
}
.doRdUpIcon {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/hashUpIcon.gif") no-repeat scroll 0 4px;
}
.doRdDownIcon {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/hashDownIcon.gif") no-repeat scroll 0 5px;
}
.doIcon, .doGrayDoc {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/docIcon.gif") no-repeat scroll center 1px;
}
.doBlackCrossDoc {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/docBlackCross.gif") no-repeat scroll center 1px;
}
.doGreenDoc {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/docGreenIcon.gif") no-repeat scroll center 1px;
}
.doRedCrossDoc {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/docRedCross.gif") no-repeat scroll center 1px;
}
.doGreenCrossDoc {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/docGreenCross.gif") no-repeat scroll center 1px;
}
.spRdYellDoc {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/docYellCross.gif") no-repeat scroll center 1px;
}
.doBlackDoc {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/docBlack.gif") no-repeat scroll center 1px;
}
.spProgRdDoc {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/docGreenIcon.gif") no-repeat scroll 0 1px !important;
}
.spProgRdDocCross {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/docGreenCross.gif") no-repeat scroll 0 1px !important;
}
.objDescTName, .doTitleSp, .spDescNameAct span, .spObjRealName span, .spObjIzoName span {
    background-color: rgb(255, 255, 255);
    padding-right: 1px;
}
.spDescNamePas span {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0 !important;
    color: rgb(192, 192, 192);
}
.spDescNamePas {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0 !important;
}
#objConditionWrap {
    display: block;
    left: 45%;
    position: relative;
    text-align: right !important;
    top: -62px;
    width: 100px;
}
#objCondition {
    background-color: rgb(158, 135, 113);
    color: rgb(255, 255, 255) !important;
    font-weight: bold !important;
    margin-right: 6px;
    padding: 0 7px 1px 8px;
    top: -30px;
    white-space: nowrap;
}
.relObj {
    border-top: 1px solid rgb(207, 207, 207);
    margin-top: 15px;
    padding-bottom: 10px;
    padding-top: 8px;
}
.relObjWrap, .relObjEmpty {
    margin-top: 3px;
}
.relObjWrap {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/houseIcon.gif") no-repeat scroll 0 0;
}
.relObjLink, .relObjInf {
    font-weight: bold;
}
.relObjLink {
    color: rgb(17, 116, 209);
}
.relObjLink:hover {
    color: rgb(0, 51, 153);
}
.relObjInf {
    color: rgb(1, 153, 176);
}
.titleRow td, .childRow td, .infoRow td {
    height: 22px;
    padding-bottom: 5px;
    padding-top: 3px;
}
.progLineWrap {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/progIcon.gif") no-repeat scroll 0 3px;
    padding-bottom: 4px;
    padding-left: 20px;
    padding-top: 2px;
}
#moreTabTitle, #tepTabTitle, .relObjNat {
    font-weight: bold;
}
.relObjNat {
    color: rgb(0, 0, 0);
}
#tepTabTitle {
    margin-top: 15px;
}
#moreTable, #tepTable {
    border-bottom: 1px solid rgb(222, 222, 222);
    border-top: 1px solid rgb(222, 222, 222);
    width: 100%;
}
#moreTable th, #tepTable th {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/tab_head2.png") repeat-x scroll 0 0;
    border-color: -moz-use-text-color rgb(173, 173, 173) rgb(173, 173, 173) rgb(255, 255, 255);
    border-style: none solid solid;
    border-width: 0 1px 1px;
    font-size: 13px;
    font-weight: normal;
}
.moreTabCol, .tepTabCol {
    height: 24px;
    text-align: center;
}
.morePicCol, .tepPicCol {
    border-left: 1px solid rgb(173, 173, 173) !important;
    width: 24px;
}
.moreLeftCol, .tepMeasCol {
    width: 260px;
}
.moreCentCol, #moreTable tr .valCell {
    width: 412px;
}
.tepProjCol {
    width: 205px;
}
.tepFactCol, #tepTable tr .valCell {
    width: 205px;
}
.titleRow .valCell {
    font-weight: bold;
}
.picCell, .morePicCol, .tepPicCol {
    text-align: -moz-center;
}
.picCell {
    vertical-align: top;
}
.detailDoc {
    font-style: normal;
    padding-right: 4px;
}
.greyCol {
    color: rgb(162, 162, 162);
}
.rsoTopDetailRow, .tabMenu, .spObjTabMenu {
    border-top: 1px solid rgb(207, 207, 207);
}
.rsoTopDetailRow {
    margin-top: 4px;
}
.tabMenu, .spObjTabMenu {
    margin-top: 4px;
}
.rsoTopDetailRow #moreTabTitle, .rsoTopDetailRow #tepTabTitle {
    font-family:'PTSans', Arial,Tahoma;
    font-size: 14px !important;
    padding-left: 2px;
}
.addrCell, .valCell, .docCell {
    padding-left: 5px;
    vertical-align: top;
}
.addrCell, .valCell, .docCell, .projCell {
    border-right: 1px solid rgb(207, 207, 207);
}
.emptyCell, .picCell {
    border-left: 1px solid rgb(207, 207, 207);
}
.picCont, .picHeadCont {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/expand_minus.gif") no-repeat scroll 1px 1px;
    height: 16px;
    width: 16px;
}
.detailLinkWrap {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/i_icon.gif") no-repeat scroll 0 40%;
}
.tabMenu, #orgByRoleTab, #orgByOrgTab, #orgByRoleHead, #orgByOrgHead, .orsListTab, .spObjTabMenu {
    width: 100%;
}
.spObjOrgChooseTitle {
    display: block;
    float: left;
    margin-left: 2px;
    margin-right: 12px;
    margin-top: 4px;
}
#spObjOrgTabSelect {
    border: 1px solid rgb(148, 164, 180);
    margin-bottom: 2px;
    margin-top: 2px;
    width: 130px;
}
.orsListTab, .rolesListTab {
    border-collapse: collapse;
    height: 100%;
    width: 100%;
}
#orgByOrgHead, #orgByOrgTab {
    display: none;
}
#orgByOrgHead, #orgByRoleHead {
    border-collapse: separate;
}
#orgByOrgHead, #orgByOrgTab, #orgByRoleHead, #orgByRoleTab {
    border-left: 0 none;
}
#orgByOrgTab, #orgByRoleTab {
    border-collapse: collapse;
    border-right: 1px solid rgb(207, 207, 207);
}
.rsoOrgByRoleTab, .rsoOrgByOrgTab {
    border-bottom: 1px solid rgb(207, 207, 207);
}
.orgName {
    padding-left: 10px;
    padding-top: 5px;
    text-align: left;
    vertical-align: top;
}
.orgDocInfo {
    padding-bottom: 3px;
    padding-top: 3px;
    text-align: left;
}
.roleCellH {
    width: 199px;
}
.rsoRoleCellH {
    width: 154px;
}
#orgByRoleHead .rsoRoleCellH {
    border-left: 1px solid rgb(207, 207, 207);
}
.rsoRoleCell {
    font-weight: bold;
    padding: 9px 10px 9px 7px;
    text-align: left;
    vertical-align: top;
    width: 141px;
}
.searchCell {
    width: 150px;
}
.listCell {
    text-align: left;
}
.rsoOrgNameByOrg {
    border-bottom: 0 none;
    border-top: 1px solid rgb(207, 207, 207);
}
.orgByOrgFirstRow .rsoOrgNameByOrg, .orgByOrgFirstRow .orgInfo {
    border-top: 0 none !important;
}
.orgNameH {
    width: 279px;
}
.rsoOrgNameH {
    width: 400px;
}
#orgByRoleHead .rsoOrgNameH {
    border-left: 1px solid rgb(255, 255, 255) !important;
}
#orgByOrgHead .rsoOrgNameH {
    border-left: 1px solid rgb(207, 207, 207) !important;
}
.orgInfo {
    height: 100%;
    vertical-align: bottom;
}
#orgByRoleHead td, #orgByOrgHead td {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/tab_head2.png") repeat-x scroll 0 0;
    border-color: rgb(216, 216, 216) rgb(173, 173, 173) rgb(173, 173, 173) rgb(255, 255, 255);
    border-style: solid;
    border-width: 1px;
    font-size: 13px;
    font-weight: normal;
    height: 24px;
    text-align: center;
}
.rsoOrgName, .rsoOrgNameByOrg {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/dirIcon.gif") no-repeat scroll 10px 12px;
    border-right: 0 none;
    padding-bottom: 9px;
    padding-left: 7px;
    padding-top: 9px !important;
    vertical-align: top;
    width: 400px;
}
.rsoOrgCellText {
    margin-bottom: 5px;
    margin-left: 20px;
    margin-right: 10px;
    text-align: left;
}
.rsoOrgNameSecond {
    padding-bottom: 4px;
    padding-top: 4px;
    vertical-align: top;
}
.rsoDocLinkByOrg {
    color: rgb(17, 116, 209);
    margin: 0;
    padding-left: 5px;
    text-align: left;
}
.rsoOrgDocCell {
    background-position: center 4px;
}
.spIconCell {
    background-position: -1px 1px !important;
}
.spIconRdCell {
    background-position: -1px 5px !important;
}
.spOrgNameH {
    width: 400px;
}
.spOrgCell {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/dirIcon.gif") no-repeat scroll 10px 12px;
    border-bottom: 1px solid rgb(207, 207, 207);
    border-right: 0 none;
    padding-bottom: 9px;
    padding-left: 7px;
    padding-top: 9px !important;
    width: 400px;
}
.spObjOrgByOrg {
    display: none;
}
.spObjOrgByRole, .spObjOrgByOrg {
    border-left: 1px solid rgb(207, 207, 207);
    border-top: 1px solid rgb(216, 216, 216);
    width: 100%;
}
.spObjOrgByRole td, .spObjOrgByOrg td {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/tab_head2.png") repeat-x scroll 0 0;
    border-color: -moz-use-text-color rgb(173, 173, 173) rgb(173, 173, 173) rgb(255, 255, 255);
    border-style: none solid solid;
    border-width: 0 1px 1px;
    font-weight: normal;
    height: 25px;
    text-align: center;
}
.spOrgCellText {
    margin-bottom: 5px;
    margin-left: 20px;
    margin-right: 10px;
}
.objTepSpVal {
    font-weight: bold;
    padding-left: 3px;
}
.rdLinkSp {
    padding-right: 10px;
    padding-top: 4px;
    vertical-align: top;
    white-space: nowrap;
    width: 50px;
}
.rdLinkSp a {
    white-space: nowrap;
}
.objDescNameSp {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/dots.gif") repeat-x scroll 0 13px;
    white-space: nowrap;
    width: 50%;
}
.objDescNameSp span {
    background-color: rgb(255, 255, 255);
    padding-right: 2px;
}
.spObjDescName, .spObjRealName, .spObjIzoName, .spDescNameAct {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/dots.gif") repeat-x scroll 0 1em;
    vertical-align: top;
    width: 240px;
}
.spObjInfoTepName {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/dots.gif") repeat-x scroll 0 15px;
    vertical-align: top;
}
.spObjInfoTepName, .spObjInfoTepVal {
    padding-top: 2px;
}
.spObjInfoTepVal {
    font-weight: bold;
    padding-left: 2px;
    padding-right: 5px;
    width: 60px;
}
.spObjInfoTepVal span {
    background-color: rgb(255, 255, 255);
    padding-right: 20px;
    text-align: left;
}
.spObjDescVal, .objDescInfo1, .objDescVWrap, .spObjRealVal, .spObjIzoVal {
    font-weight: bold;
    padding-left: 2px;
}
.dateRowTitle {
    padding-left: 20px;
    width: 360px;
}
.grayTitle {
    color: rgb(207, 207, 207);
}
.objTepTab {
    border-top: 1px solid rgb(207, 207, 207);
    margin-top: 15px;
}
.objTepTab .tableTitle {
    height: 22px;
    padding-bottom: 1px;
    padding-top: 8px;
}
.spObjTep .tableTitle {
    padding-bottom: 6px;
}
.spObjTep .tepDataRow td {
    height: 24px;
}
.spObjInfoData {
    background-color: rgb(255, 255, 255);
    padding-left: 20px;
    padding-right: 1px;
}
.spObjTep {
    margin-top: 17px;
}
.spObjInfo td, .tepDataRow td, .spDocInfo .gpzuGrayOrig td, .spDocInfo .docRow td, .spDocInfo .refRow td, .spPlanTab td, .spMainTepTab td, .spObjRealRow td, .spObjIzoRow td {
    padding-bottom: 7px;
}
.spInfoLeft, .spInfoRight {
    padding-bottom: 0 !important;
    vertical-align: top;
}
.spInfoLeft {
    width: 55%;
}
.spInfoRight {
    padding-left: 15px;
    width: 45%;
}
.spDocInfo td {
    height: 22px;
}
.spOrgInfo td {
    padding-bottom: 5px;
}
.spOrgInfo .tableTitle {
    padding-bottom: 4px !important;
    padding-top: 8px !important;
}
#spObjMoreDetails {
    width: 100px;
}
#spObjMoreDetails .spObjLinkWrap {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/i_icon.gif") no-repeat scroll 0 80%;
    float: right;
    height: 18px;
    padding-top: 8px;
    width: 6.8em;
}
#spObjFilterWrap {
    width: 185px;
}
#spObjFilterList {
    list-style: outside none none;
    margin-top: 6px;
}
#spObjFilterList li {
    float: left;
}
#fdocTabAll, #fdocTabFiltr1, #fdocTabFiltr2, #fdocTabCut {
    padding: 2px 5px;
}
#fdocTabAll:hover, #fdocTabFiltr1:hover, #fdocTabFiltr2:hover, #fdocTabCut:hover {
    cursor: pointer;
}
#fdocTabFiltr1, #fdocTabCut {
    margin-left: 5px;
    margin-right: 5px;
}
.filterWhiteLink {
    background-color: rgb(255, 255, 255);
}
.filterWhiteLink a {
    color: rgb(17, 116, 209);
    text-decoration: underline;
}
.filterActiveLink {
    background-color: rgb(54, 110, 155);
}
.filterActiveLink a {
    color: rgb(255, 255, 255);
    text-decoration: none;
}
#rdBottom {
    border-bottom: 0 none;
}
#rsoOrgTabTitle, #orgTabTitle, #tepTitleWrap, #spPrDiagTitleWrap {
    float: left;
    font-size:12pt
}
#docTitleWrap span{
    border-bottom: 1px dashed #000000;
    cursor:pointer;
}
#rsoOrgDetailLink, #orgDetailLink {
    font-weight: normal;
}
.closerLinkWrap, .prClosLinkWrap, .fInfoClosLinkWrap, .sInfoClosLinkWrap, .diagClosLinkWrap, .sInfoPasLinkWrap {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/i_icon.gif") no-repeat scroll 0 80%;
    float: right;
    height: 20px;
    margin-top: -2px;
    width: 6.5em;
}
.closerLink {
    border-bottom: 1px dashed;
    color: rgb(17, 116, 209);
    display: block;
    font-weight: normal;
    margin: 2px 0 0;
    text-decoration: none;
    width: 55px;
}
.passiveLink {
    border-bottom: 0 none;
    color: rgb(153, 153, 153);
    float: right;
    font-weight: normal;
    margin-right: 12px;
    margin-top: 4px;
    width: 55px;
}
.closerLink:hover {
    cursor: pointer;
}
.openSwitch #spObjTepCloserLink, .openSwitch #spPrFInfoClosLink, .openSwitch #spPrShInfoClosLink, .openSwitch #spPrDiagClosLink {
    width: 6.5em;
}
.closeSwitch, .openSwitch {
    padding: 0 0 0 20px;
}
.closeSwitch #spObjTepCloserLink, .closeSwitch #spPrFInfoClosLink, .closeSwitch #spPrShInfoClosLink, .closeSwitch #spPrDiagClosLink {
    width: 4em;
}
.tepDataRow {
    display: none;
}
.raspDoc .spObjRdRow {
    display: none;
}
.infoYearCell {
    font-weight: bold;
    width: 81px;
}
.spOrgInfoYearCell {
    font-weight: bold;
    padding-left: 3px;
    padding-top: 2px;
    vertical-align: top;
    width: 35px;
}
.objectCount a {
    color: rgb(137, 137, 137);
    font-weight: bold;
    text-decoration: underline;
}
.objectCount a:hover {
    color: rgb(0, 51, 153);
    cursor: pointer;
}
.progParamName {
    width: 300px;
}
.progParamType {
    width: 200px;
}
.progParamValue, .spProgRdEmpty {
    font-weight: bold;
}
.progDateInfo {
    margin-bottom: 1em;
}
.progRdDoc, .spProgShortInfo, .spProgDiagram {
    margin-bottom: 14px;
    margin-top: 0;
}
.spProgFullInfo {
    margin-bottom: 2px;
    margin-top: 0;
}
.spProgShortLeft table, .spProgShortCentral table {
    border-collapse: collapse;
}
.spProgRdLeft {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/pointCell.png") repeat-x scroll 0 5px;
    width: 300px;
}
.spPrInfoPoints {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/pointCell.png") repeat-x scroll 0 3px;
}
.spProgLeftFirst {
    background-position: 0 10px;
    padding-bottom: 3px;
    padding-top: 8px;
}
.spRdLeftWrap {
    background-color: rgb(255, 255, 255);
    font-weight: bold;
}
.spPrInfoWhiteWrap {
    background-color: rgb(255, 255, 255);
    padding-right: 3px;
    text-align: right;
}
#progConditionWrap {
    display: block;
    height: 0;
    left: 44%;
    position: relative;
    top: 3px;
    width: 180px;
}
#spProgCondition {
    color: rgb(255, 255, 255);
    display: block;
    font-weight: bold;
    margin-right: 0 !important;
    padding-bottom: 2px;
    padding-top: 2px;
    text-align: center;
}
.conditionGreen {
    background-color: rgb(0, 142, 0);
    display: block;
    margin-right: 0;
    width: 100px;
}
.conditionBlue {
    background-color: rgb(94, 189, 225);
    margin-right: 0;
}
.spRoleCellH {
    width: 119px;
}
.spRoleCell {
    border-bottom: 1px solid rgb(207, 207, 207);
    font-weight: bold;
    padding-bottom: 9px;
    padding-left: 7px;
    padding-top: 9px;
    text-align: left;
    vertical-align: top;
    width: 111px;
}
.spOrgIconCell {
    background-position: 2px 10px !important;
    width: 22px;
}
.spOrgDocCell {
    border-bottom: 1px solid rgb(207, 207, 207);
    height: 23px;
    padding-top: 9px;
    text-align: left;
    vertical-align: top;
}
.spOrgDocCell a {
    padding-left: 15px;
}
.spDocHeader4 {
    font-size: 1.3em;
    font-weight: bold;
    margin-left: 134px;
    text-align: center;
}
.spObjHeadTab {
    border-collapse: collapse;
    margin-bottom: 0;
    width: 100%;
}
.spObjStatusCell, .spProgStatusCell {
    padding-left: 20px;
    text-align: -moz-right;
    vertical-align: top;
    width: 130px;
}
.spObjStatusCell {
    padding-top: 0;
}
.spObjStatusCell .finishPic2, .spObjStatusCell .planPic6, .spObjStatusCell .buildPic4 {
    background-position: 100% 0 !important;
    margin-top: 10px;
    width: 100% !important;
}
.spProgStatusCell {
    padding-top: 1px;
}
.spObjNameHead {
    color: rgb(23, 107, 185);
    font-size: 1.7em;
    margin-bottom: 0.1em;
    text-align: center;
}
.spObjNameHead, .spObjSetAddr {
    padding-left: 200px;
}
.spObjSetAddr, .spProgSetAddr {
    color: rgb(1, 153, 176);
    font-size: 1.3em;
    font-weight: bold;
    margin-bottom: 0.1em;
    text-align: left;
}
.spProgNameFull {
    font-size: 1.3em;
    font-weight: bold;
    margin-bottom: 5px;
    text-align: left;
}
#spObjStatus {
    color: rgb(255, 255, 255);
    cursor: default;
    display: inline-block;
    font-weight: bold;
    margin: 0;
    padding: 2px 7px 2px 8px;
    white-space: nowrap;
}
.spObjStatusRed {
    background-color: rgb(255, 0, 0);
}
.spObjStatusGreen {
    background-color: rgb(0, 128, 0);
}
.spProgDateInfo {
    margin-bottom: 1em;
    text-align: center;
}
.spProgNarrowTitle .spProgNameFull, .spProgNarrowTitle .spProgDateInfo, .spProgNarrowTitle .spProgSetAddr {
    margin-left: 0;
}
.spProgWideTitle .spProgNameFull, .spProgWideTitle .spProgDateInfo, .spProgWideTitle .spProgSetAddr {
    margin-left: 165px;
}
.spProgNarrowTitle div {
    margin-right: 20px;
}
.spProgWideTitle div {
    margin-right: 10px;
}
.spDocTypeWrap {
    display: block;
    float: left;
    padding-left: 20px;
    width: 200px;
}
.spDocNumbWrap {
    display: block;
    float: left;
    width: 200px;
}
.spDocDateWrap {
    display: block;
    float: left;
    padding-right: 10px;
}
#orgByRoleSelect {
    width: 140px;
}
.spDocByOrg {
    width: 100%;
}
.spDocByOrg a {
    padding-left: 5px;
}
span.spDocNumber {
    padding-left: 5px;
}
.spDocStatusWrap {
    color: rgb(137, 137, 137);
    padding-left: 5px;
}
.spObjTabCounter {
    border-right: 1px solid rgb(195, 195, 195);
    padding-right: 9px;
}
.spProgMapLinkCell {
    padding-left: 8px !important;
}
.spProgSelectCell {
    border-right: 1px solid rgb(207, 207, 207);
    padding-right: 8px;
}
table.object_list tr.even td {
    background-color: rgb(239, 239, 239);
}
table.object_list tr.odd td {
    background-color: rgb(255, 255, 255);
}
table.object_list tr.even td, table.object_list tr.odd td {
    border-bottom: 1px solid rgb(217, 217, 217);
}
table.object_list tr.head .TD, table.object_list tr.head .sortArrowTD {
    border-bottom: 1px solid rgb(173, 173, 173) !important;
    border-right: 1px solid rgb(173, 173, 173) !important;
    border-top: 0 none;
}
table.object_list {
    border-left: 1px solid rgb(217, 217, 217);
    border-right: 1px solid rgb(217, 217, 217);
}
.spProgWrap {
    padding-left: 0;
    padding-right: 16px;
}
.spProgStrutStick {
    width: 100%;
}
.spProgPageTitle {
    margin-left: 3px;
    text-align: center;
    width: 100%;
}
.spProgMenu #menuTabRight div {
    text-align: right;
}
#menuTabRight table {
    margin-bottom: -2px;
    padding-top: 2px;
}
.spProgMenu #mapLink {
    float: right;
    padding-right: 0;
    width: auto !important;
}
.spProgMenu ul#rightSubmenu {
    padding-top: 0;
}
.spProgMenu ul#rightSubmenu li {
    padding-left: 21px;
}
.spObjMenu #mapLink {
    padding-left: 15px !important;
    padding-right: 8px;
}
#mapLink {
    width: 3em;
}
.spObjMenu #printLink {
    margin-left: 11px;
    padding-left: 18px !important;
    padding-right: 0 !important;
}
.spObjMenu #printLink, .spProgMenu #printLink {
    width: 3.5em;
}
.spProgMenu #printLink {
    padding-left: 17px !important;
    padding-right: 4px !important;
}
.spProgFiltBorder {
    border-bottom: 1px solid rgb(207, 207, 207);
    height: 3px;
    width: 100%;
}
table.switchers_panel {
    margin-top: 2px;
}
.spProgFilter .multiselect {
    width: 100%;
}
.spProgFilter .filterLeftColumn {
    text-align: left;
    vertical-align: top;
    width: 200px;
}
.spProgFilter .openOuterDic {
    background-position: 0 2px;
    margin-left: 0 !important;
    padding-left: 22px;
}
.progFilterInpWrap {
    margin: 0 0 4px;
    padding: 0;
}
.progFilterInpWrap input {
    margin-top: 2px;
}
.spProgCheckRow .filterRightColumn {
    padding-left: 10px;
}
.spProgCheckRow .savedFilterCheckLabel {
    margin-left: -6px;
}
.spProgFilter .progFilterInpWrap {
    margin-bottom: 0;
}
#spObjSearchPanel {
    border-top: 1px solid rgb(207, 207, 207);
    margin-top: 2px;
}
.progObjListLink {
    font-weight: normal !important;
}
#tipbox-content {
    padding: 3px 5px;
    width: 400px;
}
#tipbox-content, #tipbox-content div, #tipbox-content div span {
    background-color: rgb(248, 240, 216) !important;
}
.tipbox-default #tipbox-container {
    border-color: rgb(207, 187, 127) !important;
}
table.navigationPanel {
    margin-top: 4px;
}
.navigationPanel .gotoPageFunc td {
    padding-left: 7px;
}
.navigationPanel #tabLeftCol td {
    padding-left: 4px;
}
#mainBlock {
    margin-top: 4px;
}
#loader {
    background-color: rgb(255, 255, 255);
    height: 200px !important;
    padding-top: 200px;
    vertical-align: middle;
    width: 650px !important;
}
#spObjBuildProc {
    padding-top: 12px !important;
}
.spObjSectActiveLink {
    color: rgb(0, 51, 153) !important;
}
.nextBtnEnabledBottom_hover, .nextBtnEnabled_hover, .prevBtnEnabled_hover {
    border: 0 none !important;
}
#graphDialogLink:hover {
    cursor: pointer;
}
#graphDialogLink:visited, #graphDialogLink:hover, #graphDialogLink::after {
    color: rgb(0, 0, 0);
}
.rsoRoleCell {
    border-bottom: 0 none !important;
    height: 100%;
}
#orgByRoleTab tbody tr td.rsoRoleCell, #orgByOrgTab tbody tr td.rsoOrgNameByOrg {
    border-left: 1px solid rgb(207, 207, 207) !important;
}
.orgByOrgSimpleRow table tr .rsoRoleCell {
    border-top: 1px solid rgb(207, 207, 207) !important;
}
.rsoOrgNameSecond {
    border-bottom: 0 none !important;
    height: 100%;
    text-align: left;
}
.orgByOrgSimpleRow table tr .rsoOrgNameSecond {
    border-top: 1px solid rgb(207, 207, 207) !important;
}
.orgByOrgFirstRow .rsoOrgNameByOrg, .orgByOrgFirstRow .rsoByOrgFirst .rsoByOrgFirstRow .rsoRoleCell, .orgByOrgFirstRow .rsoByOrgFirst .rsoByOrgFirstRow .rsoOrgNameSecond {
    border-top: 0 none !important;
}
.rsoByOrgSimpleRow .rsoRoleCell, .rsoByOrgSimpleRow .rsoOrgNameSecond {
    border-top: 1px solid rgb(207, 207, 207);
}
.rsoByRoleFirstRole .rsoByRoleFirstRow .rsoOrgName, .rsoByRoleFirstRole .rsoByRoleFirstRow .rsoOrgNameSecond {
    border-top: 0 none !important;
}
.rsoByRoleSimpleRow .rsoOrgName, .rsoByRoleSimpleRow .rsoOrgNameSecond, .rsoByRoleSimpleRole .rsoByRoleFirstRow .rsoOrgName, .rsoByRoleSimpleRole .rsoByRoleFirstRow .rsoOrgNameSecond {
    border-top: 1px solid rgb(207, 207, 207);
}
.rsoByRoleFirstRole .rsoRoleCell {
    border-top: 0 none !important;
}
.rsoByRoleSimpleRole .rsoRoleCell {
    border-top: 1px solid rgb(207, 207, 207);
}
.orsListTabCell {
    vertical-align: top;
}
.spObjDataCell {
    height: 18px;
    padding-bottom: 3px;
    padding-top: 7px;
}
.spObjDataCell span {
    font-weight: bold;
}
.spObjRealDataInfo {
    color: rgb(0, 115, 140);
}
.spObjRealData {
    background-color: rgb(0, 115, 140);
    color: rgb(255, 255, 255);
    margin-right: 5px;
    padding-left: 5px;
    padding-right: 5px;
}
#back_view_link {
    background: rgb(255, 255, 255) url("/portal_static/img/isio/backButton_Blue.gif") no-repeat scroll 0 1px;
    border-right: 1px solid rgb(173, 173, 173);
    color: rgb(17, 116, 209);
    display: block;
    float: left;
    margin-right: 5px;
    padding-right: 5px;
    text-align: right;
    text-decoration: underline;
    width: 56px;
}
#back_view_link:hover {
    color: rgb(0, 51, 153);
}
.spObjIkCondCell {
    width: 184px;
}
.spObjIkCondCell div {
    padding-bottom: 2px;
    padding-top: 2px;
}
.rightSectTContent {
    float: left;
}
.rightSectTitle .detailLinkWrap {
    float: right;
}
#hodLink {
    color: rgb(17, 116, 209);
    font-weight: normal;
}
.spDazuRow .spDazuStatus {
    width: 150px;
}
.spStatCell {
    font-size: 1.1em;
    font-weight: bold;
    text-align: center;
    vertical-align: middle;
}
.tableTitle {
    font-weight: bold;
}
.spObjCountWrap {
    color: rgb(175, 175, 175);
}
.spStatDepartTitle td, .spStatDepartVal td {
    text-align: center;
}
.spStatKontrVal, .spStatObjVal {
    width: 70px;
}
.spStatDepartTitle td {
    border-top: 1px solid rgb(217, 217, 217);
    font-size: 0.9em;
}
.spDepartValName {
    text-align: left !important;
}
.oddRow td {
    background-color: rgb(255, 255, 255);
}
.evenRow td {
    background-color: rgb(239, 239, 239);
}
.spStatCell, .spStaticNames {
    border-bottom: 1px solid rgb(217, 217, 217);
    padding-bottom: 10px;
    padding-top: 10px;
}
.spStatDepartTab, .spStatDepartLeft {
    display: none;
    width: 100%;
}
.spStatDepartTab {
    padding-bottom: 10px;
}
.spStatDepartLeft td {
    height: 22px;
}
.spNumbDown, .spNumbUp {
    float: left;
    height: 16px;
    margin-top: 3px;
    width: 16px;
}
.spNumbDown {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/down_arrow.gif") no-repeat scroll 7px 20%;
}
.spFullSwitchDown {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/down_arrow.gif") no-repeat scroll 99% 20%;
}
.spNumbUp {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/up_arrow.gif") no-repeat scroll 7px 20%;
}
.spFullSwitchUp {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/up_arrow.gif") no-repeat scroll 99% 20%;
}
.spStaticNames div {
    height: 22px;
    text-align: left;
    vertical-align: middle;
}
.spStatBlue {
    color: rgb(6, 115, 215);
}
.spStatDepartVal td, .spStatDepartVal td {
    height: 22px;
    vertical-align: middle;
}
.spStatKontrVal {
    font-weight: bold;
}
.spStaticCombText {
    font-size: 1.1em;
    text-align: right;
    width: 100px;
}
#spStatTabHeader td {
    height: 22px;
    text-align: left;
    vertical-align: middle;
}
.spStatHeadWrap {
    float: left;
    padding-left: 254px;
}
.spStaticFullSwitcher {
    height: 16px;
    width: 16px;
}
.spStaticDataRow {
    display: none;
}
#mainBlock {
    margin-left: 0;
    margin-right: 0;
}
.rsoRightBordCell {
    height: 13px;
    vertical-align: top;
}
.spRealHeadWrap {
    border-top: 1px solid rgb(207, 207, 207);
    margin-top: 4px;
    padding-top: 2px;
    text-align: left;
}
.spRealHeadWrap div {
    padding-bottom: 2px;
    padding-top: 2px;
}
.spObjEmptyRight {
    height: 1px;
    padding-top: 1px;
    vertical-align: top;
}
.spProgShortLeft, .spProgShortCentral {
    vertical-align: top;
}
.spProgShortLeft {
    width: 560px;
}
.spProgShortCentral {
    width: 300px;
}
.spProgShortLeft table, .spProgShortCentral table, .spProgShortRight table {
    width: 100%;
}
.spProgShortLeft .titleRow td, .spProgShortCentral .titleRow td {
    font-style: italic;
    font-weight: bold;
}
.spProgShortLeft table td, .spProgShortCentral table td {
    white-space: nowrap;
}
.spProgShortRight {
    padding-top: 5px;
    vertical-align: top;
    width: 260px;
}
.spProgShortRight div {
    float: left;
    padding-right: 10px;
    padding-top: 3px;
}
.spProgInfoTitle td {
    border-color: -moz-use-text-color rgb(201, 201, 201) rgb(201, 201, 201) -moz-use-text-color;
    border-style: none solid solid none;
    border-width: 0 1px 1px 0;
    padding-bottom: 5px;
    padding-top: 5px;
    text-align: center;
}
.spProgInfoSecond td {
    background-color: rgb(201, 201, 201);
    padding-left: 5px;
    padding-right: 5px;
    vertical-align: top !important;
}
.spProgInfoRow td {
    border-bottom: 1px solid rgb(207, 207, 207);
    text-align: right;
}
.spProgInfoView {
    text-align: left !important;
}
.spProgInfoEvenRow td {
    background-color: rgb(222, 222, 222);
}
.spProgInfoOddRow td {
    background-color: rgb(255, 255, 255);
}
.spProgBigCell {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/progInfoBack_Big.jpeg") repeat-x scroll 0 0;
}
.spProgSmallCell {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/progInfoBack_Small.jpeg") repeat-x scroll 0 0;
}
.spProgInfoSecond td {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/progInfoBack_Small_42.jpeg") repeat-x scroll 0 0;
}
.spProgCheckRow .spProgCheckCell {
    padding-right: 5px;
    padding-top: 5px;
    width: 10px;
}
.spProgCheckRow td {
    vertical-align: middle;
}
.infoCell {
    padding-left: 5px;
    padding-right: 5px;
}
.spProgCount40Col {
    width: 55px;
}
.spProgCheckRow .excelCell {
    padding-left: 20px;
}
.spProgCheckRow .fullInfoBordCell {
    border-right: 1px solid rgb(207, 207, 207);
    height: 20px;
    width: 1px;
}
.spProgExpOpen, .spProgExpClose {
    float: left;
    height: 16px;
    width: 16px;
}
.spProgExpOpen {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/spTab_Minus.gif") no-repeat scroll 1px 1px;
}
.spProgExpClose {
    background: rgba(0, 0, 0, 0) url("/portal_static/img/isio/spTab_Plus.gif") no-repeat scroll 1px 1px;
}
.spPrActiveRdLink {
    border: 2px solid rgb(255, 255, 255);
}
.spPrGroup1, .spPrGroup2, .spPrGroup3 {
    display: none;
}
.spProgRightColNorm, .spProgRightColWide {
    border-top: 1px solid rgb(217, 217, 217);
}
.spProgRightColNorm {
    width: 80px;
}
.spProgRightColWide {
    width: 96px;
}
.spPrRightCellNorm, .spPrRightCellWide {
    width: 82px;
}
.spProgInfoRow .infoCell a, .spProgInfoRow .spProgCount40Col a, .spProgInfoRow .infoCell div, .spProgInfoRow .spProgCount40Col div {
    padding-right: 5px;
}
#spProgPartSwitch {
    text-align: -moz-center;
    width: 120px;
}
.regB_PlanStr {
    padding-bottom: 7px;
}
#spProgContrWrap {
    border-top: 1px solid rgb(207, 207, 207);
    margin-top: 4px;
    padding-top: 4px;
}
div.newProgActionsBlock {
    margin: 8px 0 5px;
    padding: 0;
}
ul.newProgActionsList {
    margin: 0;
    overflow: hidden;
    padding: 0;
}
ul.newProgActionsList li {
    background-position: 5px 4px;
    background-repeat: no-repeat;
    border: 0 none;
    float: left;
    list-style: outside none none;
    margin: 0 6px 0 0;
    padding: 3px 8px 5px 26px;
    position: relative;
}
ul.newProgActionsList li.selectedLi a {
    color: rgb(0, 0, 0) !important;
    text-decoration: none;
}
ul.newProgActionsList a, ul.newProgActionsList a:visited {
    color: rgb(17, 116, 209);
}
ul.newProgActionsList li.selectedLi {
    background-color: rgb(241, 240, 238) !important;
}
ul.newProgActionsList li#progMapLink {
    background-image: url("/portal_static/img/isio/globe_icon.gif");
}
ul.newProgActionsList li#progPrintLink {
    background-image: url("/portal_static/img/isio/print_icon.gif");
}
ul.newProgActionsList li#card_menu {
    background-image: url("/portal_static/img/isio/docIcon.gif");
}
ul.newProgActionsList li#card_menu_program_card_execution_control, ul.newProgActionsList li#card_menu_program_card_execution_control4204 {
    background-image: url("/portal_static/img/isio/control_ico.gif");
}
.userTextComment {
    border-bottom: 1px solid rgb(217, 217, 217);
    padding: 0.15em 3em;
    text-align: justify;
    text-indent: 1.5em;
    width: auto;
}
.userText {
    padding: 0.15em 3em;
    text-align: justify;
    text-indent: 1.5em;
    width: auto;
}
.nested-list {
  padding-left: 3px;
}
.nested-list li {
  display: block;
  margin-left: 18px;
}
.nested-list li[data-leaf="1"]::before {
  content: url("/portal_static/img/indent.png");
  margin-right: 2px;
  margin-left: -18px;
}
.nested-list ul {
  list-style: none;
}
.nested-list ul ul {
  margin-left: 20px;
  margin-top: 4px;
}
</style>