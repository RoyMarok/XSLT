<style>
*:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
body {
    margin: 0;
    font-family: 'PTSans', sans-serif;
    background-color: #fff;
    background-color: #eef2f4;
}
textarea{
    font-family: 'PT Sans', sans-serif;
    color: #1E1E1E;
    width: 100%;
}

.frmWrapp{

}
.frmContainer{
    background-color: white;
    margin: 0 auto;
    padding: 20px 86px;
    border-radius: 5px;
    border: 1px solid #bcbcbc;
    box-sizing: border-box;
    width: 1015px;
    position: relative;
    overflow: hidden;
}
.frmBlock{
    border-bottom: 1px solid #e8edf0;
    padding-bottom: 50px;
    margin-bottom: 50px;
    position: relative;
}
.frmBlockHeader{
    border: none;
}
.frmBlockHeader:before{
    content: '';
    position: absolute;
    z-index: 0;
    width: calc(100% + 172px);
    background-color: #e8edf0;
    height: calc(100% + 20px);
    margin-left: -86px;
    margin-top: -20px;
}
.frmBlock h1{
    text-align: center;
}
.frmBlock h2{
    padding: 0;
    margin: 0;
    text-align: center;
    font-size: 22px;
    font-weight: normal;
    margin-bottom: 30px;
}
.frmLine{
    position: relative;
    z-index: 100;
}
.frmLine.overflow{
    z-index: 200;
}
.frmLine:not(:last-child){
    margin-bottom: 10px;
}
.frmElement__left{
    display: inline-block;
}

.frmElement_label{
    display: inline-block;
    padding: 0 10px;
    vertical-align: top;
    line-height: 32px;
    text-align: right;
}
.frmElement_label:first-line{
    line-height: 32px;
}

.multiline .frmElement_label,
.multiline .frmElement_label:first-line
{
    line-height: initial;
    margin-top: -4px;
}

.frmElement_frmField{
    display: inline-block;
    box-sizing: border-box;
    vertical-align: top;
}
.frmElement__full{
    width: calc(100% - 40px);
    margin: 0 20px;
}
.frmElement__left .frmElement_label{
    text-align: right;
    width: 230px;
    width: 188px;

}
.frmElement__left_xs .frmElement_frmField{
    width: 115px;
}
.frmElement__left_s .frmElement_frmField{
    width: 166px;
}
.frmElement__left_m .frmElement_frmField{
    width: 248;
}
.frmElement__left_l .frmElement_frmField{
    width: 321px;
}
.frmElement__left_xl .frmElement_frmField{
    width: 604px;
}
.frmElement__left_xxl .frmElement_frmField{
    width: 653px;
}

.frmElement__mid {
    display: inline-block;
}
.frmElement__mid_s{
    width: 173px;
}
.frmElement__mid_s .frmElement_frmField{
    width: 124px;
}

.frmElement__right{
    display: inline-block;
    margin-left: 60px;
}
.frmElement__right .frmElement_frmField{
    /*float: right;*/
}
.frmElement__right_xs .frmElement_frmField{
    width: 70px;
}
.frmElement__right_s{
    width: 250px;
}
.frmElement__right_s .frmElement_label{
    width: 83px;
}

.frmElement__right_s .frmElement_frmField{
    width: 167px;
}
.frmElement__right_m .frmElement_label{
    width: 92px;
}
.frmElement__right_m .frmElement_frmField{
    width: 248px;
}

.frmElement_frmField input[type="text"],
.frmElement_frmField textarea,
.frmElement_frmField select
{
    border-radius: 2px;
    height: 32px;
    line-height: 30px;
    border: 1px solid #bcbcbc;
    transition: all .3s;
    padding: 0 10px;
    outline: none;
    width: 100%;
    font-size: 14px;

}
.frmElement_frmField textarea{
    resize: vertical;
}
.frmElement_frmField input[type="text"].hasDatepicker{
    z-index: 4;
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAALAQMAAACaiUUfAAAABlBMVEUAAAB8j6SVLMuOAAAAAXRSTlMAQObYZgAAABZJREFUCNdj4HsHRUDw7h0YQdgPIAgAx3cN8yjqQUUAAAAASUVORK5CYII=');
    background-position: calc(100% - 7px);
    background-repeat: no-repeat;
}
.frmElement_frmField input[type="text"].hasDatepicker+img{
    position: absolute;
    margin-left: -25px;
    opacity: 0;
    cursor: pointer;
}
.frmElement_frmField input[type="text"]:hover,
.frmElement_frmField input[type="text"]:focus
{
    border-color: #41a3e0;
}
.tokenWrapper{

    /*transition: all .3s;*/
    width: 100%;
}
ul.token-input-list{
    width: 100%;
    border-radius: 2px;
    border: 1px solid #bcbcbc;
}
.frmSwitch_checkbox{
    position: relative;
    display: inline-block;
    margin: 0;
    cursor: pointer;
    border-radius: 30px;
    width: 42px;
    height: 21px;
    color: #dcf2f8;
    background-color: #319adc;
    top: 6px;
    text-align: initial;
}
.frmSwitch_checkbox:before{
    content: '';
    position: absolute;
    background-image: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRkZGRkZGIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjIiIGJhc2VQcm9maWxlPSJ0aW55IiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxwb2x5Z29uIHBvaW50cz0iOTEuMjUsMzIuNSA3Ni4yNSwxNy41IDQxLjI1LDUyLjUgMjMuNzUsMzUgOC43NSw1MCA0MS4yNSw4Mi41ICAiLz48L3N2Zz4=);
    width: 11px;
    height: 11px;
    background-size: 100%;
    background-repeat: no-repeat;
    left: 5px;
    top: 5px;
}
.frmSwitch_checkbox:after{
    content: '';
    position: absolute;
    background-image: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRkZGRkZGIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjIiIGJhc2VQcm9maWxlPSJ0aW55IiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxwb2x5Z29uIHBvaW50cz0iMjcuNSw4Ny41IDUwLDY1IDcyLjUsODcuNSA4Ny41LDcyLjUgNjUsNTAgODcuNSwyNy41IDcyLjUsMTIuNSA1MCwzNSAyNy41LDEyLjUgMTIuNSwyNy41IDM1LDUwIDEyLjUsNzIuNSAgIi8+PC9zdmc+);
    width: 12px;
    height: 12px;
    background-size: 100%;
    background-repeat: no-repeat;
    right: 3px;
    top: 5px;
}
.frmSwitch_checkbox input{
    position: absolute;
    opacity: 0;
    margin: 4px 0 0;
    margin-top: 1px \9;
    line-height: normal;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 0;
}
.frmSwitch_checkbox i{

}
.frmSwitch_checkbox i:before{
    position: absolute;
    top: -1px;
    right: -1px;
    bottom: -1px;
    left: -1px;
    background-color: #fff;
    background-color: #eceaea;
    /*border: 1px solid #f0f0f0;*/
    border-radius: 30px;
    content: "";
    -webkit-transition: all .2s;
    transition: all .2s;
}
.frmSwitch_checkbox i:after{
    position: absolute;
    top: 1px;
    bottom: 1px;
    width: 18px;
    background-color: #fff;
    border-radius: 50%;
    content: "";
    -webkit-box-shadow: 1px 1px 3px rgba(0,0,0,0.25);
    box-shadow: 1px 1px 3px rgba(0,0,0,0.25);
    -webkit-transition: margin-left .3s;
    transition: margin-left .3s;
    width: 19px;
}
.frmSwitch_checkbox input:checked+i:before {
    top: 50%;
    right: 5px;
    bottom: 50%;
    left: 50%;
    border-width: 0;
    border-radius: 5px;
}
.frmSwitch_checkbox input:checked+i:after{
    margin-left: 17px;
    margin-left: 22px;
}

