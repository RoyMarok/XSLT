<div class="cardBodySide">
<link rel="stylesheet" href="/portal_static/css/ps/fileBaloon.css" />
<style>
.cardBodySide{
        display: inline-block;
        width: 350px;
        vertical-align: top;
    }

    .cardBodySide a{
        color: #319ADC;
        text-decoration: none;
        transition: all .3s;
        border-bottom: 1px solid rgba(49, 154, 220, 0.21);
        border-bottom: 1px solid transparent;
    }
    .cardBodySide a:hover{
        color: #E74C3C;
        border-color: #E74C3C;
        border-color: transparent;
    }
    .cardBodySide>div:not(:last-child){
        margin-bottom: 40px;
    }
    .cardBodySide h3{
        margin-top: 0;
        font-weight: normal;
        font-size: 18px;
        position: relative;
    }
    .cardBodySide h3.hider{
        cursor: pointer;
    }
    .cardBodySide h3.hider:after{
        content: '>';
        content: '';
        position: absolute;
        background-image: url('data:image/png;base64,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y6wlgTygKFJXovl7yjEgaGJT5HkXBvTw4EOAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBDoIPJY1nsr1rsNauy1Rz/RUriuebQvrGs/Pcv0q1+dyXQm6nuXby9nq/UpnK8dZ/3lfthDx1ICuFNGf8cTZRNSxudfiCejs/0SvxRNnE1GHiG7FE9BZI7oVT5xNRHdEVOP5Ua7AvHXPFtGReOK8ImqI6Ew8AZ0lojPxxNlEdCKiGs/3g/88ARz33SNqiSfOJqKDEX1qjCegd43onnjibB8PGr7pr30op3++WEQ94qkm1cbngMCVIhLPgYGP+MoVIhLPiDJOrJk5IvGcGPTIr2aMSDwji2hYO1NE4mkY8IyfZIioxvO1XPHa3XL3tjWwpp0jEs/AwfdceseIxNNzwhPW2iki8UwY+IhH7BCReEZMduKaKyMSz8RBj3zUiohqPF/K1fKWFb/xtjWyipNrz4xIPCeHk+XrMyIST5YaGvc5MiLxNA4l289GRCSebBXcud+eEYnnzmFk/XmviLxtZS2gw757RBSv3S13r+odhrh6iVURiWf15Ds+f3ZE4uk4vF2WmhWReHaZ+IB9jI5IPAOGttuSoyISz26THrif3hGJZ+Cwdl26V0Ti2XXCE/Z1b0TimTCk3R/RGpF4dp/sxP2djUg8E4eT5VFHIxJPloku2Of/IhLPgqFke+S/IhJPtkku3O/fEYln4TCyPjoiEk/WCW6w7xpRvXwIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAm9I4DeC3zPK4LVGUQAAAABJRU5ErkJggg==');
        transform: rotate(-180deg);
        transition: all .3s;
        color: #8798AC;
        margin-left: 10px;
        top: 2px;
        font-weight: bold;
        width: 22px;
        height: 18px;
        background-repeat: no-repeat;
        background-size: 22px;
        opacity: .3;

    }
    .stage{
        margin-bottom: 13px;
    }
    .stage .pointer,
    .stage .desc{
        display: inline-block;
        vertical-align: top;
    }
    .stage .pointer{
        width: 14px;
        height: 14px;
        border-radius: 50%;
        border: 2px solid #D4D9DD;
        position: relative;
        margin-right: 10px;
        box-sizing: content-box;
    }
    .stage .pointer:before{
        content: '';
        position: absolute;
        background-color: #D4D9DD;
        border-radius: 50%;
        width: 8px;
        height: 8px;
        top: 3px;
        left: 3px;
    }
    .stage:not(:last-child) .pointer:after{
        content: '';
        position: absolute;
        background-color: #D4D9DD;
        width: 2px;
        height: 13px;
        left: 6px;
        top: 16px;
    }
    .stage .pointer.IN_PROGRESS{
        border-color: #319ADC;
    }
    .stage .pointer.IN_PROGRESS:before{
        background-color: #319ADC;
    }

    .stage .pointer.REJECT{
        border-color: #E74C3C;
    }
    .stage .pointer.REJECT:before{
        background-color: #E74C3C;
    }
    .stage .pointer.IN_PROGRESS:after{

    }
    .stage .pointer.PERFORMED{
        border-color: #8FB400;
    }
    .stage .pointer.PERFORMED:before,
    .stage .pointer.PERFORMED:after{
        background-color: #8FB400;
    }

    .stage .pointer.CANCEL{
        border-color: #8FB400;
    }
    .stage .pointer.CANCEL+.desc{
        color: #D4D9DD;
    }
    .stage .pointer.CANCEL:before{
        background-color: white;
    }
    .stage .pointer.CANCEL:after{
        background-color: #8FB400;
    }
    .tabHead{
        margin-bottom: 25px;
    }
    .tabHead .tab{
        display: inline-block;
        border-bottom: 3px solid transparent;
        color: #B2B5BE;
        cursor: pointer;
        transition: all .3s;
        padding: 5px;
    }
    .tabHead .tab.active{
        border-color: #319ADC;
        color: #319ADC
    }
    .tabHead .tab:hover{
        border-color: #319ADC;
        transition: all .3s;
    }
    .tabHead .tab:not(:last-child){
        margin-right: 10px;
    }
    .requestList{
        counter-reset: requestCounter;
    }
    .request{
        position: relative;
        margin-bottom: 30px;
        margin-left: 30px;
    }
    .request:before{
        counter-increment: requestCounter;
        content: counter(requestCounter) ".";
        position: absolute;
        left: -20px;
    }
    .status{
        position: absolute;
        padding: 5px 10px;
        border-bottom-left-radius: 2px;
        background-color: #319ADC;
        color: white;
        font-size: 11px;
        top: 0;
        right: 0;

    }
    .request .status{
        /*width: 75px;*/
        text-align: center;
        padding: 1px 10px;
        border-radius: 2px;
    }
    .request .status.got{
        background-color: #00C292;
    }
    .request .status.rejected{
        background-color: #E74C3C;
    }
    .request .content{
        width: 245px;
    }
    .knowledgeBase>div{
        margin-left: 15px;
    }
    .issue{
        margin-bottom: 15px;
    }
    .addNew{
        position: relative;
        transition: all .3s;
        color: #319ADC;
        /*color: #0057A0;*/
        cursor: pointer;
        font-size: 12px;
        margin-bottom: 15px;
    }
    .addNew:hover{
        color: #E74C3C;
    }
    .addNew:before{
        content: '+';
        position: absolute;
        left: -15px;
    }
    .tagHead{
        font-size: 12px;
        margin-bottom: 10px;
        color: #A1A1A1;
    }
    .tagLine .tag{
        background-color: #E5F1FF;
        cursor: pointer;
        transition: all .3s;
        color: #319ADC;
    }
    .tagLine .tag:hover{
        background-color: #319ADC;
        color: white;
    }
    .fileList{
        /*margin-left: 30px;
        margin-left: 45px;*/
    }
    .file{
        position: relative;
        display: inline-block;
        margin-bottom: 20px;
        font-size: 12px;
        margin-left: 45px;
    }
    .file:after{
        content: attr(data-filesize);
        color: #999999;
        position: absolute;
        left: 0;
        top: 14px;
    }
    .file:before{
        content: '';
        width: 32px;
        height: 32px;
        background-size: 30px;
        background-repeat: no-repeat;
        position: absolute;
        margin-left: -34px;
    }
    .file[data-filetype="pdf"]:before{
        background-image: url('/portal_static/img/icons/filetype/pdf.svg');
    }
    .file[data-filetype="jpg"]:before,
    .file[data-filetype="jpeg"]:before{
        background-image: url('/portal_static/img/icons/filetype/jpg.svg');
    }
    .file[data-filetype="doc"]:before,
    .file[data-filetype="docx"]:before{
        background-image: url('/portal_static/img/icons/filetype/word.svg');
    }
    .file[data-filetype="xls"]:before,
    .file[data-filetype="xlsx"]:before{
        background-image: url('/portal_static/img/icons/filetype/exel.svg');
    }
    .file[data-filetype="gif"]:before{
        background-image: url('/portal_static/img/icons/filetype/gif.svg');
    }
    .file[data-filetype="png"]:before{
        background-image: url('/portal_static/img/icons/filetype/png.svg');
    }
    .hidebleContent{
        transition: all .3s;
    }
    .hider.closed+.hidebleContent{
        display: none;
        transition: all .3s;
    }
    .cardBodySide h3.hider.closed:after{
        transform: rotate(0deg);
    }

    .tag{
        padding: 5px 10px;
        border-radius: 5px;
        background-color: #319ADC;
        color: white;
        font-size: 11px;
        display: inline-block;
        margin-right: 5px;
        margin-top: 10px;
    }
    .emptyKnowledge{
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKsAAAB5CAMAAABxwCEPAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyFpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0NEEyQzc3RkVBMDkxMUU2OUJEOUI3QjU1NzQ1ODY3OCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0NEEyQzc4MEVBMDkxMUU2OUJEOUI3QjU1NzQ1ODY3OCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjQ0QTJDNzdERUEwOTExRTY5QkQ5QjdCNTU3NDU4Njc4IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjQ0QTJDNzdFRUEwOTExRTY5QkQ5QjdCNTU3NDU4Njc4Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+zNVVWAAAAwBQTFRFstHs9fr89Pn+8Pb70djlqszq+vr8////rc7rytPg6PL53uz4+Pv+3u738/X42On11uj16ezy2+z32ur15vL63eLrvdjv1tznxt3xwtvx8vf9+Pz91Ob10uX11Nvm7PX83+Ts2d/p+/7+utbuttTtqMzqs9Ls5vH64ufuzeLz3OHqzNTh/Pz98fj75erx4eXt193oqMvq8vj92+v22er22uv22ur28/j9/v//8/n92er1/f7/8fj9/v7/3ez34u/4+fz++/3+3Oz33u33/P7/3Oz2/P3/9Pn95PD55fH59vr98Pf84O743+338ff92en27fX73Ov22ev23uz38vj85vH58/n+8ff84e/46fP64+/4+vz++/3/6PL66/T79vr+7vb72Or12+v34O739/v+7/b82Or27PX79Pn86vT6+v3+7/b77vb87/f85/L56vP69fr+5fD56/T6/P3++Pv92+r25PD44/D47PT73e339/v98Pf99fn9x9De2On2+/z+/P7+/f7+3+736PP6+Pz+5/H5ydHf4e744O335vL57PX67vX79/r93ez23Ov34u744+/58/n83e326vP74/D59/r++vz/4e/33u32yNHf7PT67fb79vv+8vn9+fr85+vx9Pr+z9fj/f//5PH5ydLf3+z36fP78PL27fX6sNDr4O/46fL69fn86vT7+f3+7vX89vv9qczq+fz/3uz27/L28fj88/j++vv96/P68vj+5enwuNXu5fH44vD47PD06PH6p8zqq87r3+32u9fu7fb89vn96/X7y9Pg7/f77fT69fv+5O/5wNrwyN/y4u/58vn84e754u73xs/e+Pn72un24O342ur36/X62uDpv9nw3ePr9vr89vv/qs3q8/j84+/63ev46/P7w9zx3ez46OvxytLf6+/07O/17vb6+v3/8Pj88Pj92Oj25vD55vH45Ojv3ev3/f3/3Or2+/v92uv3/v7+zdbiztXi5PH4ydHguNbu9fr/4ebuyNDeyNDf//7/Wm76GAAACxxJREFUeNrsmgd029YVhi3GKR1XMR05TlKnceM0zWwTB2+AAElwiUskxSlTovbe1LKWtWxK8t52hjOdHWc7y9kdaeuOdM+kVXfSPdO9AZLgBEU5AY/lc3B1DgkQD08fH96797/3cYn8zLElEqvEKrFKrBKrxCqxSqwSq8QqsUqsi4LC7A7t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');
        background-repeat: no-repeat;
        width: 171px;
        height: 121px;
    }
    .theme{
        font-size: 11px;
        color: #B2B5BE;
        margin-top: 5px;
    }
    .knowlegdeBaseIcon{
        padding-left: 33px;
        position: relative;
        color: #6c7275;
        transition: all .3s;
    }
    .knowlegdeBaseIcon:hover{
        color: #319ADC;
        transition: all .3s;
    }
    .knowlegdeBaseIcon:before,
    .knowlegdeBaseIcon:after{
        content: '';
        position: absolute;
        width: 28px;
        height: 25px;
        display: block;
        background-repeat: no-repeat;
        transition: all .3s;
        margin-left: -33px;
        margin-top: -4px;
    }
    .knowlegdeBaseIcon:before{
        background-image: url('data:image/false;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAZCAYAAAAiwE4nAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyFpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpFMzE5QTc2NTBGMEQxMUU3OTYxMDhEOTE0MkZBNEE2MyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFMzE5QTc2NjBGMEQxMUU3OTYxMDhEOTE0MkZBNEE2MyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkUzMTlBNzYzMEYwRDExRTc5NjEwOEQ5MTQyRkE0QTYzIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkUzMTlBNzY0MEYwRDExRTc5NjEwOEQ5MTQyRkE0QTYzIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+IGPmoAAAAZ9JREFUeNrs1s0rRFEYx3HDmPGSWEjkJZOljWwoL1EiGwulvC3wB9jaWNpYKVuL2QglSikbIaxlr8jrlKLMqKFm5vqe+tGla1zMzEKe+nTv3M55nnPuyznjsSwrK5PhfT2Znpl9Pa3AsTRiC0vYw9MnefLQgWH04ggNEjINZqan3he0RS78WEU3WjAKS533say2Q2jXID04Q6n6NimX8wxtYTqGsYtL1KldKwbRiQG1PcUmVnCIGC7UN6xcXxZ0iphu6Z5+z+s4+d1nmG07T+AW0RS+I1HlTDgVjKAM+SksmK+cEaeCGYn/ghkpGEc1FlCOILrgS5LHpzZB9VlQjrib7/AGtWjDHXowps7XWEe92s6hH5XI0Uq0IePK9WVB882cy6Ku+TWAEfRpQFk67mitPUiy1iYtaEa7hmbbtWdsi5swxSdw4uYZmkEEfvluBHRXXM0wqhmFtEN8NzzqF3Zb0Kx9NWnfgInCH87ITcSdCnr/5Epjn9UVClKY2zyeEm1Nj6j6WLAIxWma2IPTDM1I7tM0w7cN2JPp/6UvAgwAYvFeQNw5kd4AAAAASUVORK5CYII=');
        opacity: 1;
    }
    .knowlegdeBaseIcon:hover:before{
        opacity: 0;
    }
    .knowlegdeBaseIcon:after{
        background-image: url('data:image/false;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAZCAYAAAAiwE4nAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyFpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpFMUVEMDNCNTBGMEMxMUU3QjdBNjgwM0U3M0Q0NDVGNyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFMUVEMDNCNjBGMEMxMUU3QjdBNjgwM0U3M0Q0NDVGNyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkUxRUQwM0IzMEYwQzExRTdCN0E2ODAzRTczRDQ0NUY3IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkUxRUQwM0I0MEYwQzExRTdCN0E2ODAzRTczRDQ0NUY3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+zmqVlQAAAbFJREFUeNrs1s8rBGEcx/Ed1q7NRZJIZHN00V4oP6JELg5K+XVAufpXlOse9iKUKKVchHCWu9ASSlHWYZE13k99JkOza2h3D/KtVzOm5/v9zjOz8zws27YDxYygcxKLnzqndTiWGLawhD08ZalTjh6MYxBHaJUbM+BotvlzQ1eUIYxV9KMDk7CVvI9ljR1Dt27SwjmqldumWt4zdIVJTGEXl2jWuE6MohcjGnuGTazgEK+4UG5Ktb5t6BWveqR7+ntBx7mfvsMS1/kbbpHO428krZpvXg0fUYNIHhtGVPPRq2FR4r9hURpm0IA4apFAH0I56oQ0JqGcuGpk/HyH12hCF+4wgCklX2EdLRo7j2HUo1Qr0YZMq1buhpZtm28maVtWkuOiLod1AxMY0g0FdNzRWnvgrLXUCJCfe/F2hbnbNZLanQskP3PYlqxhfew8B5zPkHfip6G5Fs1SyG9E9VR8zdAsR896H7/ZLC3lpXw15DGYta+x4BswUfHLGfmJjFfD4J9caYJffiz53AvN66nU1hR2tj13wxdUFWhiD14zNOvhfYFmGHJ908X9v/RdgAEAHGxuV49nkrsAAAAASUVORK5CYII=');
        opacity: 0;
        top: 0;
    }

    .knowlegdeBaseIcon:hover:after{
        opacity: 1;
    }
    .listLimited.expand .listLimited_element:nth-child(n+5)
    {
        display: none;
    }
    .listLimited.expand .listLimited_element.request:nth-child(4){
        margin-bottom: 0;
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
    .listLimited .expandControl{
        /*padding-top: 0;*/
    }
    .listLimited .expandControl:before{
        display: none;
    }

</style>

                <div class="progress"><h3 class="hider">Рассмотрение обращения</h3>
                    <div class="progressList ajaxNeed hidebleContent" data-xslt="CARD$APPEAL$STATE">
                        <!--div class="stage">
                            <div class="pointer PERFORMED"></div>
                            <div class="desc">Новое обращение</div>
                        </div>
                        <div class="stage">
                            <div class="pointer IN_PROGRESS"></div>
                            <div class="desc">В обработке (1 линия)</div>
                        </div>
                        <div class="stage">
                            <div class="pointer"></div>
                            <div class="desc">В обработке (2 линия)</div>
                        </div>
                        <div class="stage">
                            <div class="pointer"></div>
                            <div class="desc">Выполнено</div>
                        </div-->
                    </div>
                </div>
                <div class="requestHistory">
                    <h3 class="hider">История обращений</h3>
                    <div class="hidebleContent">
                        <div class="tabs" >
                            <div class="tabHead">
                                <div class="tab active" data-link="DECLARANT">По заявителю</div>
                                <div class="tab" data-link="ORG">По организации</div>
                            </div>
                            <div class="ajaxNeed" data-xslt="CARD$APPEAL$HISTORY">
                                <!--div class="requestList" data-link="DECLARANT">
                                    <div class="request">
                                        <div class="status got">Принято</div>
                                        <div class="title"><a href="">№ КС-00001/16</a></div>
                                        <div class="content">Проверка законности застройки участка на территории лесопарка...</div>
                                    </div>
                                    <div class="request">
                                        <div class="status seen">Рассмотрено</div>
                                        <div class="title"><a href="">№ КС-00001/16</a></div>
                                        <div class="content">Проверка законности застройки участка на территории лесопарка...</div>
                                    </div>
                                    <div class="request">
                                        <div class="status rejected">Отказано</div>
                                        <div class="title"><a href="">№ КС-00001/16</a></div>
                                        <div class="content">Проверка законности застройки участка на территории лесопарка...</div>
                                    </div>
                                </div>
                                <div class="requestList" data-link="ORG">
                                    <div class="request">
                                        <div class="status got">Принято</div>
                                        <div class="title"><a href="">№ КС-00001/16</a></div>
                                        <div class="content">Проверка законности застройки участка на территории лесопарка...</div>
                                    </div>
                                    <div class="request">
                                        <div class="status seen">Рассмотрено</div>
                                        <div class="title"><a href="">№ КС-00001/16</a></div>
                                        <div class="content">Проверка законности застройки участка на территории лесопарка...</div>
                                    </div>
                                    <div class="request">
                                        <div class="status rejected">Отказано</div>
                                        <div class="title"><a href="">№ КС-00001/16</a></div>
                                        <div class="content">Проверка законности застройки участка на территории лесопарка...</div>
                                    </div>
                                </div-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="knowledgeBase">
                    <h3 class="hider">База знаний</h3>
                    <div class="hidebleContent">
                        <div class="issueList ajaxNeed" data-xslt="CARD$APPEAL$KNOWLEDGE_BASE">
                            <div class="issue"><div class="title"></div>
                            <div class="content"><a href=""></a></div></div>
                        </div>
                        <!--div class="knowledgeControls">
                            <div class="addNew">Добавить в Базу знаний</div>
                            <div class="tagLine">
                                <div class="tagHead">Другие статьи по меткам:</div>
                                <div class="tag">Оформление</div>
                                <div class="tag">ЗОС</div>
                                <div class="tag">ЭЦП</div>
                            </div>
                        </div-->
                    </div>
                    <a href="/ugd/tabInfo.action?tab=KNOWLEDGE_BASE&amp;documentId=3978E11B01E54164B7930698B526B67F#/tree::rel=1/card::cardId=CARD$KNOWLEDGE_BASE" target="_blank" style="margin-top: 25px;    display: block; position: relative;"><div class="knowlegdeBaseIcon">Перейти в базу знаний</div></a>
                </div>
                <div class="attachedFiles">
                    <h3 class="hider">Приложенные файлы</h3>
                    <div class="fileList hidebleContent ajaxNeed" data-xslt="CARD$APPEAL$FILES">
                    </div>
                </div>

<script type="text/javascript" src="/static/fileBaloon/fileBaloon.js"></script>
<script>
<![CDATA[
/*fileBaloon.folder.portal = '/ugd';*/

function showTabList(){
    $('.requestList').each(function(indx, elm){
        if ($(elm).parents('.tabs').find('.tab[data-link="'+$(elm).attr('data-link')+'"]').hasClass('active')){
            $(elm).show();
        } else {
            $(elm).hide();
        }
    });
}
function getSideBlockData(inParams){
    var inParamsCount = (Object.keys(inParams).length==1 && !inParams.documentId)?true:false;
    console.log(inParams);
    inParams = {
        documentId: (inParams.documentId)?inParams.documentId:'',
        FIRST_NAME: (inParams.firstName)?inParams.firstName:'',
        LAST_NAME: (inParams.lastName)?inParams.lastName:'',
        PHONE: (inParams.phone)?inParams.phone:'',
        EMAIL: (inParams.email)?inParams.email:'',
        ORG: (inParams.org)?inParams.org:'',
        APPEAL_TYPE: (inParams.appealType)?inParams.appealType:'',
        TEG: (inParams.tag)?inParams.tag:[]
    };
    $('.ajaxNeed').each(function(indx, elm){
        if ($(elm).attr('data-xslt')){
            sendData = inParams;
            sendData['cardId'] = $(elm).attr('data-xslt');
            if (sendData.TEG.length>0){
                var outArr = [];
                for(var key in sendData){
                    if (key != 'TEG'){
                        outArr.push(key+'='+sendData[key]);
                    }else{
                        outArr.push('TEG='+sendData[key].join('&TEG='));
                    }
                }
                sendData = outArr.join('&');
            }
            $.ajax({
                url: 'getCardHtml.action',
                type: 'GET',
                data: sendData
            }).success(function(data){
                var $data = $(data);
                console.log($(elm).attr('data-xslt'));
                console.log($data);
                console.log($data[1].length);
                console.log(inParamsCount);

                if ($(elm).attr('data-xslt')== 'CARD$APPEAL$KNOWLEDGE_BASE' && !inParamsCount && $data.length < 2){
                    var emptyBlock = $('<div/>');
                    emptyBlock.addClass('emptyKnowledge')
                    $(elm).html(emptyBlock);
                }else{
                    $(elm).html(data);
                    $(elm).find('a').each(function(indx, elm){
                        if ($(elm).attr('data-link')){
                            $(elm).attr('href', $(elm).attr('data-link'))
                        }
                    });
                    showTabList();
                }
                if ($data.length < 4){
                    $(elm).parents('.hidebleContent').prev('.hider').addClass('closed');
                }
                $(elm).find('.listLimited').each(function(indx, elm){
                    if ($(elm).find('.listLimited_element').length > 4){
                        var $expandControl = $('<div/>');
                        $expandControl.addClass('expandControl');
                        $expandControl.html('<span class="toExpand">Развернуть</span><span class="toShrink">Свернуть</span>');
                        $(elm).append($expandControl);
                        $(elm).addClass('expand');
                        $expandControl.find('.toShrink').hide();
                    }
                });
                $('.file').each(function(indx2, elm2){
                    $(elm2).attr('data-filetype', $(elm2).attr('data-filetype').toLowerCase());
                });

            });
        }
    });
}

$(function(){
    showTabList();
    $('.tab').click(function(){
        $(this).siblings('.tab').removeClass('active');
        $(this).addClass('active');
        showTabList();
    });
    $(document).on('click', '.hider', function(){
        if($(this).hasClass('closed')){
            $(this).removeClass('closed');
        }else{
            $(this).addClass('closed');
        }
    });
    getSideBlockData({documentId: $('[name="documentId"]').val()});

    $(document).on('click', '.listLimited .toExpand, .listLimited .toShrink', function(){
        if ($(this).hasClass('toExpand')){
            $(this).parents('.listLimited').removeClass('expand');
        }else{

            $(this).parents('.listLimited').addClass('expand');
        }
        $(this).hide();
        $(this).siblings('span').show();
    });

});
]]>
</script>
</div>
