<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>
    <xsl:variable name="DATA" select="//FT_CARD_TASKS//TASK"/>
    {B{CARD$TEMPLATE}E}

    <xsl:template match="/">
    <link rel="stylesheet" href="/static/typeForm/css/fileuploader.css" />
    <link rel="stylesheet" href="/static/TokenInput/latest/token-input.css" />
    <link rel="stylesheet" href="/static/typeForm/css/form.css" />
    <link rel="stylesheet" href="/static/multiselect/multiselect.css" />
    <link rel="stylesheet" href="/portal_static/css/form-customize.css" />
    <link rel="stylesheet" href="/static/fancybox/jquery.fancybox.css" />
    <link rel="stylesheet" href="/static/fancybox/helpers/jquery.fancybox-thumbs.css" />
    <style>
      body {
       margin: 0;
       font-family: 'PTSans', Arial, sans-serif;
       background-color: #EEF2F4;
     }
     #tabsContentArea {
       padding: 0;
     }
     #tabViewContent a:visited,
     #tabViewContent a {
       color: #0144dd;
       text-decoration: none;
     }
     #tabViewContent a:hover {
       color: #c00;
       border-bottom: 1px solid  #c00;;
     }
      #tabViewContent a[target="_blank"]::after {
          content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPBAMAAADJ+Ih5AAAAGFBMVEX///9fmezw8PA2eMihw/M5eMeiwvOnxO40va+0AAAAPklEQVQI12PAChIFBUXADAEGBkYII9QYymAAMxwFBZiZQQwhpYIAKEOZgQHCMCoUFAMzlBSBFDaGI9gCBAAAc7wGGRqx47YAAAAASUVORK5CYII=');
          display: inline-block;
          margin-left: 4px;
          position: absolute;
      }
      #tabs-container.ui-tabs .ui-tabs-nav a:hover {
        border: 0;
      }
      .ft-wrapper {
        width: 100%;
        display: -webkit-flex;
        display: -ms-flex;
        display: flex;
        font-size: 14px;
      }

      .ft-card {
        background: #fff;
        width: calc(100% - 326px);
        position: relative;
      }
      .ft-props {
        width: 326px;
        background: #F2F6FA;
        padding: 25px 0;
      }
      .ft-props h2 {
        display: block;
        text-align: center;
        font-size: 19px;
        margin: 0 0 29px;
        font-weight: normal;
      }
      .ft-deadline {
        margin-bottom: 18px;
        margin-left: 17px;
      }
      .ft-deadline span {
        color: #7d8fa4;
        display: block;
        font-size: 13px;
      }
      .ft-deadline strong {
        font-weight: normal;
      }
      .ft-people-group {
        margin-bottom: 33px;
      }
      .ft-people-group:last-child {
        margin-bottom: 0;
      }
      .ft-people-group li {
        min-height: 46px;
        display: block;
        margin-bottom: 5px;
        position: relative;
      }
      .ft-people-group li:last-child {
        margin-bottom: 0;
      }
      .ft-people-group-inner {
        display: -webkit-flex;
        display: -ms-flex;
        display: flex;
        border-left: 3px solid transparent;
        padding: 5px 0;
        position: absolute;
        cursor: pointer;
      }
      .ft-people-group li:hover .ft-people-group-inner {
        background: #fff;
        width: 400px;
        z-index: 10;
        -webkit-box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);
        -moz-box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);
        box-shadow: 0px 0px 17px 0px rgba(0,0,0,0.42);
      }
      .ft-people-group li:hover .ft-people-extended-info {
        display: block;
      }
      .ft-people-group li:hover .ft-people-photo span {
        border-color: #BCCAD3;
      }
      .ft-people-author .ft-people-group-inner {
        border-color: #7266ba;
      }
      .ft-people-executor .ft-people-group-inner {
        border-color: #23b7e5;
      }
      .ft-people-external-executor .ft-people-group-inner {
        border-color: #fad733;
      }
      .ft-people-observer .ft-people-group-inner {
        border-color: #27c24c;
      }

      .ft-people-photo {
        padding-left: 17px;

      }
      .ft-people-photo span {
        display: block;
        width: 34px;
        height: 34px;
        border: 2px solid #fff;
        border-radius: 50%;
        position: relative;
        top: 2px;
        -webkit-background-size: cover;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center center;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAMAAAANmfvwAAAAh1BMVEUAAADY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+WKk5iPmJ2NlpvU2+Grs7nDy9G+xsuttrugqa7N1Nqyur+VnqOSm6DW3eOjrLGcpaqXoKXJ0de6wseosLadpqvP192aoqh4jQezAAAAFXRSTlMA+uy0s6BgIhbyy35aPcxZ83w+ejxHN123AAABYklEQVQ4y42U2XLCMAxFnZUQdlpvsbMCAUL///vaNLIsmtLpfZPnjCVdyWZEWZrkYRCEeZJm7Ddt4oCjgngzAxYR/6Fo8Uzslnym5ZoSKw4yg7gYhFaeeIMjfRajztoxB8wCB6dKTKpOjtlBpa4OK5ws1jPVjL0UiBS+r5F4x1AiIjlq9CfGqEek90jMWOY97RBpic8ZS32kEFHcK2WJDypEPgiSsNwHN0QaguQs9AFad9EECVlAohqQKycKKKKv92lGV00Rn6huWlUXUsl7LdumJomgXF2q79mYxnAztl24m7bQtB6mFLwRJZ/SDcAkYF0Js9GmNRpcLk5gXRbQCd6sullnsZkGAGNEWwtRXFxQwhjZhiJfgN+ayi0Di+iqdLbFpRlviXAxH7as+k4qJaRQSnZ9VdqHX0y25i+FT+nwiliRp/YnAbn2c2C//v+zRx1jujrxcQbAF7Qdv6Dt8xf0CQt3TYPhEUP4AAAAAElFTkSuQmCC');
      }
      .ft-people-info {
        padding: 0 13px;
      }
      .ft-people-info &gt; span {
        display: block;
      }
      .ft-people-info &gt; strong {
        font-weight: bold;
        font-size: 11px;
        color: #7d8fa4;
      }
      .ft-people-extended-info {
        display: none;
        margin: 13px 0;
      }
      .ft-people-extended-info table {
        margin-bottom: 26px;
      }
      .ft-people-extended-info th {
        width: 116px;
        text-align: left;
        overflow: hidden;
        font-weight: normal;
        vertical-align: top;
        padding: 4px 0;
      }
      .ft-people-extended-info th span {
        background-color: #fff;
        position: relative;
        z-index: 2;
        padding-right: 3px;
      }
      .ft-people-extended-info th span:after {
        content: '........................................';
        display: block;
        white-space: nowrap;
        position: absolute;
        color: #000;
        opacity: .2;
        bottom: 0;
        z-index: -1;

      }
      .ft-people-extended-info td {
        padding: 4px;
        vertical-align: top;
      }
      .ft-people-extended-info strong {
        font-weight: bold;
      }
      .ft-people-extended-info p {}

      .ft-card-actions {
        background-color: #FAFBFC;
        border-top: 1px solid #ebebeb;
        padding: 20px;
        position: absolute;
        right: 0;
        left: 0;
        bottom: 0;
      }
      .ft-button {
        display: inline-block;
        margin-right: 10px;
        border-radius: 3px;
        border: 1px solid transparent;
        /*min-width: 150px;*/
        padding: 7px 10px;
        background: transparent;
        font-size: 16px;
        position: relative;
        cursor: pointer;
        text-decoration: none;
      }
      .ft-button:hover {
        background-color: #fff;
        border-color: #ccc;
      }
      .ft-button-primary {
        color: #fff;
        background-color: #319ADC;
      }
      .ft-button-primary:hover {
        background-color: #0072ff;
        border-color: transparent;
      }
      .ft-button:before {
        content: '';
        display: block;
        background-repeat: no-repeat;
        background-position: center center;
        height: 100%;
        position: absolute;
        left: 10px;
        top: 0;
        opacity: .7;
      }
      .ft-button-new-task {
        padding-left: 34px;
      }
      .ft-button-new-task:before {
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAQCAMAAAAs2N9uAAAAUVBMVEUAAACAgIB/f39/f3+AgIB/f3+AgICAgICAgICAgICAgICAgICAgIB/f39/f39/f3+AgICAgICAgICAgIB/f39/f39/f39/f39/f39/f3+AgIBJ6AH+AAAAGnRSTlMA12AXjz6dv5P35d3HZkoEz7Ojg3RYMCwcCAb81MAAAABjSURBVBjTZc5HDsAgAANBA6Gk9+b/PzQSASXAHkc+GL90p5AlKVRBn92DM7O1gtHUUjMU7GiYJDBOTKvQFwLnx2aTUppXYMlWxxNe0LI+EckLOhqErh4+xx1ZA3VOY1MQ1pweqi0J4axuCroAAAAASUVORK5CYII=');
        width: 18px;
      }
      .ft-button-cancel-task {
        padding-left: 30px;
      }
      .ft-button-cancel-task:before {
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAOCAMAAADDoWbgAAAAM1BMVEUAAAB/f3+AgICAgIB/f39/f3+AgICAgICAgICAgICAgICAgIB/f3+AgICAgIB/f3+AgIBsJ/mfAAAAEHRSTlMADKvDBBjXuvOjjYII48sokG78nwAAAFJJREFUCNddzlEKwCAMA1CrVjd1W+5/2jUFQeqH4ZVAm8KTKZ5rqv0dhawZzeKGkUD3IUmw4rzg/U0i6GyujaYFyJUbiCSk6SUS+VjoMJDjCzf/QmwDXrc94cYAAAAASUVORK5CYII=');
        width: 13px;
      }
      .ft-button-save-task {
          padding-left: 33px;
          float: right;
      }
      .ft-button-save-task:before {
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQBAMAAADt3eJSAAAAJFBMVEUAAAAzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzN41ygbAAAAC3RSTlMA8wTRs6uHPDa7k2iUBc8AAABCSURBVAjXY1i9GwQaGBg2cO9mYNgpDmVsCiyAMDaoSkAZTM5QBgM3kAHUBGYwgAAKgw1kYAJIDUhgA3EM791gsBkApAQm2ZecDSwAAAAASUVORK5CYII=');
        width: 16px;
      }
      .ft-button-back {
        padding-left: 34px;
      }
      .ft-button-back:before {
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAQCAMAAAAs2N9uAAAAUVBMVEUAAACAgIB/f39/f3+AgIB/f3+AgICAgICAgICAgICAgICAgICAgIB/f39/f39/f3+AgICAgICAgICAgIB/f39/f39/f39/f39/f39/f3+AgIBJ6AH+AAAAGnRSTlMA12AXjz6dv5P35d3HZkoEz7Ojg3RYMCwcCAb81MAAAABjSURBVBjTZc5HDsAgAANBA6Gk9+b/PzQSASXAHkc+GL90p5AlKVRBn92DM7O1gtHUUjMU7GiYJDBOTKvQFwLnx2aTUppXYMlWxxNe0LI+EckLOhqErh4+xx1ZA3VOY1MQ1pweqi0J4axuCroAAAAASUVORK5CYII=');
        width: 18px;
        -moz-transform: scaleX(-1);
        -o-transform: scaleX(-1);
        -webkit-transform: scaleX(-1);
        transform: scaleX(-1);
      }
      .ft-button:hover:before {
        opacity: 1;
      }
      .ft-button-form {
        border: 1px solid #d9dbdd;
      }
      .ft-button-form:hover {
        border: 1px solid #999;
      }
      .ft-card-body {
        padding: 20px;
        margin-bottom: 77px;
      }
      .ft-card-body hr {
        border: 0;
        width: 100%;
        height: 1px;
        background-color: #ccc;
      }
      .ft-card-header {
        font-size: 19px;
        font-weight: normal;
      }
      .ft-form-title {
        display: block;
        margin-bottom: 6px;
      }
      .ft-note {
        padding-left: 40px;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAARVBMVEUAAADc4+zc5OzU6end4+zc5Ozf3+nd4end4+vd4+vc4+re5Ozc4+zf5evV6urd5Ovd5Ovd5Oze5Ozd4+vc5Ozc4evd5Oxne4CgAAAAFnRSTlMA18MM8+gYPPt9cJdqKAbj08ujeGA0JSGYVgAAAFpJREFUGNN1yVkOgCAUQ9GKIDKIc/e/VMEEeZrYv3OLtn5bLaQVqUVJp2Yp7fe2lPmxNndZqsdomIuZqp0hc3mbXfp4+DGDNJQOlAYjvDSodjhh5PPohME86QtHmwZyr7r8LAAAAABJRU5ErkJggg==');
        background-repeat: no-repeat;
        background-position: 10px 0;
      }
      .ft-form-comment {
        max-width: 100%;
        width: 100%;
        height: 120px;
        border: 1px solid #D9DBDD;
        padding: 10px;
        font-size: 16px;
        color: #7D8FA4;
        margin-bottom: 10px;
      }
      .ft-form-comment:hover,
      .ft-form-comment:focus {
        border-color: #41a3e0;
        outline: none;
        color: #333;
      }
      .ft-from-delete {
        width: 18px;
        height: 18px;
        margin: 0 auto;
        display: block;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASBAMAAACk4JNkAAAAFVBMVEUAAACqqqru7u7////Jycm9vb3l5eWDbaU7AAAAAXRSTlMAQObYZgAAADlJREFUCNdjYGAwFBQUFGYAAUUgSwjMclRgYBMB0oIwgMRiACIGEInCAkGyWUCAkwW3liEQzBBlAAA/LgX/9tYkWwAAAABJRU5ErkJggg==');
        background-position: center center;
        background-repeat: no-repeat;
        cursor: pointer;
      }
      .ft-from-delete:hover {
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASBAMAAACk4JNkAAAAFVBMVEUAAADIIgD/QBn/UjnvKwDfJgD/OhBtgCrbAAAAAXRSTlMAQObYZgAAADlJREFUCNdjYGAwFBQUFGYAAUUgSwjMclRgYBMB0oIwgMRiACIGEInCAkGyWUCAkwW3liEQzBBlAAA/LgX/9tYkWwAAAABJRU5ErkJggg==');
      }
      .ft-form-table {
        width: 100%;
        margin-bottom: 15px;
      }
      .ft-form-table td {
        padding-bottom: 10px;
      }
      .ft-form-table tr:last-child td {
        padding-bottom: 0;
      }
      .ft-form-add {
        font-size: 16px;
        position: relative;
        margin-left: 20px;
      }
      .ft-form-add:hover {
        border-bottom-style: dotted;
      }
      .ft-form-add:before {
        content: '+';
        font-size: 30px;
        left: -20px;
        top: -10px;
        position: absolute;
      }
      ul.token-input-list,
      .tokenWrapper {
        width: 100%;
        display: block;
      }
      .formWrapper {
        padding-top: 0;
      }
      .gallery-controls {
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        background: #000;
        height: 48px;
        font-size: 14px;
        color: #fff;
        display: none;
        z-index: 999999999;
      }
      .gallery-controls-inner {
        width: 1200px;
        margin: 0 auto;
        display: table;
        height: 100%;
      }
      .gallery-controls-left {
        text-align: left;
        display: table-cell;
        vertical-align: middle;
        height: 100%;
      }
      .gallery-controls-right {
        text-align: right;
        display: table-cell;
        vertical-align: middle;
        height: 100%;
      }

      .gallery-controls-close {
        width: 16px;
        height: 16px;
        display: inline-block;
        cursor: pointer;
        font-size: 28px;
        margin-left: 34px;
        position: relative;
        top: -2px;
      }
      .gallery-controls-save {
        display: inline-block;
        width: 18px;
        height: 16px;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAQCAMAAAAs2N9uAAAAS1BMVEUAAAD////+/v7+/v7+/v7////////+/v7+/v7+/v7////////+/v7+/v7+/v7////////+/v7////+/v7+/v7+/v7+/v7+/v7////fSdJ7AAAAGHRSTlMAQJ778yAU59pwUgzTwbd4PDYoy6+rSCziZdg8AAAAZ0lEQVQY063LSw6AIAxF0VoRVPzi7+1/pdJAQ3DsGTU3fZRNgPNUQdT9kAIzS7qY95z2FmrUt1HbUKaNkdDGUmwmFl3ZRtjNmNunkyaI3obHzxCOkLh16JFoSr+MZanTvIIZdOLjeAFfVgymulBzTwAAAABJRU5ErkJggg==');
        background-repeat: no-repeat;
        background-position: center center;
        position: relative;
        top: -4px;
        opacity: .7;
        margin-left: 20px;
        cursor: pointer;
      }
      #downloadWithEP.gallery-controls-save::after {
        content: "";
        width: 13px;
        display: block;
        position: absolute;
        height: 15px;
        background-image: url('/portal_static/img/signIcon.png');
        background-repeat: no-repeat;
        background-size: 13px 15px;
        background-position: center center;
        bottom: -10px;
        right: 8px;
      }
      .gallery-controls-print {
        display: inline-block;
        width: 18px;
        height: 16px;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAQCAMAAAAs2N9uAAAAPFBMVEUAAAD////////////+/v7+/v7////+/v7+/v7+/v7////+/v7+/v7////////////+/v7+/v7+/v7///9uHEA4AAAAE3RSTlMAQCBg3euAWJ2HdnBcKAwE08OrfbLEeAAAAGRJREFUGNN1ztsOhCAMRdEDFPA2OjP7//9VI16QxPXU7KRNJc0/CkuLCscQdpH/ciZfBoOuSR3wuVPhcS/Jj3Uat80J6gSDvjykFMWTGaL1kprzKIe+Tn2Y9lezO+Tj+9m4RC+tS/cKG6Z8W7UAAAAASUVORK5CYII=');
        background-repeat: no-repeat;
        background-position: center center;
        position: relative;
        top: -4px;
        opacity: .7;
        margin-left: 20px;
        cursor: pointer;
      }
      .gallery-controls-checkEP {
        display: inline-block;
        width: 18px;
        height: 16px;
        background-image: url('/portal_static/img/signIcon.png');
        background-repeat: no-repeat;
        background-position: center center;
        position: relative;
        background-size: 18px;
        top: -4px;
        opacity: .7;
        margin-left: 20px;
        cursor: pointer;
      }
      .gallery-controls-checkEP:hover,
      .gallery-controls-print:hover,
      .gallery-controls-save:hover {
        opacity: 1;
      }
      .fancybox-lock .fancybox-overlay {
        overflow-y: hidden;
        z-index: 1000000;
      }
      .fancybox-nav span {
        visibility: visible;
        background-image: none;
        color: red;
        top: 0;
        margin-top: 0;
        width: 100%;
        height: 100%;
      }
      .fancybox-nav span::before {
        content: '';
        position: absolute;
        top: 50%;
        margin-top: -18px;
        display: inline-block;
        width: 2em;
        height: 2em;
        border-right: 0.6em solid #999;
        border-top: 0.6em solid #999;
        transform: rotate(45deg);
      }
      .fancybox-nav span:hover::before {
        border-color: #fff;
      }
      .fancybox-prev span::before {
        transform: rotate(225deg);
        left: 20px;
      }
      .fancybox-next span::before {
        right: 20px;
      }
      .fancybox-prev {
        left: -140px;
      }
      .fancybox-next {
        right: -140px;
      }
      .document-gallery-thumb {
        position: relative;
        display: inline-block;
        width: 103px;
        height: 136px;
        border: 1px solid #ebebeb;
        background-repeat: no-repeat;
        background-position: center center;
        -webkit-background-size: cover;
        background-size: cover;
        margin-right: 8px;
        margin-bottom: 8px;
        outline: none;
      }
      .document-gallery-thumb::before {
        content: '';
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background: rgba(0, 0, 0, .3) url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAPCAMAAADJev/pAAAAeFBMVEUAAAD+/v7+/v7+/v7+/v7+/v7+/v7+/v7////+/v7////////+/v7+/v7+/v7+/v7+/v7////+/v7////////+/v7+/v7////////////+/v7+/v7+/v7+/v7+/v7+/v7////+/v7////+/v7////+/v7+/v7///8XIa5CAAAAJ3RSTlMA3vv2u7GdlQzQgQTvy7+niEAcFQjmq3tFMSzXo49waGJcPDgQTCT5kH6MAAAAxElEQVQY003QV47DMAwEUFJWd6/xOmXT5/43DCHIQd4XKYigRpSNF9swN/Yw0K8/WyBTy5125UEB4H66IDlPlAwaRwf2q0ljpxrhTcIf4bzG2iskXEY1y6ZSIxIxni0yoitqTxGtjAWc9vWVtB0sceWlsvjSJFiRQyeFLNjdpP2HoanGNQ1nizSr4lEyzyqWOQvgJrlfFBuJLUAPkj4upuuJ5HnzgxJvodp7/hxXwIy0e2mgCsaECqhv9Gs7Nwxw4x754APRqxcSS1FsxAAAAABJRU5ErkJggg==')
 center center no-repeat;
        z-index: 200;
        opacity: 0;
        -webkit-transition: opacity .3s;
        -o-transition: opacity .3s;
        transition: opacity .3s;
      }
      .document-gallery-thumb:hover::before {
        opacity: 1;
      }
      #tabViewContent a.document-gallery-thumb:hover {
        border-color: #ebebeb;
      }
      .ft-card-list li {
        margin-bottom: 3px;
      }
      </style>
      <div class="ft-wrapper">
        <div class="ft-card">
          <div class="ft-card-body" id="ntobr">

          <xsl:if test="$DATA/TEXT">
            <p id="taskText"><xsl:value-of select="$DATA/TEXT"/></p>
          </xsl:if>

          <xsl:if test="count($DATA/FILES/FILE) > 0">
            <div class="document-gallery">
                <xsl:for-each select="$DATA/FILES/FILE">
                  <a class="document-gallery-thumb" rel="fancybox" data-ep="{ECP}" data-cardid="{ID}" data-pagecount="{PAGECOUNT}" href="getImage.action?cardId={ID}&amp;page=1" style="background-image: url(/portal/getThumb.action?cardId={ID}&amp;page=1)" title="{FV_NAME}"></a>
                </xsl:for-each>
            </div>
          </xsl:if>

          <xsl:if test="$DATA/INF_PERFORMANCE">
            <h2 class="ft-card-header">Исполнение</h2>
            <p><xsl:value-of select="$DATA/INF_PERFORMANCE/TEXT"/></p>

            <xsl:if test="count($DATA//ATTR[NAME = 'REPORT_OBJ_NAME']/VALUES/VALUE) > 0">
            <strong class="ft-form-title">Объекты</strong>
            <ol class="ft-card-list">
              <xsl:for-each select="$DATA//ATTR[NAME = 'REPORT_OBJ_NAME']/VALUES/VALUE">
                <li><xsl:value-of select="text()" disable-output-escaping="yes" /></li>
              </xsl:for-each>
            </ol>
            </xsl:if>

            <xsl:if test="count($DATA//ATTR[NAME = 'REPORT_DOC_NAME']/VALUES/VALUE) > 0">
            <strong class="ft-form-title">Документы</strong>
            <ol class="ft-card-list">
              <xsl:for-each select="$DATA//ATTR[NAME = 'REPORT_DOC_NAME']/VALUES/VALUE">
                <li><xsl:value-of select="text()" disable-output-escaping="yes" /></li>
              </xsl:for-each>
            </ol>
            </xsl:if>

            <xsl:if test="count($DATA/INF_PERFORMANCE/FILES/FILE) > 0">
              <div class="document-gallery">
                  <xsl:for-each select="$DATA/INF_PERFORMANCE/FILES/FILE">
                    <a class="document-gallery-thumb" rel="fancybox" data-ep="{ECP}" data-cardid="{ID}" data-pagecount="{PAGECOUNT}" href="getImage.action?cardId={ID}&amp;page=1" style="background-image: url(/portal/getThumb.action?cardId={ID}&amp;page=1)" title="{FV_NAME}"></a>
                  </xsl:for-each>
              </div>
            </xsl:if>

            <xsl:if test="$DATA/INF_PERFORMANCE/EXECUTE_COMMENT">
              <hr />
              <p class="ft-note">
                <xsl:value-of select="$DATA/INF_PERFORMANCE/EXECUTE_COMMENT" />
              </p>
            </xsl:if>
          </xsl:if>

          <xsl:if test="$DATA/INPUT_INF_PERFORMANCE">
            <h2 class="ft-card-header">Исполнение</h2>
          </xsl:if>

          <xsl:if test="$DATA/INPUT_CONFIRM_PERFORMANCE">
            <h2 class="ft-card-header">Завершить задачу</h2>
          </xsl:if>



          <form id="form" class="formWrapper" method="POST">
            <input type="hidden" name="XML" id="xml" />
            <input xfTag="ID" type="hidden" value="{$DATA/ID}" />


              <xsl:if test="$DATA/INPUT_INF_PERFORMANCE">
                <div xfTag="REPORT">

                <input xfTag="ID" type="hidden" value="{$DATA/INPUT_INF_PERFORMANCE/REPORT/ID}" />
                <textarea xfTag="TEXT" placeholder="Опишите, что было выполнено" class="ft-form-comment"><xsl:value-of select="$DATA/INPUT_INF_PERFORMANCE/REPORT/TEXT"/></textarea>

                <xsl:if test="$DATA//ATTR[NAME = 'REPORT_DOC_NEW_LINK']/VALUES/VALUE">
                  <span style="margin-bottom: 10px" widthwin="900" heightwin="700" link="/{$DATA//ATTR[NAME = 'REPORT_DOC_NEW_LINK']/VALUES/VALUE}" class="ft-button ft-button-form newWindowData">
                    <xsl:choose>
                      <xsl:when test="$DATA//ATTR[NAME = 'REPORT_DOC_NEW_NAME']/VALUES/VALUE">
                        <xsl:value-of select="$DATA//ATTR[NAME = 'REPORT_DOC_NEW_NAME']/VALUES/VALUE"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>Создать мероприятие</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </span>
                </xsl:if>

                <xsl:if test="$DATA//ATTR[NAME = 'REPORT_OBJ_NEEDED']/VALUES/VALUE = '1'">
                  <strong class="ft-form-title">Объекты</strong>
                  <table class="ft-form-table" width="100%" xfTag="OBJECTS" data-template="objRow" data-linkTmpl="{$DATA//ATTR[NAME = 'REPORT_OBJ_LINK']/VALUES/VALUE}">
                    <xsl:choose>
                      <xsl:when test="count($DATA/INPUT_INF_PERFORMANCE/REPORT/OBJECTS/OBJECTS) > 0">
                      <xsl:for-each select="$DATA/INPUT_INF_PERFORMANCE/REPORT/OBJECTS/OBJECT">
                        <tr>
                          <td>
                            <div class="_token_input_wrapper" xfTag="ID">
                             <input type="text" class="tokenInput" data-identifier="{$DATA//ATTR[NAME = 'REPORT_OBJ_LIST']/VALUES/VALUE}" data-load-names="true" data-token-limit="1" data-info="inputName"/>
                             <span class="hidden tokenValues">
                                 <xsl:choose>
                                     <xsl:when test="ID = ''">
                                         <span class="tokenItem">
                                             <span class="tokenId"></span>
                                             <span class="tokenValue"></span>
                                         </span>
                                     </xsl:when>
                                     <xsl:otherwise>
                                       <span class="tokenItem">
                                           <span class="tokenId">
                                               <xsl:value-of select="ID"/>
                                           </span>
                                           <span class="tokenValue"></span>
                                       </span>
                                     </xsl:otherwise>
                                 </xsl:choose>
                             </span>
                           </div>
                          </td>
                          <td width="56px">
                            <span class="ft-from-delete" onclick="$(this).closest('tr').remove()"></span>
                          </td>
                          <td class="ft-from-link" width="100px"></td>
                        </tr>
                      </xsl:for-each>
                      </xsl:when>
                      <xsl:otherwise>
                        <tr>
                          <td>
                            <div class="_token_input_wrapper"  xfTag="ID">
                             <input type="text" class="tokenInput" data-identifier="{$DATA//ATTR[NAME = 'REPORT_OBJ_LIST']/VALUES/VALUE}"  data-load-names="true" data-token-limit="1" data-info="inputName"/>
                             <span class="hidden tokenValues">
                                 <xsl:choose>
                                     <xsl:when test="ID = ''">
                                         <span class="tokenItem">
                                             <span class="tokenId"></span>
                                             <span class="tokenValue"></span>
                                         </span>
                                     </xsl:when>
                                     <xsl:otherwise>
                                       <span class="tokenItem">
                                           <span class="tokenId">
                                               <xsl:value-of select="ID"/>
                                           </span>
                                           <span class="tokenValue"></span>
                                       </span>
                                     </xsl:otherwise>
                                 </xsl:choose>
                             </span>
                             </div>
                          </td>
                          <td width="56px">
                            <span class="ft-from-delete" onclick="$(this).closest('tr').remove()"></span>
                          </td>
                          <td class="ft-from-link" width="100px"></td>
                        </tr>
                      </xsl:otherwise>
                    </xsl:choose>


                    <xsl:for-each select="$DATA/INPUT_INF_PERFORMANCE/REPORT/OBJECTS/OBJECT">
                      <tr>
                        <td>
                           <input xfTag="ID" type="text" class="tokenInput" data-identifier="{$DATA//ATTR[NAME = 'REPORT_OBJ_LIST']/VALUES/VALUE}" data-load-names="true" data-token-limit="1" data-info="inputName"/>
                           <span class="hidden tokenValues">
                               <xsl:choose>
                                   <xsl:when test="ID = ''">
                                       <span class="tokenItem">
                                           <span class="tokenId"></span>
                                           <span class="tokenValue"></span>
                                       </span>
                                   </xsl:when>
                                   <xsl:otherwise>
                                     <span class="tokenItem">
                                         <span class="tokenId">
                                             <xsl:value-of select="ID"/>
                                         </span>
                                         <span class="tokenValue"></span>
                                     </span>
                                   </xsl:otherwise>
                               </xsl:choose>
                           </span>
                        </td>
                        <td width="56px">
                          <span class="ft-from-delete" onclick="$(this).closest('tr').remove()"></span>
                        </td>
                        <td class="ft-from-link" width="100px"></td>
                      </tr>
                    </xsl:for-each>
                  </table>


                  <xsl:if test="$DATA//ATTR[NAME = 'REPORT_OBJ_MULTIPLE']/VALUES/VALUE != 0">
                    <a class="ft-form-add" href="#">Добавить объект</a>
                    <br />
                    <br />
                  </xsl:if>
                </xsl:if>

              <xsl:if test="$DATA//ATTR[NAME = 'REPORT_DOC_NEEDED']/VALUES/VALUE = '1'">
                <strong class="ft-form-title">Документы</strong>
                <table class="ft-form-table" width="100%" xfTag="DOCUMENTS" data-template="docRow" data-linkTmpl="{$DATA//ATTR[NAME = 'REPORT_DOC_LINK']/VALUES/VALUE}">
                  <xsl:choose>
                    <xsl:when test="count($DATA/INPUT_INF_PERFORMANCE/REPORT/DOCUMENTS/DOCUMENT) > 0">
                      <xsl:for-each select="$DATA/INPUT_INF_PERFORMANCE/REPORT/DOCUMENTS/DOCUMENT">
                        <tr>
                          <td>
                            <div class="_token_input_wrapper" xfTag="ID">
                             <input type="text" class="tokenInput" data-paramnames="taskId"  data-load-names="true" data-parameters="{$DATA/ID}" data-identifier="{$DATA//ATTR[NAME = 'REPORT_DOC_LIST']/VALUES/VALUE}"  data-token-limit="1" data-info="inputName"/>
                             <span class="hidden tokenValues">
                               <xsl:choose>
                                   <xsl:when test="ID = ''">
                                       <span class="tokenItem">
                                           <span class="tokenId"></span>
                                           <span class="tokenValue"></span>
                                       </span>
                                   </xsl:when>
                                   <xsl:otherwise>
                                     <span class="tokenItem">
                                         <span class="tokenId">
                                             <xsl:value-of select="ID"/>
                                         </span>
                                         <span class="tokenValue"></span>
                                     </span>
                                   </xsl:otherwise>
                               </xsl:choose>
                             </span>
                           </div>
                          </td>
                          <td width="56px">
                            <span class="ft-from-delete" onclick="$(this).closest('tr').remove()"></span>
                          </td>
                          <td width="100px" class="ft-from-link"></td>
                        </tr>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                      <tr>
                        <td>
                          <div class="_token_input_wrapper" xfTag="ID">
                           <input type="text" class="tokenInput" data-paramnames="taskId"  data-load-names="true" data-parameters="{$DATA/ID}" data-identifier="{$DATA//ATTR[NAME = 'REPORT_DOC_LIST']/VALUES/VALUE}"  data-token-limit="1" data-info="inputName"/>
                           <span class="hidden tokenValues">
                             <xsl:choose>
                                 <xsl:when test="ID = ''">
                                     <span class="tokenItem">
                                         <span class="tokenId"></span>
                                         <span class="tokenValue"></span>
                                     </span>
                                 </xsl:when>
                                 <xsl:otherwise>
                                   <span class="tokenItem">
                                       <span class="tokenId">
                                           <xsl:value-of select="ID"/>
                                       </span>
                                       <span class="tokenValue"></span>
                                   </span>
                                 </xsl:otherwise>
                             </xsl:choose>
                           </span>
                         </div>
                        </td>
                        <td width="56px">
                          <span class="ft-from-delete" onclick="$(this).closest('tr').remove()"></span>
                        </td>
                        <td width="100px" class="ft-from-link"></td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                </table>

                <xsl:if test="$DATA//ATTR[NAME = 'REPORT_DOC_MULTIPLE']/VALUES/VALUE != 0">
                  <a class="ft-form-add" href="#">Добавить подготовленный документ</a>
                  <br/>
                  <br/>
                </xsl:if>
                </xsl:if>



                <div xfTag="FILES">
                  <span xfTag="ID" class="fileList" data-multiple="true" data-name-filename="file" data-name-fileid="file" data-sign="" data-pre-files="{$DATA/INPUT_INF_PERFORMANCE/REPORT/DOCUMENTS/FILES/FILES_STRING}">
                  </span>
                </div>
                </div>
              </xsl:if>


            <xsl:if test="$DATA/INPUT_CONFIRM_PERFORMANCE">
            <div xfTag="REPORT">
              <input xfTag="ID" type="hidden" value="{$DATA/INPUT_CONFIRM_PERFORMANCE/ID}" />
              <textarea xfTag="EXECUTE_COMMENT" placeholder="Добавить комментарий" class="ft-form-comment"><xsl:value-of select="$DATA/INPUT_CONFIRM_PERFORMANCE/EXECUTE_COMMENT"/></textarea>
            </div>
            </xsl:if>

          </form>

          <script id="objRow" type="text/template">
              <tr>
                <td>
                  <div class="_token_input_wrapper" xfTag="ID">
                    <input type="text" class="tokenInput"  data-load-names="true" data-identifier="{$DATA//ATTR[NAME = 'REPORT_OBJ_LIST']/VALUES/VALUE}" data-token-limit="1" data-info="inputName"/>
                  </div>
                </td>
                <td width="56px">
                  <span class="ft-from-delete" onclick="$(this).closest('tr').remove()"></span>
                </td>
                <td width="100px" class="ft-from-link"></td>
              </tr>
          </script>

          <script id="docRow" type="text/template">
              <tr>
                <td data-test="{$DATA//ATTR[NAME = 'REPORT_DOC_LIST']/VALUES/VALUE}">
                  <div class="_token_input_wrapper" xfTag="ID">
                    <input type="text" class="tokenInput"  data-load-names="true" data-paramnames="taskId" data-parameters="{$DATA/ID}" data-identifier="{$DATA//ATTR[NAME = 'REPORT_DOC_LIST']/VALUES/VALUE}" data-token-limit="1" data-info="inputName"/>
                  </div>
                </td>
                <td width="56px">
                  <span class="ft-from-delete" onclick="$(this).closest('tr').remove()"></span>
                </td>
                <td width="100px" class="ft-from-link"></td>
              </tr>
          </script>
          </div>

          <xsl:if test="count($DATA/BUTTONS/BUTTON) > 0">
          <div class="ft-card-actions">
            <xsl:if test="$DATA/BUTTONS/BUTTON[NICK = 'CANCEL_TASK']">
              <button type="button" data-name="CANCEL_TASK" data-link="{$DATA/BUTTONS/BUTTON[NICK = 'CANCEL_TASK']/LINK}" data-action="{$DATA/BUTTONS/BUTTON[NICK = 'CANCEL_TASK']/CUSTOM_ACTION}" class="ft-button ft-button-primary">Отменить задачу</button>
            </xsl:if>

            <xsl:if test="$DATA/BUTTONS/BUTTON[NICK = 'EXECUTE_TASK']">
              <button type="button" data-name="EXECUTE_TASK" data-link="{$DATA/BUTTONS/BUTTON[NICK = 'EXECUTE_TASK']/LINK}" data-action="{$DATA/BUTTONS/BUTTON[NICK = 'EXECUTE_TASK']/CUSTOM_ACTION}" class="ft-button ft-button-primary">Выполнить</button>
            </xsl:if>

            <xsl:if test="$DATA/BUTTONS/BUTTON[NICK = 'COMPLETE_TASK']">
              <button type="button" data-name="COMPLETE_TASK" data-link="{$DATA/BUTTONS/BUTTON[NICK = 'COMPLETE_TASK']/LINK}" data-action="{$DATA/BUTTONS/BUTTON[NICK = 'COMPLETE_TASK']/CUSTOM_ACTION}" class="ft-button ft-button-primary">Завершить</button>
            </xsl:if>

            <xsl:if test="$DATA/BUTTONS/BUTTON[NICK = 'REJECT_TASK']">
              <button type="button" data-name="REJECT_TASK" data-link="{$DATA/BUTTONS/BUTTON[NICK = 'REJECT_TASK']/LINK}" data-action="{$DATA/BUTTONS/BUTTON[NICK = 'REJECT_TASK']/CUSTOM_ACTION}" class="ft-button ft-button-cancel-task">Отклонить задачу</button>
            </xsl:if>

            <xsl:if test="$DATA/BUTTONS/BUTTON[NICK = 'NEW_TASK']">
              <button type="button" data-name="NEW_TASK" data-link="{$DATA/BUTTONS/BUTTON[NICK = 'NEW_TASK']/LINK}" data-action="{$DATA/BUTTONS/BUTTON[NICK = 'NEW_TASK']/CUSTOM_ACTION}" class="ft-button ft-button-new-task">Выдать новую задачу</button>
            </xsl:if>

            <xsl:if test="$DATA/BUTTONS/BUTTON[NICK = 'BACK_REVISION_TASK']">
              <button type="button" data-name="BACK_REVISION_TASK" data-link="{$DATA/BUTTONS/BUTTON[NICK = 'BACK_REVISION_TASK']/LINK}" data-action="{$DATA/BUTTONS/BUTTON[NICK = 'BACK_REVISION_TASK']/CUSTOM_ACTION}" class="ft-button ft-button-back">Вернуть на доработку</button>
            </xsl:if>

            <xsl:if test="$DATA/BUTTONS/BUTTON[NICK = 'SAVE_DATA']">
              <button type="button" data-name="SAVE_DATA" data-link="{$DATA/BUTTONS/BUTTON[NICK = 'SAVE_DATA']/LINK}" data-action="{$DATA/BUTTONS/BUTTON[NICK = 'SAVE_DATA']/CUSTOM_ACTION}" class="ft-button ft-button-save-task">Сохранить данные</button>
            </xsl:if>
          </div>
          </xsl:if>
        </div>
        <div class="ft-props">
          <h2>
            Задача
            <xsl:if test="$DATA/NUM != ''">
              <xsl:text> </xsl:text>
              <xsl:value-of select="$DATA/NUM"/>
            </xsl:if>
            <xsl:if test="$DATA/CREATE_DATE != ''">
              <xsl:text> от </xsl:text>
              <xsl:call-template name="date_transform">
                <xsl:with-param name="old_date" select="$DATA/CREATE_DATE"/>
              </xsl:call-template>
            </xsl:if>
          </h2>
          <div class="ft-deadline">
            <span>Срок исполнения</span>
            <strong>
              <xsl:call-template name="date_transform">
                <xsl:with-param name="old_date" select="$DATA/EXECUTE_DEADLINE"/>
              </xsl:call-template>
            </strong>
          </div>


          <ul class="ft-people-group ft-people-author">
            <li>
              <div class="ft-people-group-inner">
                <div class="ft-people-photo">
                  <span>
                    <xsl:if test="$DATA/EMPLOYEES/AUTHOR/FOTO_ID">
                      <xsl:attribute name="style">background-image: url(/portal/getThumb.action?cardId=<xsl:value-of select="$DATA/EMPLOYEES/AUTHOR/FOTO_ID"/>)</xsl:attribute>
                    </xsl:if>
                  </span>
                </div>
                <div class="ft-people-info">
                  <span><xsl:value-of select="$DATA/EMPLOYEES/AUTHOR/FIO"/></span>
                  <strong>автор задачи</strong>
                  <div class="ft-people-extended-info">
                    <table>
                      <xsl:if test="count($DATA/EMPLOYEES/AUTHOR/POSITION) &gt; 0">
                      <tr>
                        <th><span>Должность</span></th>
                        <td>
                          <xsl:for-each select="$DATA/EMPLOYEES/AUTHOR/POSITION">
                              <xsl:value-of select="text()"/>
                              <xsl:if test="position() != last()">
                              <xsl:text>, </xsl:text>
                              </xsl:if>
                          </xsl:for-each>
                        </td>
                      </tr>
                      </xsl:if>

                      <xsl:if test="$DATA/EMPLOYEES/AUTHOR/PHONE">
                        <tr>
                          <th><span>Позвонить</span></th>
                          <td><strong><xsl:value-of select="$DATA/EMPLOYEES/AUTHOR/PHONE"/></strong></td>
                        </tr>
                      </xsl:if>

                      <xsl:if test="$DATA/EMPLOYEES/AUTHOR/EMAIL">
                        <tr>
                          <th><span>Написать</span></th>
                          <td><a href="mailto:{$DATA/EMPLOYEES/EXECUTOR/EMAIL}"><xsl:value-of select="$DATA/EMPLOYEES/AUTHOR/EMAIL"/></a></td>
                        </tr>
                      </xsl:if>
                    </table>
                  </div>
                </div>
              </div>
            </li>
          </ul>

          <ul class="ft-people-group ft-people-executor">
            <li>
              <div class="ft-people-group-inner">
                <div class="ft-people-photo">
                  <span>
                    <xsl:if test="$DATA/EMPLOYEES/EXECUTOR/FOTO_ID">
                      <xsl:attribute name="style">background-image: url(/portal/getThumb.action?cardId=<xsl:value-of select="$DATA/EMPLOYEES/EXECUTOR/FOTO_ID"/>)</xsl:attribute>
                    </xsl:if>
                  </span>
                </div>
                <div class="ft-people-info">
                  <span><xsl:value-of select="$DATA/EMPLOYEES/EXECUTOR/FIO"/></span>
                  <strong>Исполнитель</strong>
                  <div class="ft-people-extended-info">
                    <table>
                      <xsl:if test="count($DATA/EMPLOYEES/EXECUTOR/POSITION) &gt; 0">
                      <tr>
                        <th><span>Должность</span></th>
                        <td>
                          <xsl:for-each select="$DATA/EMPLOYEES/EXECUTOR/POSITION">
                              <xsl:value-of select="text()"/>
                              <xsl:if test="position() != last()">
                              <xsl:text>, </xsl:text>
                              </xsl:if>
                          </xsl:for-each>
                        </td>
                      </tr>
                      </xsl:if>

                      <xsl:if test="$DATA/EMPLOYEES/EXECUTOR/PHONE">
                        <tr>
                          <th><span>Позвонить</span></th>
                          <td><strong><xsl:value-of select="$DATA/EMPLOYEES/EXECUTOR/PHONE"/></strong></td>
                        </tr>
                      </xsl:if>

                      <xsl:if test="$DATA/EMPLOYEES/EXECUTOR/EMAIL">
                        <tr>
                          <th><span>Написать</span></th>
                          <td><a href="mailto:{$DATA/EMPLOYEES/EXECUTOR/EMAIL}"><xsl:value-of select="$DATA/EMPLOYEES/EXECUTOR/EMAIL"/></a></td>
                        </tr>
                      </xsl:if>

                    </table>
                  </div>
                </div>
              </div>
            </li>
          </ul>

          <xsl:if test="count($DATA/EMPLOYEES/ACCOMPLICES/ACCOMPLICE) &gt; 0">
          <ul class="ft-people-group ft-people-external-executor">
              <xsl:for-each select="$DATA/EMPLOYEES/ACCOMPLICES/ACCOMPLICE">
            <li>
              <div class="ft-people-group-inner">
                <div class="ft-people-photo">
                  <span>
                    <xsl:if test="FOTO_ID">
                      <xsl:attribute name="style">background-image: url(/portal/getThumb.action?cardId=<xsl:value-of select="FOTO_ID"/>)</xsl:attribute>
                    </xsl:if>
                  </span>
                </div>
                <div class="ft-people-info">
                  <span><xsl:value-of select="FIO"/></span>
                  <strong>Привлеченный исполнитель</strong>
                  <div class="ft-people-extended-info">
                    <table>
                      <xsl:if test="count(POSITION) &gt; 0">
                      <tr>
                        <th><span>Должность</span></th>
                        <td>
                          <xsl:for-each select="POSITION">
                              <xsl:value-of select="text()"/>
                              <xsl:if test="position() != last()">
                              <xsl:text>, </xsl:text>
                              </xsl:if>
                          </xsl:for-each>
                        </td>
                      </tr>
                      </xsl:if>

                      <xsl:if test="PHONE">
                        <tr>
                          <th><span>Позвонить</span></th>
                          <td><strong><xsl:value-of select="PHONE"/></strong></td>
                        </tr>
                      </xsl:if>

                      <xsl:if test="EMAIL">
                        <tr>
                          <th><span>Написать</span></th>
                          <td><a href="mailto:{EMAIL}"><xsl:value-of select="EMAIL"/></a></td>
                        </tr>
                      </xsl:if>

                    </table>
                  </div>
                </div>
              </div>
            </li>
            </xsl:for-each>
          </ul>
          </xsl:if>

          <xsl:if test="count($DATA/EMPLOYEES/WATCHERS/WATCHER) &gt; 0">
          <ul class="ft-people-group ft-people-observer">
            <xsl:for-each select="$DATA/EMPLOYEES/WATCHERS/WATCHER">
            <li>
              <div class="ft-people-group-inner">
                <div class="ft-people-photo">
                  <span>
                    <xsl:if test="FOTO_ID">
                      <xsl:attribute name="style">background-image: url(/portal/getThumb.action?cardId=<xsl:value-of select="FOTO_ID"/>)</xsl:attribute>
                    </xsl:if>
                  </span>
                </div>
                <div class="ft-people-info">
                  <span><xsl:value-of select="FIO"/></span>
                  <strong>Наблюдатель</strong>
                  <div class="ft-people-extended-info">
                    <table>
                      <xsl:if test="count(POSITION) &gt; 0">
                      <tr>
                        <th><span>Должность</span></th>
                        <td>
                          <xsl:for-each select="POSITION">
                              <xsl:value-of select="text()"/>
                              <xsl:if test="position() != last()">
                              <xsl:text>, </xsl:text>
                              </xsl:if>
                          </xsl:for-each>
                        </td>
                      </tr>
                      </xsl:if>
                      <xsl:if test="PHONE">
                        <tr>
                          <th><span>Позвонить</span></th>
                          <td><strong><xsl:value-of select="PHONE"/></strong></td>
                        </tr>
                      </xsl:if>

                      <xsl:if test="EMAIL">
                        <tr>
                          <th><span>Написать</span></th>
                          <td><a href="mailto:{EMAIL}"><xsl:value-of select="EMAIL"/></a></td>
                        </tr>
                      </xsl:if>

                    </table>
                  </div>
                </div>
              </div>
            </li>
            </xsl:for-each>
          </ul>
          </xsl:if>
        </div>
      </div>
      <xml style="display: none">
        <xsl:copy-of select="*"/>
      </xml>
      <script src="/portal_static/js/form/ajaxupload-fix.js"></script>
      <script src="/static/FileUploader/2.0-beta/fileuploader.js"></script>
      <script src="/static/JQueryPlugins/jquery.fileUp.js"></script>
      <script src="/static/typeForm/typeForm.js"></script>
      <script src="/static/TokenInput/latest/jquery.tokeninput.js"></script>
      <!-- <script type="text/javascript" src="//rawgit.com/1ns0mn1ac/6c141c8c7e509ba8abbd8cabad151aea/raw/75c106bf2aa5c955299c2a4afc57f99cc0a7f447/tokenInput"></script> -->
      <script src="/static/typeForm/formHelper.js"></script>
      <script src="/elib/js/sign.js"></script>
      <script src="/static/fancybox/jquery.fancybox.pack.js"></script>
      <script src="/static/fancybox/helpers/jquery.fancybox-thumbs.js"></script>
      {B{FRM$XML_GENERATION$V0}E}

      <script id="controlsTemplate" type="x-template">
        <div id="galleryControls" class="gallery-controls">
          <div class="gallery-controls-inner">
            <div class="gallery-controls-left">
              <span id="galleryControlsTitle"></span>
            </div>
            <div class="gallery-controls-right">
              <a class="gallery-controls-print" id="printImage"  title="Напечатать" style="display: none;"></a>
              <a class="gallery-controls-save" id="saveImage" title="Скачать"></a>
              <a class="gallery-controls-save" id="downloadWithEP" title="Скачать с ЭП" style="display: none;"></a>
              <a class="cardCheckECP gallery-controls-checkEP" title="Проверить ЭП" style="display: none;"></a>
              <span class="gallery-controls-close" onclick="$.fancybox.close();" id="galleryControlsClose"><xsl:text disable-output-escaping="yes"><![CDATA[&times;]]></xsl:text></span>
            </div>
          </div>
        </div>
      </script>

      <script>
      var cardGallery = (function() {

        var controlsId = 'galleryControls',
          controlsTemplate = $('#controlsTemplate').html(),
          galleryOptions = {
            type: 'image',
            padding: 0,
            margin: [120, 60, 50, 60],
            closeBtn  : false,
            beforeLoad: function() {
              $('#' + controlsId).show();
            },
            afterLoad: function(current, previous) {
              var $currentElement = $(current.element),
                existsEP = !!$currentElement.data('ep'),
                cardId = $currentElement.data('cardid');

              $('#galleryControlsTitle').text(current.title);
              $('#printImage').attr('onclick', 'cardGallery.printImage("' + current.href + '")');

              $('#saveImage').attr('href', '/elib/getFile.action?app=' + app + '&amp;contentType=application/octet-stream&amp;cardId=' + cardId).attr('download', current.title);
              if (existsEP) {
                $('#downloadWithEP').attr('href', '/elib/getFileWithEcp.action?contentType=application/octet-stream<xsl:text disable-output-escaping="yes">&amp;</xsl:text>cardId=' + cardId).show();
                $('.gallery-controls-checkEP').attr('id', cardId).show();
              } else {
                $('#downloadWithEP').attr('href', '').hide();
                $('.gallery-controls-checkEP').hide();
              }

            },
            afterShow: function() {

            },
            afterClose: function() {
              $('#' + controlsId).hide();
            },
            helpers: {
              title: null,
              overlay: {
                // closeClick: false
              },
              documentPages: {
                width: 50,
                height: 50
              }
            }
          },
          printPageHtml = function(src) {
            return '<xsl:text disable-output-escaping="yes"><![CDATA[<html><head></head><body><img src="' + src + '" /></body></html>]]></xsl:text>';
          };

          return {
              init: function($element) {
                $(controlsTemplate).appendTo('body');
                $element.fancybox(galleryOptions);
              },
              printImage: function(src) {
                pagelink = "about:blank";
                var printWindow = window.open(pagelink, "_new");
                printWindow.document.open();
                printWindow.document.write(printPageHtml(src));

                setTimeout(function(){
                  printWindow.print();
                  printWindow.close()
                }, 10)

                return false;
              }
          }
      }());
      <xsl:text disable-output-escaping="yes">
      <![CDATA[
        $(function(){

          $(document).on('change', '[data-token-inited="true"]', function() {
            var $this = $(this),
                $tokenWrapper = $this.closest('.tokenWrapper'),
                $parent = $this.closest('tr'),
                linkTemplate = $parent.closest('table').data('linktmpl'),
                value = $tokenWrapper.find('.token-input-token input:hidden').val();
            (value) ? $parent.find('.ft-from-link').empty().append('<a target="_blank" href="' + linkTemplate.replace(/:ID:/g, value) + '">Перейти</a>') : $parent.find('.ft-from-link').empty();
          });

          $(document).on('blur', '.token-input-list', function() {
            var $this = $(this),
                $input = $(this).parent().find('input[data-token-inited="true"]');

            $input.tokenInput('setUrl', $input.data('tokenInputSettings').url);
          });

          setTimeout(function() {
            $('[data-token-inited="true"]').each(function(){
              var $this = $(this),
                  $tokenWrapper = $this.closest('.tokenWrapper'),
                  $parent = $this.closest('tr'),
                  linkTemplate = $parent.closest('table').data('linktmpl'),
                  value = $tokenWrapper.find('.token-input-token input:hidden').val();
              (value) ? $parent.find('.ft-from-link').empty().append('<a target="_blank" href="' + linkTemplate.replace(/:ID:/g, value) + '">Перейти</a>') : $parent.find('.ft-from-link').empty();
            });
          }, 500);


          setTimeout(function(){
            $('#ntobr p').each(function(){
              var $this = $(this),
                  text = $this.html().replace(/\n/g, '<br />')
              $this.html(text)
            });
            $('.tokenInput').each(function() {
                initTokenInput ($(this));
              });
            $('.fileList').fileUp();

          },100);

          cardGallery.init($('.document-gallery-thumb'));

          $('.ft-form-add').on('click', function(e){
            e.preventDefault();
            var $table = $(this).prev('.ft-form-table'),
                templateId = $table.data('template'),
                $tmpl = $($('#' + templateId).html());

            $table.append($tmpl);
            initTokenInput($tmpl.find('.tokenInput'));
          });

          $('#form').submit(function(e) {
            var xmlAsString = xf_generateXML('form');
            $('#xml').val(xmlAsString);
          });

          $('.ft-card-actions button').on('click', function(){
            var $this = $(this),
                link = $this.data('link'),
                action = $this.data('action');

            if (link) {
              var width = 1200,
                  height = 800,
                  left = ((screen.availWidth || screen.width) / 2) - (width / 2) + (screen.availLeft || 0),
                  top = ((screen.availHeight || screen.height) / 2) - (height / 2) + (screen.availTop || 0),
                  params = 'width=' + width + ',height=' + height + ',left=' + left + ', top=' + top + ',scrollbars=1,resizable=1';

              window.open(link, '', params);
              return;
            }

            if (action) {
              $('#xml').val(xf_generateXML('form'));

              tabInfo.showLoading();

              $.post('submit/simpleSubmit.action?action=' + action, $('#form').serializeArray())
                .done(function(data){
                  var json = $.parseJSON(data);
                  if (json.status == 'success'){
                      window.location.reload();
                  } else {
                      alert("Ошибка. \n" + json.msg);
                  }
                })
                .error(function(error){
                  alert(error);
                })
                .always(function(){
                    tabInfo.hideLoading();
                })
              return;
            }
          });

        });
      ]]>
      </xsl:text>
      </script>
    </xsl:template>
</xsl:stylesheet>