@-webkit-keyframes pulse {
    0%{transform: scale(1);}
    50%{transform: scale(1.1);}
}
@keyframes pulse {
    0%{transform: scale(1);}
    50%{transform: scale(1.1);}
}
@keyframes zoom_in {
    0%{transform: scale(0);}
    25%{transform: scale(1.2);}
    50%{transform: scale(1);}
    75%{transform: scale(1.05);}
    100%{transform: scale(1);}
}
@-webkit-keyframes zoom_in {
    0%{transform: scale(0);}
    25%{transform: scale(1.2);}
    50%{transform: scale(1);}
    75%{transform: scale(1.05);}
    100%{transform: scale(1);}
}

@keyframes button_hover{
    0%{
        background-color: #169bd5;
    }

    50%{
        background-color: #0072ff;
    }

    100%{
        background-color: #169bd5;
    }
}

/* checkbox animation */
@-webkit-keyframes checkbox-on {
    0% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 15px 2px 0 11px; }
    50% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px 2px 0 11px; }
    100% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px; }
}
@keyframes checkbox-on {
    0% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 15px 2px 0 11px; }
    50% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px 2px 0 11px; }
    100% { box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px; }
}
.checkbox{
    position: relative;
}
 .overTrop {
    width: 20px;
    height: 20px;
    border: 1px solid #D9DBDD;
    overflow: hidden;
    background-image: none;
    background-repeat: no-repeat;
    background-position: 3px -24px;
    background-attachment: scroll;
    position: absolute;
    left: 0;
    top: 0;
    z-index: 1;
    cursor: pointer;
    border-radius: 2px;
    border-color: #bcbcbc;
    background-color: transparent;
    transition: all .1s;
    overflow: visible;

}
 .overTrop:before {
    position: absolute;
    content: '';
    /*-webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    -o-transform: rotate(45deg);
    transform: rotate(45deg);*/
    display: block;
    margin-top: -3px;
    margin-left: 7px;
    width: 0;
    height: 0;
    -webkit-box-shadow: 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0 inset;
    box-shadow: 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0 inset;
    transition: all .3s;
    color: white;

    margin-top: 2px;
    margin-left: 2px;
    width: 15px;
    height: 15px;
    background-size: 100%;
    background-repeat: no-repeat;
    background-image: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRkZGRkZGIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjIiIGJhc2VQcm9maWxlPSJ0aW55IiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxwb2x5Z29uIHBvaW50cz0iOTEuMjUsMzIuNSA3Ni4yNSwxNy41IDQxLjI1LDUyLjUgMjMuNzUsMzUgOC43NSw1MCA0MS4yNSw4Mi41ICAiLz48L3N2Zz4=);

}
.overTrop.checked,
input:checked+.overTrop
  {
    border: 1px solid #0086bd;
    border-color: #319ADC;
    background-color: #319ADC;
}
.overTrop.checked:before,
input:checked+.overTrop:before {
    color: #0086bd;
    color: #319ADC;
    /*-webkit-box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px;
    box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px;
    -webkit-animation: checkbox-on 0.3s forwards;
    -o-animation: checkbox-on 0.3s forwards;
    animation: checkbox-on 0.3s forwards;*/
    animation: zoom_in 1s ease-in-out forwards;


}
 input[type=checkbox][disabled] + span.overTrop {
    border-color: #ccc;
    opacity: .8;
    cursor: default;
}
 input[type=checkbox][disabled] + span.overTrop:before {
    color: #ccc;
    opacity: .8;
}


input.masked[type="checkbox"] {
    position: relative;
    margin-top: 7px;
    z-index: 200;
    margin: 0;
    width: 20px;
    height: 20px;
    cursor: pointer;
    opacity: 0;
    -moz-opacity: 0;
    -khtml-opacity: 0;
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    top: 4px;
}
.checkbox+label{
    margin-left: 10px;
}

.multiBlock{
    border-width: 1px;
    border-style: solid;
    border-color: #eef2f4;
    border-radius: 4px;
    overflow: hidden;

    margin-bottom: 20px;
}
.multiBlock_header{
    background-color: #eef2f4;
    line-height: 31px;
    padding-left: 30px;
    position: relative;

}
.multiBlock_headerLabel{
    opacity: 0;
    transition: all .3s;
}
.multiBlock.collapse .multiBlock_headerLabel{
    opacity: 1;
}
.multiBlock_header:before{
    content: '';
    position: absolute;
    background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8IS0tIENyZWF0b3I6IENvcmVsRFJBVyBYOCAtLT4NCjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWw6c3BhY2U9InByZXNlcnZlIiB3aWR0aD0iMTczLjQzOG1tIiBoZWlnaHQ9IjIxOS4zNzVtbSIgdmVyc2lvbj0iMS4xIiBzdHlsZT0ic2hhcGUtcmVuZGVyaW5nOmdlb21ldHJpY1ByZWNpc2lvbjsgdGV4dC1yZW5kZXJpbmc6Z2VvbWV0cmljUHJlY2lzaW9uOyBpbWFnZS1yZW5kZXJpbmc6b3B0aW1pemVRdWFsaXR5OyBmaWxsLXJ1bGU6ZXZlbm9kZDsgY2xpcC1ydWxlOmV2ZW5vZGQiDQp2aWV3Qm94PSIwIDAgMTczNDQgMjE5MzgiDQogeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiPg0KIDxkZWZzPg0KICA8c3R5bGUgdHlwZT0idGV4dC9jc3MiPg0KICAgPCFbQ0RBVEFbDQogICAgLmZpbDAge2ZpbGw6IzM3MzgzOX0NCiAgIF1dPg0KICA8L3N0eWxlPg0KIDwvZGVmcz4NCiA8ZyBpZD0iTGF5ZXJfeDAwMjBfMSI+DQogIDxtZXRhZGF0YSBpZD0iQ29yZWxDb3JwSURfMENvcmVsLUxheWVyIi8+DQogIDxwYXRoIGNsYXNzPSJmaWwwIiBkPSJNMTUyODEgMGwtNDc4MSAwIC0zNjU2IDAgLTQ3ODEgMGMtMTEyNSwwIC0yMDYzLDkzOCAtMjA2MywyMDYzbDAgMTc4MTIgMCAwYzAsMTggMCwzNSAxLDUzbDAgMGMwLDE3IDEsMzUgMiw1MmwwIDBjMSwxNyAyLDM1IDMsNTJsMCAwYzEsMTcgMywzNCA1LDUybDAgMGMyLDE3IDQsMzQgNiw1MWwwIDBjMiwxNyA0LDM0IDcsNTFsMCAwYzMsMTcgNiwzNCA5LDUwbDAgMGMzLDE3IDYsMzQgOSw1MWwxIDBjMywxNiA3LDMzIDExLDQ5bDAgMGMzLDE3IDgsMzMgMTIsNTBsMCAwYzQsMTYgOSwzMiAxMyw0OWwwIDBjNSwxNiAxMCwzMiAxNSw0OGwwIDBjNSwxNiAxMCwzMiAxNiw0OGwwIDBjNSwxNiAxMSwzMiAxNyw0OGwwIDBjNiwxNSAxMiwzMSAxOCw0NmwwIDBjNiwxNiAxMiwzMiAxOSw0N2wwIDBjNywxNSAxMywzMSAyMCw0NmwwIDBjNywxNSAxNCwzMCAyMiw0NWwwIDBjNywxNSAxNSwzMCAyMiw0NWwwIDBjOCwxNSAxNiwyOSAyNCw0NGwwIDBjOCwxNCAxNiwyOSAyNCw0M2wwIDBjOSwxNSAxNywyOSAyNiw0M2wwIDBjOSwxNCAxNywyOCAyNiw0MmwwIDBjOSwxNCAxOSwyOCAyOCw0MmwwIDBjOSwxNCAxOSwyNyAyOCw0MWwwIDBjMTAsMTMgMjAsMjcgMzAsNDBsMCAwYzEwLDEzIDIwLDI2IDMwLDM5bDAgMGMxMSwxMyAyMSwyNiAzMiwzOWwwIDBjMTAsMTMgMjEsMjYgMzIsMzhsMCAwYzExLDEzIDIyLDI1IDMzLDM3bDAgMGMxMSwxMiAyMiwyNSAzNCwzN2wwIDBjMTEsMTIgMjMsMjMgMzQsMzVsMCAwYzEyLDEyIDI0LDIzIDM2LDM1bDAgMGMxMiwxMSAyNCwyMyAzNiwzNGwwIDBjMTMsMTEgMjUsMjIgMzcsMzNsMCAwYzEzLDExIDI2LDIxIDM4LDMybDAgMGMxMywxMSAyNiwyMSAzOSwzMWwwIDBjMTMsMTEgMjYsMjEgNDAsMzFsMCAwYzEzLDEwIDI2LDE5IDQwLDI5bDAgMGMxMywxMCAyNywxOSA0MSwyOWwwIDBjMTMsOSAyNywxOCA0MSwyN2wwIDBjMTQsOSAyOCwxOCA0MiwyN2wwIDBjMTQsOCAyOSwxNyA0MywyNWwwIDBjMTUsOSAyOSwxNyA0NCwyNWwwIDBjMTQsOCAyOSwxNiA0NCwyM2wwIDBjMTUsOCAyOSwxNSA0NCwyM2wwIDBjMTUsNyAzMSwxNCA0NiwyMWwwIDBjMTUsNyAzMCwxNCA0NiwyMGwwIDBjMTUsNyAzMCwxMyA0NiwyMGwwIDBjMTYsNiAzMSwxMiA0NywxOGwwIDBjMTYsNiAzMiwxMSA0NywxN2wwIDBjMTYsNSAzMiwxMCA0OCwxNmwwIDBjMTcsNSAzMywxMCA0OSwxNGwwIDBjMTYsNSAzMiw5IDQ5LDE0bDAgMGMxNiw0IDMzLDggNDksMTJsMCAwYzE3LDQgMzMsOCA1MCwxMWwwIDBjMTcsNCAzMyw3IDUwLDEwbDAgMGMxNywzIDM0LDYgNTEsOGwwIDBjMTcsMyAzNCw1IDUxLDhsMCAwYzE3LDIgMzQsNCA1MSw2bDAgMGMxNywxIDM0LDMgNTIsNGwwIDBjMTcsMiAzNCwzIDUyLDRsMCAwYzE3LDEgMzQsMSA1MiwybDAgMGMxNywwIDM1LDEgNTMsMWwwIDAgMTMyMTggMCAwIDBjMTgsMCAzNSwtMSA1MywtMWwwIDBjMTcsLTEgMzUsLTEgNTIsLTJsMCAwYzE4LC0xIDM1LC0yIDUyLC00bDAgMGMxNywtMSAzNSwtMyA1MiwtNGwwIDBjMTcsLTIgMzQsLTQgNTEsLTZsMCAwYzE3LC0zIDM0LC01IDUxLC04bDAgMGMxNywtMiAzNCwtNSA1MSwtOGwwIDBjMTcsLTMgMzMsLTYgNTAsLTEwbDAgMGMxNywtMyAzMywtNyA1MCwtMTFsMCAwYzE2LC00IDMzLC04IDQ5LC0xMmwwIDBjMTYsLTUgMzMsLTkgNDksLTE0bDAgMGMxNiwtNCAzMiwtOSA0OCwtMTRsMCAwYzE2LC02IDMyLC0xMSA0OCwtMTZsMCAwYzE2LC02IDMyLC0xMSA0OCwtMTdsMCAwYzE2LC02IDMxLC0xMiA0NywtMThsMCAwYzE1LC03IDMxLC0xMyA0NiwtMjBsMCAwYzE2LC02IDMxLC0xMyA0NiwtMjBsMCAwYzE1LC03IDMwLC0xNCA0NSwtMjFsMCAwYzE1LC04IDMwLC0xNSA0NSwtMjNsMCAwYzE1LC03IDMwLC0xNSA0NCwtMjNsMCAwYzE1LC04IDI5LC0xNiA0NCwtMjVsMCAwYzE0LC04IDI4LC0xNyA0MiwtMjVsMCAwYzE1LC05IDI5LC0xOCA0MywtMjdsMCAwYzE0LC05IDI4LC0xOCA0MSwtMjdsMCAwYzE0LC0xMCAyOCwtMTkgNDEsLTI5bDAgMGMxNCwtMTAgMjcsLTE5IDQwLC0yOWwwIDBjMTMsLTEwIDI3LC0yMCA0MCwtMzFsMCAwYzEzLC0xMCAyNiwtMjAgMzgsLTMxbDAgMGMxMywtMTEgMjYsLTIxIDM4LC0zMmwwIDBjMTMsLTExIDI1LC0yMiAzNywtMzNsMCAwYzEzLC0xMSAyNSwtMjMgMzcsLTM0bDAgMGMxMiwtMTIgMjQsLTIzIDM1LC0zNWwwIDBjMTIsLTEyIDI0LC0yMyAzNSwtMzVsMCAwYzEyLC0xMiAyMywtMjUgMzQsLTM3bDAgMGMxMSwtMTIgMjIsLTI0IDMzLC0zN2wwIDBjMTEsLTEyIDIyLC0yNSAzMiwtMzhsMCAwYzExLC0xMyAyMSwtMjYgMzIsLTM5bDAgMGMxMCwtMTMgMjAsLTI2IDMwLC0zOWwwIDBjMTAsLTEzIDIwLC0yNyAyOSwtNDBsMCAwYzEwLC0xNCAxOSwtMjcgMjksLTQxbDAgMGM5LC0xNCAxOCwtMjggMjcsLTQybDAgMGM5LC0xNCAxOCwtMjggMjcsLTQybDAgMGM5LC0xNCAxNywtMjggMjUsLTQzbDAgMGM5LC0xNCAxNywtMjkgMjUsLTQzbDAgMGM4LC0xNSAxNiwtMjkgMjQsLTQ0bDAgMGM3LC0xNSAxNSwtMzAgMjIsLTQ1bDAgMGM3LC0xNSAxNCwtMzAgMjEsLTQ1bDAgMGM3LC0xNSAxNCwtMzEgMjEsLTQ2bDAgMGM2LC0xNiAxMywtMzEgMTksLTQ3bDAgMGM2LC0xNSAxMiwtMzEgMTgsLTQ2bDAgMGM2LC0xNiAxMiwtMzIgMTcsLTQ4bDAgMGM1LC0xNiAxMSwtMzIgMTYsLTQ4bDAgMGM1LC0xNiAxMCwtMzIgMTQsLTQ4bDAgMGM1LC0xNyAxMCwtMzMgMTQsLTQ5bDAgMGM0LC0xNyA4LC0zMyAxMiwtNTBsMCAwYzQsLTE2IDgsLTMzIDExLC00OWwwIDBjNCwtMTcgNywtMzQgMTAsLTUxbDAgMGMzLC0xNiA2LC0zMyA5LC01MGwwIDBjMiwtMTcgNSwtMzQgNywtNTFsMCAwYzIsLTE3IDQsLTM0IDYsLTUxbDAgMGMyLC0xOCAzLC0zNSA1LC01MmwwIDBjMSwtMTcgMiwtMzUgMywtNTJsMCAwYzEsLTE3IDIsLTM1IDIsLTUybDAgMGMxLC0xOCAxLC0zNSAxLC01M2wwIDAgMCAtMTc4MTJjMCwtMTEyNSAtOTM4LC0yMDYzIC0yMDYzLC0yMDYzem0tMTExNTYgMTYyMTlsNTkwNiAwYzQ2OSwwIDg0NCwzNzUgODQ0LDg0NGwwIDBjMCw0NjggLTM3NSw4NDMgLTg0NCw4NDNsLTU5MDYgMGMtNDY5LDAgLTg0NCwtMzc1IC04NDQsLTg0M2wwIDBjMCwtNDY5IDM3NSwtODQ0IDg0NCwtODQ0em0wIC0zOTM4bDkwOTQgMGM0NjksMCA4NDQsMzc1IDg0NCw4NDRsMCAwYzAsNDY5IC0zNzUsODQ0IC04NDQsODQ0bC05MDk0IDBjLTQ2OSwwIC04NDQsLTM3NSAtODQ0LC04NDRsMCAwYzAsLTQ2OSAzNzUsLTg0NCA4NDQsLTg0NHptMCAtMzkzN2w5MDk0IDBjNDY5LDAgODQ0LDM3NSA4NDQsODQ0bDAgMGMwLDQ2OCAtMzc1LDg0MyAtODQ0LDg0M2wtOTA5NCAwYy00NjksMCAtODQ0LC0zNzUgLTg0NCwtODQzbDAgMGMwLC00NjkgMzc1LC04NDQgODQ0LC04NDR6Ii8+DQogPC9nPg0KPC9zdmc+DQo=');
    width: 16px;
    height: 20px;
    background-repeat: no-repeat;
    background-size: cover;
    margin-left: -25px;
    top: 5px;
    opacity: .7;
}
#persons .multiBlock_header:before{
    background-image: url('data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjMzczODM5IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgMTAwIDEwMCIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgMTAwIDEwMDsiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxjaXJjbGUgY3g9IjUwIiBjeT0iMzAiIHI9IjIyLjUiLz48cGF0aCBkPSJNNTAsNTcuNWMtMjMuNDcyLDAtNDIuNSwxMy40MzEtNDIuNSwzMHY1aDg1di01QzkyLjUsNzAuOTMxLDczLjQ3Miw1Ny41LDUwLDU3LjV6Ii8+PC9zdmc+');
    width: 20px;
}
.multiBlock_headerControl{
    float: right;
    margin-top: 5px;
    margin-right: 5px;
}
.multiBlock_close,
.multiBlock_toggle
{
    width: 20px;
    height: 20px;
    display: inline-block;
    position: relative;
    transition: all .3s;
    border-radius: 2px;
    cursor: pointer;
}
.multiBlock_close:hover,
.multiBlock_toggle:hover{
    background-color: #dedede;
}
.multiBlock_close:hover,
.multiBlock_toggle:hover{

    -webkit-animation: pulse .8s ease-in-out infinite ;
    animation: pulse .8s ease-in-out infinite ;

}
.multiBlock_close:hover:before,
.multiBlock_toggle:hover:before{
    opacity: 0.8;

}
.multiBlock_toggle:hover:before{
    /*transform: rotate(180deg);*/
}
.multiBlock_close:before{
    content: '';
    position: absolute;
    background-image: url('data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjMzczODM5IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjIiIGJhc2VQcm9maWxlPSJ0aW55IiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxwb2x5Z29uIHBvaW50cz0iMjcuNSw4Ny41IDUwLDY1IDcyLjUsODcuNSA4Ny41LDcyLjUgNjUsNTAgODcuNSwyNy41IDcyLjUsMTIuNSA1MCwzNSAyNy41LDEyLjUgMTIuNSwyNy41IDM1LDUwIDEyLjUsNzIuNSAgIi8+PC9zdmc+');
    width: 13px;
    height: 13px;
    background-repeat: no-repeat;
    background-size: cover;
    left: 4px;
    top: 4px;
    opacity: 0.3;
    transition: all .3s;
}
.multiBlock_toggle:before{
    content: '';
    position: absolute;
    background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8IS0tIENyZWF0b3I6IENvcmVsRFJBVyBYOCAtLT4NCjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWw6c3BhY2U9InByZXNlcnZlIiB3aWR0aD0iMjEwbW0iIGhlaWdodD0iMjk3bW0iIHZlcnNpb249IjEuMSIgc3R5bGU9InNoYXBlLXJlbmRlcmluZzpnZW9tZXRyaWNQcmVjaXNpb247IHRleHQtcmVuZGVyaW5nOmdlb21ldHJpY1ByZWNpc2lvbjsgaW1hZ2UtcmVuZGVyaW5nOm9wdGltaXplUXVhbGl0eTsgZmlsbC1ydWxlOmV2ZW5vZGQ7IGNsaXAtcnVsZTpldmVub2RkIg0Kdmlld0JveD0iMCAwIDIxMDAwIDI5NzAwIg0KIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj4NCiA8ZGVmcz4NCiAgPHN0eWxlIHR5cGU9InRleHQvY3NzIj4NCiAgIDwhW0NEQVRBWw0KICAgIC5maWwwIHtmaWxsOiMzNzM4Mzl9DQogICBdXT4NCiAgPC9zdHlsZT4NCiA8L2RlZnM+DQogPGcgaWQ9IkxheWVyX3gwMDIwXzEiPg0KICA8bWV0YWRhdGEgaWQ9IkNvcmVsQ29ycElEXzBDb3JlbC1MYXllciIvPg0KICA8cG9seWdvbiBjbGFzcz0iZmlsMCIgcG9pbnRzPSIxOTE2MywxMTE3NSAxNjAxMyw4MDI1IDEwNTAwLDEzNTM4IDQ5ODgsODAyNSAxODM4LDExMTc1IDEwNTAwLDE5ODM4ICIvPg0KIDwvZz4NCjwvc3ZnPg0K');
    width: 13px;
    height: 13px;
    background-repeat: no-repeat;
    background-size: cover;
    left: 3px;
    top: 5px;
    opacity: 0.3;
    transition: all .3s;
    transform: scaleY(-1);
}
.multiBlock.collapse .multiBlock_toggle:before
{
    transform: scaleY(1);
    top: 3px;
}

.multiBlock_content{
    padding-bottom: 20px;
    padding-top: 20px;
    transition: all .3s;
    height: initial;
}
.multiBlock.collapse .multiBlock_content{
    height: 0;
    padding: 0;
    transition: all .3s;
}
.multiBlock_content .frmElement__right{
    margin-left: 15px;

}

ul.markless{
    margin: 0;
    padding: 0;
    list-style-type: none;
    margin-top: -3px;
    column-count: 2;
}
ul.markless li{
    display: block;
}
ul.markless li:not(:last-child){
    margin-bottom: 6px;
    /*width: 51%;*/
}
.overviewResult{
    border-collapse: collapse;
    border-spacing: 0px;
    -webkit-border-horizontal-spacing: 0px;
    -webkit-border-vertical-spacing: 0px;
    margin-left: -1px;
    margin-top: 40px;
}
.overviewResult th{
    font-weight: normal;
    font-size: 16px;
    padding-bottom: 20px;
}
.overviewResult th:first-child{
    width: 308px;
    text-align: left;
}
.overviewResult td{
    padding-top: 3px;
}
.overviewResult td:last-child{
    text-align: center;
}
.overviewResult td:last-child .frmSwitch_checkbox{
    top: 2px;
}
.blueButton{
    display: inline-block;
    padding: 10px 32px;
    background-color: #169bd5;
    margin: 0 auto;
    text-decoration: none;
    color: white;
    border-radius: 3px;
    transition: all .3s;
    cursor: pointer;
}
.blueButton:hover{
    background-color: #0072ff;
    -webkit-animation: button_hover 2s ease-in-out infinite ;
    animation: button_hover 2s ease-in-out infinite ;
    transition: all .3s;
}
.addButton{
    position: relative;
    padding-left: 50px;
}
.addButton:before{
    content: '';
    position: absolute;
    background-image: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRkZGRkZGIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjIiIGJhc2VQcm9maWxlPSJ0aW55IiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxwb2x5Z29uIHBvaW50cz0iNjAsNy41IDQwLDcuNSA0MCw0MCA3LjUsNDAuMDI3IDcuNSw2MCA0MCw2MCA0MCw5Mi41IDYwLDkyLjUgNjAsNjAgOTIuNSw2MCA5Mi41LDQwIDYwLDQwICAiLz48L3N2Zz4=);
    background-repeat: no-repeat;
    width: 12px;
    height: 12px;
    background-size: cover;
    margin-top: 5px;
    margin-left: -18px;

}
.addPerson:hover:before{
    -webkit-animation: pulse .8s ease-in-out infinite ;
    animation: pulse .8s ease-in-out infinite ;
}
.frmPeriod{
    border-radius: 2px;
    border: 1px solid #bcbcbc;
    display: table;
    line-height: 32px;
    width: 100%;
}
.frmPeriod_wrapper{
    display: table-row ;
}
.frmPeriod .frmPeriod_element{
    display: table-cell;
    text-align: center;
    cursor: pointer;
    font-size: 13px;
    transition: all .3s;
    position: relative;
}
.frmPeriod .frmPeriod_element:not(:last-child){
    border-right:  1px solid #bcbcbc;
}
.frmPeriod .frmPeriod_element:hover,
.frmPeriod .frmPeriod_element.selected
{
    background-color: #319adc;
    color: white;
    border-color: white;
}
.weekDays{
    position: absolute;
    border-radius: 2px;
    background-color: #319adc;
    background-color: white;
    padding: 5px;
    z-index: 300;
    width: 166px;
    margin-left: -25px;
    display: none;
    opacity: 0;
    transition: all .3s;
}
.weekDay{
    color: #333;
    border-radius: 50%;
    display: inline-block;
    width: 20px;
    height: 20px;
    line-height: 20px;
    text-align: center;
    font-size: 12px;
    transition: all .3s;
}
.weekDay:hover,
.weekDay.selected
{
    background-color: white;

}

.weekDays_wrapper:hover .weekDays,
.weekDays:hover
{
    display: block;
    background-color: #319adc;
    opacity: 1;
}
.invisible{
    color: transparent;
}

li.token-input-token{
    background-color: #eef2f4;
    /* border: 1px solid #ADAEAF; */
    border-radius: 5px;
    color: #5c5d5e;
    font-size: 12px;
    display: inline-block;
}

.selectButton.selectButtonForTree.multiselectLoupe{
    background-image: url('data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjQzBDMkMzIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGRhdGEtbmFtZT0iTGF5ZXIgMSIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHg9IjBweCIgeT0iMHB4Ij48dGl0bGU+MUFydGJvYXJkIDU0PC90aXRsZT48cGF0aCBkPSJNMTgsNzJhNiw2LDAsMCwwLDYsNkg3NmE2LDYsMCwwLDAsNi02VjM4YTYsNiwwLDAsMC02LTZINTJMNDYsMjJIMjRhNiw2LDAsMCwwLTYsNlptNTYtMkgyNlYzMEg0MS40N2wzLjY3LDYuMTJMNDcuNDcsNDBINzRaIi8+PC9zdmc+');
    width: 27px;
    height: 27px;
    position: absolute;
    right: 2px;
    top: 0;
    }
.frmElement_triple{
    width: 32%;

}
.frmElement_triple:not(:last-child){
    margin-right: 2%;
}

.tabHead{
    /*margin-bottom: 25px;*/
}
.tabHead .tab{
    display: inline-block;
    border-top: 1px solid #bcbcbc;
    border-left: 1px solid #bcbcbc;

    color: #B2B5BE;
    cursor: pointer;
    /*transition: all .3s;*/
    padding: 10px;
    border-radius: 0;
    background-color: white;
    position: relative;
}
.tabHead .tab:before{
    content: '';
    position: absolute;
    width: 100%;
    height: 4px;
    top: 0;
    left: 0;
    background-color: transparent;
    transition: all .3s;
}
.tabHead .tab:first-child{
    border-top-left-radius: 3px;
}
.tabHead .tab:last-child{
    border-top-right-radius: 3px;
    border-right: 1px solid #bcbcbc;
}
.tabHead .tab.active{
    /*border-top-color: #319ADC;*/
    /*color: #319ADC;*/
    /*border-top-width: 3px;*/
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
    padding-top: 11px;
}
.tabHead .tab.active:before{
    background-color: #319ADC;
    transition: all .3s;
}
.tabHead .tab:hover{
    /*border-top-color: #A3D2EF;*/
    /*border-top-width: 3px;*/
    /*transition: all .3s;*/
    /*border-top-left-radius: 3px;
    border-top-right-radius: 3px;*/
}
.tabHead .tab:hover:before{
    background-color: #A3D2EF;
}
.tabHead .tab:not(:last-child){
    /*margin-right: 10px;*/
}
.tabHead .tab.active:after{
    content: '';
    position: absolute;
    width: 100%;
    background-color: white;
    height: 2px;
    left: 0;
    bottom: 0;
    margin-bottom: -1px;
}
.tabContent textarea{
    height: 70px;
}
.tabElement{
    padding: 20px 10px;
    border-radius: 3px;
    border-top-left-radius: 0;
    border: 1px solid #bcbcbc;
}


.frmElement_file {
    display: inline-block;
    /*padding: 10px;*/
    box-sizing: border-box;
    padding-top: 10px;
    vertical-align: top;
}

.frmElement_file .fileInputButton{
    border: 1px dashed #a2a1a1;
    border-radius: 2px;
    background: none;
    padding: 7px;
    height: 50px;
    font-style: normal;
    font-size: 14px;
    width: 100%;
}
.frmElement_file .fileButton .addFileButton{
    padding: 0;
    background: none;
}
.frmElement_file .fileButton .addFileButton .qq-uploader{
    position: relative;
}
.frmElement_file .fileButton .addFileButton .qq-upload-drop-area{
    position: absolute;
    width: 100%;
    z-index: 200;
}

.fileButton .addFileButton .qq-upload-button{
    color: transparent;
}
.fileButton .addFileButton .qq-upload-button .buttonText{
    color: #90A4AE;
    display: block;
    line-height: 16px;
    margin-top: 8px;
}
.frmElement_triple .fileButton .addFileButton .qq-upload-button .buttonText{
    margin-top: 0;
}
.fileButton .addFileButton .qq-upload-button .buttonText:before{
    content: '';
    background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8IS0tIENyZWF0b3I6IENvcmVsRFJBVyBYOCAtLT4NCjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWw6c3BhY2U9InByZXNlcnZlIiB3aWR0aD0iNjcuMm1tIiBoZWlnaHQ9IjExMC42ODJtbSIgdmVyc2lvbj0iMS4xIiBzdHlsZT0ic2hhcGUtcmVuZGVyaW5nOmdlb21ldHJpY1ByZWNpc2lvbjsgdGV4dC1yZW5kZXJpbmc6Z2VvbWV0cmljUHJlY2lzaW9uOyBpbWFnZS1yZW5kZXJpbmc6b3B0aW1pemVRdWFsaXR5OyBmaWxsLXJ1bGU6ZXZlbm9kZDsgY2xpcC1ydWxlOmV2ZW5vZGQiDQp2aWV3Qm94PSIwIDAgNjcyMCAxMTA2OCINCiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayINCiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA4NSA4NSI+DQogPGRlZnM+DQogIDxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQogICA8IVtDREFUQVsNCiAgICAuZmlsMCB7ZmlsbDojQzBDMkMzfQ0KICAgXV0+DQogIDwvc3R5bGU+DQogPC9kZWZzPg0KIDxnIGlkPSJMYXllcl94MDAyMF8xIj4NCiAgPG1ldGFkYXRhIGlkPSJDb3JlbENvcnBJRF8wQ29yZWwtTGF5ZXIiLz4NCiAgPHBhdGggY2xhc3M9ImZpbDAiIGQ9Ik02MDc4IDBjLTMyMiwwIC01OTMsMjcyIC01OTMsNTkzbDAgNzQzNmMwLDk4OSAtOTY0LDE4MDQgLTIxNTAsMTgwNCAtMTE4NiwwIC0yMTQ5LC04MTUgLTIxNDksLTE4MDRsMCAtNTgwNWMwLC01NDQgNTQzLC0xMDEzIDEyMzUsLTEwMTMgNjkyLDAgMTIzNSw0NDQgMTIzNSwxMDEzbDAgNTMzNmMwLDk5IC0xMjMsMTk4IC0zMjEsMTk4IC0xNzMsMCAtMzIxLC05OSAtMzIxLC0xOThsMCAtNDg5MmMwLC0zMjEgLTI3MiwtNTkzIC01OTMsLTU5MyAtMzIxLDAgLTU5MywyNzIgLTU5Myw1OTNsMCA0ODkyYzAsNzY2IDY5MiwxNDA4IDE1MzIsMTQwOCA4NDAsMCAxNTMyLC02NDIgMTUzMiwtMTQwOGwwIC01MzM2YzAsLTEyMTEgLTEwODcsLTIxOTkgLTI0NDYsLTIxOTkgLTEzNTksMCAtMjQ0Niw5ODggLTI0NDYsMjE5OWwwIDU4MzBjMCwxNjU1IDE1MDcsMzAxNCAzMzYwLDMwMTQgMTg1MywwIDMzNjAsLTEzNTkgMzM2MCwtMzAxNGwwIC03NDM2Yy00OSwtMzQ2IC0zMjEsLTYxOCAtNjQyLC02MTh6Ii8+DQogPC9nPg0KPC9zdmc+DQo=');
    width: 18px;
    height: 18px;
    background-repeat: no-repeat;
    background-size: contain;
    position: absolute;
    margin-left: -26px;
    top: 7px;

}
.frmElement_triple .fileButton .addFileButton .qq-upload-button .buttonText:before{
    /*top: 7px;*/
}
.fileButton .addFileButton .qq-upload-button .buttonText .anchorText{
    color: #0072ff;
}
.frmElement_file .fileButton .addFileButton input[type="file"]{
    width: 100%;
    font-size: inherit!important;
    height: 85%;
    margin-top: -10px!important;
}
.fileUploaderHead{
    text-align: left;
    padding: 50px 20px;
    border: 1px dashed #a2a1a1;
    border-radius: 2px;
    border-bottom: none;
    font-size: 20px;
    color: #90A4AE;
    position: relative;
}
.fileUploaderHead:after{
    content: '';
    position: absolute;
    background-size: contain;
    width: 50px;
    height: 50px;
    background-repeat: no-repeat;
    right: 5px;
    top: 9px;
}
.fileUploaderHead_pdf:after{
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAACyElEQVRoQ+2a3XHaQBDH/ycy8Gg20lg8OhWEVBDoAFcQU0GcCpxUYFJBTAUhFYRUEFNBnDfLsXL4lbF1mRUCaxxAXycdeNgXkHQ67W93725vJYFnIuKZcGAjiOdLVRLohWtTX2ffpkCYQStMKhDXJm0hGPeyUhg3ajgmomlR7xgEUXeAOABwWbfQLQpjDERYeKMCNdYFYwyEw/VGyrYuGKMgPC6klEezACMAr4uEmXGQCKY5CzAuArMVIDpgtgakKMxWgayCERb6h0SXSevM1oGsgJkKC90kmK0EyQNjDCQpVFZcn7o20br7dgkEm3K+ykFyeAKLRHMPksYSeSyc9Z40epQWWp4vvwA4AZBq+twEZwzEu5U9CHxdKqfwzXWol9UTi/bmQHz5EcAZgAkngkrhR8uhzs6B/JGyEwT4vlB8Z0EYwPP/TqPdHx8OXZt4vOQSY6E1B5EXAN6Fmiscuw7x5imXGAWZb2PxkzWvW3hFRFe5KOZGCetrRhbE+MzFZZ+WQ93dBImHVhhd+NCyaZAHxqxHfCkBNIVCXwnw4gj+f+gQj51MYgzk5laeRMpPXJvasWP2zGkE1VFAMyQSGDUsDNcV6YyBXPvylwCOLAtdBUyDAG8BnPK5da7YNI6MgHiPqzrrzDXdudUTRd259suVbSsHiaZcXtGXCingN4CRUBjXa2HtimtYnMLM15hH+eTaxOf/k8pAOCV5eMCZEIjnU0NhYbCuaCClbN4Dbdb6BXC1aZ0pHYSVmQU4j9L1pSW5QJ1U9UiMtFiD0kGufTkQwPu4Ugr43LIpnJl0SekgK17NTeoWOkXfdTw1QBUgy8SQU/VGDT3dEAxVOgg/hGcq/tU5Jir3iK4xkNRPJR5JUkLH9T3IwoppLKHD4kl9pNGjtLpWknJZru9BnoZWFuuV2bbwnr1M5bL0nRsky0NMt9X2sYxpkH8qpldRCTANlgAAAABJRU5ErkJggg==');
}
.fileUploaderHead_doc:after{
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAC5UlEQVRoQ+2aXXLaMBSFj5QZ+lg0JjFvTVbQdAUNK0hYQckKyg6arqB0B2QFZQchK2i6gvBop3gufWWmVitjE5UxWP4BuRnrzYNsn+/q3KtrDQwvZLAXwoGdIH5Ack+gY9cR11U+2xaIYqgUxgjEdURlFtRXWUpMXx2hL4RYlF0diyDyF8BeA3hocfTKwlgDYRzvZCinVcFYA1F2fSI6rwrGKojKCyI6XYaYAHhbxmbWQWKY9jLEtAxMLUCqgKkNSFmYWoGkwTCO6xMhHrL2mdqBpMAsGEcvC6aWIEVgrIFkWSXl94XrCLHtvv8JBLt6voODFFgJJI1mA2ISiSIRznuPiY7GWnmjums+EbV3fY/UfkWe5jSQDF8AtCUw4xz9tI2v1iBx+/64Wqn4a1Gi73aEaun/GbUG8QMaA/ggga9dRwwVmBBilmbBWoAo/ytxmzngBfTIgFPO0TsWQn2LbB21AFGClcKuI84SpQpuGYLUtckJzcFAPKLLI2BxLMS9HlZdcIurRVkd+/wkughD3EmJ+25HXGRVwL2DxELvAJxHKRv7PRGWCFbXuoW8gIYMUbW6dR0xsA7yLGh9RoW0yK8K03NF8gIaMeAjgM+uI26sg8QrMmxxjJa/MQbDpS7YD0iJ/BQLXYv25jRlDO9NEl3du3dr6ZHURK8F6yC67fyAVKK3Wxxn20ruxrOjw/SDdL/+nK7A8E1PYH9Ok2iVlLO0xDaJsDUQbadef8klFooLwUyVYK0A/HAdERWJrGECXmn36wU0Y8Abda6reqZk00taEFUIliGGcd4YVayD50j8wqjtYMAIHLcyxPcYYqQlfbQApoluBUTfNxK7JEm+KrlyIMEWXOLmpCMUtNE4uLWi6M3pSgJDxqB6rInJPpFFYwUkS1SR3xuQJGomkSgS4bz3mOiotPzmFWg6vwFprGXqlZzzGmttWitnAPc2vXQbvzdlOR9cGCTne6xOr+zPMlYp/r78Dx2Nn1Erk5crAAAAAElFTkSuQmCC');
}
.fileUploaderHead_img:after{
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAC+0lEQVRoQ+2a0XHaQBRF74oZ+TPswBj+gisIriC4gtgVWKkgdgVxByYVBFcArsCkgpAKTP4QI2XxZzwDz/OE5MgChLRGIBP5k9mV3nn3vrvLYIE9+RN7woECJG9KCttVlLeidOrZP5BaRb7JeQkc9axIAaJj6A3uiVUk7wEQds//BZK3uQm6n1qRAmSDwxx+VKFIltZSSjUep7gmgSZ3XRAGZgmXUsrhKkEzU0QpVX6c4Y5fbBo4kVJOkrjKg5jhJ4ByZP3ENHC8CiYzkJGj7oRAi4sh4Fu9Ii+SgNiO6kHgExF+HJRwynv+TtETAh9BuK1VpfdZ9C8TENtV3wFYAD0A4p33UsJZrSp762BsVylWwzQgAxV9dfkqPqxX5NFWQEauuhDANUMIQ7Ro5nX1KwC2xtE6i9nunwnDR0DYbvcE/K5XZCNzkLGjLBJgNV4oMHJUn61BhH69Kk/iVAlZq39Qwplvra5n021Ya6xUk+bDXRaEz4dV2QkKng8wDbjTBFzWK7K9Cia89uUaejAN0Vil6EZmxPfwvZ80N7WKtBaG0VGnEOh6cWrg+FDKQSzMFO1I/Fpxtnw1SChmm3HSc9G2q1ilcwCDNJG8LiD8Z3tfy7XvWrajuhDeQP8yDbTiuuZD9wF8SBPJmYOEYzbOv+FC/FniAy9xJGcKwgM9T6h5zMZ5PlrIv4heH8ljR53PBK682QI6poGbZae79ow8F5fwoFuAWRPJAYAAFs8NQo9K6NSlvA2e+yqQaMwmsUAoksuPMxpGIzkKwIegQbgigO9qFl9fgmfwSR+oxAem1rADWBqzaWDsUCQTwHcxvhV4CgQA4fOIP/cvlRYBlgDeR9+nnVppCl+2duSqtgC+hLrsKRAFWLbXa0REpZ2BBJFMQDkpQBTKV0nPWll+sdJRWXvYCxCddifYUyhSWCuBTXSWFNbS6do29qQ+ELdRlM47EoPoPHxXe4qf3nbV+VXvXVAkbwWmrWd/fmdPS57X9W/ynwSWNbMAyZvFngA1ElKIFGarEgAAAABJRU5ErkJggg==');
}

    .expandableText{
        max-height: 65px;
        position: relative;
        white-space: pre-wrap;
        overflow: hidden;
        transition: all .3s;
    }
    .expandableText.expand{
        max-height: initial;
        transition: all .3s;
    }
    .expandableText.expand+.expandControl:before{
        opacity: 0;
    }
    .expandableText.expand+.expandControl{
        /*margin-top: 15px;*/
    }
    .expandControl{
        /*margin-bottom: 30px;*/
        position: relative;

        color: #319ADC;
        padding-top: 10px;
    }
     .expandControl span{
        cursor: pointer;
     }
    .expandControl span:hover{
        color: #E74C3C;
    }
    .expandControl:before{
        content: '';
        position: absolute;
        width: 100%;
        height: 20px;
        margin-top: -30px;
        display: block;
        background: -moz-linear-gradient(top,  rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
        background: -webkit-linear-gradient(top,  rgba(255,255,255,0) 0%,rgba(255,255,255,1) 100%);
        background: linear-gradient(to bottom,  rgba(255,255,255,0) 0%,rgba(255,255,255,1) 100%);
    }
.frmElement_frmField input[type="text"].timePicker {
    text-align: center;
    font-size: 14px;
    padding-left: 6px;
}
.ui-timepicker-container{
    position: absolute;
    font-family: 'PTSans', Arial, sans-serif;
    margin-top: -1px;
    margin-left: 1px;
}
.ui-timepicker-container .ui-timepicker{
    border-radius: 2px;
    padding: 0;
    box-sizing: border-box;
}
.ui-timepicker-container .ui-timepicker-viewport{
    padding: 0;
}
.ui-timepicker-container .ui-menu .ui-menu-item{
    list-style: none;
}
.ui-timepicker-container .ui-menu .ui-menu-item a{
    padding: 4px;
    padding-left: 0px;
    text-align: center;
    font-size: 14px;
}
.ui-timepicker-container .ui-menu .ui-menu-item a.ui-state-hover{
    background: #319adc;
    color: white;
    border: none;
    border-radius: 0;
    box-sizing: border-box;
    margin: 0;
    padding: 4px;
    margin-right: 1px;
    margin-left: -1px;
}
.hidden{
    display: none;
}
.frmContainer .fileList .attachmentsTable .attachmentFileRow{
    padding-top: 15px;
}
.frmContainer .fileList .attachmentsTableWrapper .AttachmentFileName{
    position: relative;
    font-size: 16px;
    border: none;
}
.frmContainer .AttachmentFileName:before{
    content: '';
    background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAMAAADW3miqAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyFpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo4RTIyQkFBRUQ5ODgxMUU2ODI2MUQ1MzI4OUNEOUI3MyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo4RTIyQkFBRkQ5ODgxMUU2ODI2MUQ1MzI4OUNEOUI3MyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjhFMjJCQUFDRDk4ODExRTY4MjYxRDUzMjg5Q0Q5QjczIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjhFMjJCQUFERDk4ODExRTY4MjYxRDUzMjg5Q0Q5QjczIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+SDpoxAAAAEhQTFRF////kKSuyNLXkaWv2eDjm622l6qzmq223+Xn/P39mKq0wMzRwMvRwczSqrnB+vv8s8HIws3TnK63kqWv9vj53+Xo8/X2tsPK0Nh3rwAAAJRJREFUeNrc1NsOgyAQBNAdaQW19dKL/f8/FdKY2p0lNE1f7PhEOIHBoCIx9yNUKqGQsRSgx44VowMrRsLKQKwsRMpEWtlIKUYDK422LzeLgv8AmUV2jvS9+x79rlNzqt1cQh3Qy1pOMp1a4HErrRQRruPrmLntgKlcvD43z5UkPX91VQrI+Imt8eZ39p5LSPOLAAMA24EC7BIhoFMAAAAASUVORK5CYII=');
    width: 36px;
    height: 36px;
    position: absolute;
    margin-left: -40px;
    top: 0;
    margin-top: -9px;
}
.frmContainer .fileList .attachmentsTableWrapper .AttachmentFileName .limitedName{
    display: inline;
}
</style>
