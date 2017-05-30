<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="utf-8" indent="no"/>

    <xsl:template match="/">
      <xml style="display: none">
      	<xsl:copy-of select="*"/>
      </xml>
      <html lang="en">
      <head>
        <title>Document</title>
        <link rel="stylesheet" href="/portal_static/css/reset.css"/>
        <link rel="stylesheet" href="/portal_static/css/fonts/PTSans.css"/>
        <style>
          html, body {
            height: 100%;
            margin: 0;
            font-family: 'PTSans', Arial, sans-serif;
            background: #EEF2F4;
          }
          #tabsWrap {
            max-width: none;
            padding: 25px 35px;
          }
          .kb-main {
            display: -webkit-flex;
            display: -ms-flex;
            display: flex;
          }
          .kb-three-wrapper {
            min-height: 100%;
            display: inline-block;
            width: 37%;
            min-width: 280px;
          }
          .kb-three {
            border: 1px solid #ccc;
          }
          .kb-three h2 {
            color: #333;
            font-size: 22px;
            font-weight: normal;
            display: block;
            background: #fff;
            border-bottom: 1px solid #ccc;
            padding: 20px 60px;
          }
          .kb-three-root {
            list-style: none;
            padding-left: 0;
          }
          .kb-three-root  a {
            color: #333;
            line-height: 1.1em;
            text-decoration: none;
            font-size: 1em;
            display: block;
          }
          .kb-three-root &gt; li &gt; a {
            background: #fff;
            border-bottom: 1px solid #ccc;
            padding: 10px 53px;
          }
          .kb-three-root &gt; li:last-child &gt; a {
            border-bottom: 0;
          }
          .kb-three-container span {
            position: relative;
            padding: 5px 30px;
            display: inline-block;
            width: 100%;
          }
          .kb-three-container &gt; a &gt; span:before {
            content: '';
            position: absolute;
            display: block;
            width: 11px;
            height: 11px;
            left: 8px;
            top: 50%;
            margin-top: -5px;
            border-radius: none;
            background-color: none !important;
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAALCAYAAACprHcmAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAALBJREFUeNpi/P//PwOxgImBBMBSN2GpJpB2biqInoJNAVCeEUhVAfEckMlLgXgyULAGh4HTgLgFpAakOAOIvwNxA1BDKZqp04FUOhA/BeIKRpAHgYLmQM52IBYE4nwgngnE3UCcC8SPgdgW6MyHjLDQAGqwBFKHgPgvEJ8HYgsgfgHEjkCFN0BqGJGDDqjBCmoDHxA/gZr4AGvQASWOAaloIL4MxD7ICjFMpmqkAAQYAOncPrLJu31tAAAAAElFTkSuQmCC');
            background-position: center center;
            background-repeat: no-repeat;
            transition: all .3s ease;
          }
          .kb-three-container &gt; .kb-three-inner {
            display: none;
          }
          .kb-three-container &gt; .kb-havearticle-0 {
              opacity: .5;
          }
          .kb-three-inner span:before {
            content: '•';
            position: absolute;
            left: 10px;
            color: #7D8FA4;
          }
          .kb-three-inner {
            padding: 0 15px;
            overflow: hidden;
          }
          .kb-three-inner li {
            padding-top: 5px;
          }
          .kb-three-inner &gt; .kb-three-container:last-child {
            padding-bottom: 5px;
          }
          .kb-three-root &gt; li &gt; ul {
            padding-left: 79px;
          }
          .kb-three-inner a {
            font-size: .9em;
          }
          .kb-three-inner a:hover span {
            background-color: #E4EAF0;
          }
          .kb-three-open &gt; a &gt; span:before {
            -webkit-transform: rotate(-90deg);
            -ms-transform: rotate(-90deg);
            transform: rotate(-90deg);
          }
          a.kb-three-active {
            font-weight: bold;
            color: #215968;
          }
          
          .cardHeaderButtonBar {
              position: absolute;
              bottom: 0;
              right: 0;
          }
          .cardHeaderButtonBar .buttonIcon {
              cursor: pointer;
              padding: 10px;
              transition: all .3s;
          }
          .cardHeaderButtonBar .buttonIcon img{
              transition: all .3s;
          }
          .cardHeaderButtonBar .buttonIcon:hover {
              opacity: 0.7;
          }
          .cardHeaderButtonBar .buttonIcon:hover img{
              transition: all .3s;
              transform: rotate(180deg);
          }
          
          .kb-content {
            padding: 0 0 15px 15px;
            width: 100%;
          }
          .kb-breadcrumbs {
            height: 63px;
            padding: 34px 15px 0;
            width: 70%;
            line-height: .9em;
          }
          .kb-breadcrumbs ul {
            padding: 0;
            font-size: 11px;
          }
          .kb-breadcrumbs li {
            display: inline-block;
            color: #7d8fa4;
          }
          .kb-breadcrumbs li:after {
            content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAALCAYAAACprHcmAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAALBJREFUeNpi/P//PwOxgImBBMBSN2GpJpB2biqInoJNAVCeEUhVAfEckMlLgXgyULAGh4HTgLgFpAakOAOIvwNxA1BDKZqp04FUOhA/BeIKRpAHgYLmQM52IBYE4nwgngnE3UCcC8SPgdgW6MyHjLDQAGqwBFKHgPgvEJ8HYgsgfgHEjkCFN0BqGJGDDqjBCmoDHxA/gZr4AGvQASWOAaloIL4MxD7ICjFMpmqkAAQYAOncPrLJu31tAAAAAElFTkSuQmCC');
            display: inline-block;
            transform: rotate(-90deg) scale(.7);
            position: relative;
            margin: 0 7px 0 10px;
          }
          .kb-breadcrumbs li:last-child:after {
            content: ''
          }
          .kb-card {
            border-radius: 3px;
            border: 1px solid #e4e4e4;
            background: #fff;
            /*width: 70%;*/
          }
          .kb-card h1 {
            font-size: 1.2em;
            margin-bottom: 20px;
          }
          .kb-article-tags {
            padding: 0 20px 0 0;
          }
          .kb-article-tags li {
            margin-right: 6px;
            margin-bottom: 6px;
            display: inline-block;
          }
          .kb-article-tags li:last-child {
            margin-right: 0;
          }
          .kb-article-tags a {
            font-size: 11px;
            color: #fff;
            display: block;
            padding: 5px 10px;
            border-radius: 5px;
          }
          .kb-article-head {
            border-bottom: 1px solid #e4e4e4;
            padding: 23px 15px 15px;
            position: relative;
            background-color: #FAFBFC;
          }
          .kb-article-head h1 {
            font-size: 24px;
            font-weight: bold;
          }
          
          .kb-status-block {
              position: absolute;
              top: 0;
              right: 0;
          }
          .kb-status-element {
              background: #8FB400;
              color: #fff;
              padding: 2px 10px;
              line-height: 16px;
              font-size: 0.75em;
          }
          .kb-status-i {
              content: '';
              display: inline-block;
              margin-left: 10px;
              vertical-align: middle;
              width: 16px;
              height: 16px;
              background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAM1BMVEUAAAD///////////////////////////////////////////////////////////////+3leKCAAAAEHRSTlMAgvJDFAdTLvnRhtLTzlQxuL1V3wAAAGFJREFUGNNtj1kOgDAIRIUu0NaF+5/WQjUk4nwQ5oV1+1Xug7lBfn1FoFIIsD5e0kqSGMmoXkQJahfAtoDmfYZGPp3GDFy8ovAXoLU4oBaGhrXhMNNpp1+A1Z/bGQ97LuoGcHICxA/leuMAAAAASUVORK5CYII=') center center no-repeat;
          }
          .kb-status-target {
              position: absolute;
              top: 50%;
              left: 50%;
              box-shadow: 0 0 20px 0 #ccc;
              border: 1px solid #C5D0DB;
              transform: translate(-50%, -50%);
          }

          .kb-article-info {
            background-color: #F6F7F9;
            position: relative;
            padding: 15px;
          }
          .kb-article-info table {
            border-collapse: collapse;
            font-size: 12px;
            width: auto;
          }
          .kb-article-info table tr td {
            border-right: 1px solid #e4e4e4;
            padding: 0 15px;
          }
          .kb-article-info table tr td:last-child {
            border-right: none;
          }
          .kb-article-info table tr td:first-child {
            padding-left: 0;
          }
          .kb-article-info table span {
            display: block;
            color: #7C8FA4;
            white-space: nowrap;
          }

          .kb-actions {
            position: absolute;
            right: 15px;
            top: 13px;
            border: 1px solid #d9dbdd;
            text-align: right;
            transition: all .3s;
            border-radius: 3px;
            background: #fff;
            z-index: 1;
          }
          .kb-actions span {
            display: block;
            position: relative;
            margin: 5px 19px 5px 15px;
            padding-right: 15px;
            height: 22px;
            line-height: 22px;
            font-size: 13px;
            color: #333;
            cursor: pointer;
          }
          .kb-actions span:after {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            height: 16px;
            right: -10px;
            overflow: hidden;
            top: 3px;
            -webkit-transition: all .3s;
            -o-transition: all .3s;
            transition: all .3s;
            background-repeat: no-repeat;
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQBAMAAADt3eJSAAAAHlBMVEX///8KCgrPz8/FxcWdnZ3Nzc2GhoZycnJLS0tAQEBzgzS0AAAAK0lEQVQI12MgE7ALMTAYJgAZnIIKzIINICFHUUMhsByLoKACRJWjEKnmAgC9RwKrF5HrdgAAAABJRU5ErkJggg==');
            background-position: center center;
          }
          .kb-actions-list {
            display: none;
            text-align: left;
            margin-top: 10px;
            margin-bottom: 10px;
          }
          .kb-actions-list li {
            display: block;
            margin: 0;
            white-space: nowrap;
          }
          .kb-actions-list a {
            position: relative;
            display: block;
            padding: 8px 5px 8px 35px;
            width: 100%;
            color: #2a5885;
            min-width: 200px;
            z-index: 1;
            font-size: 14px;
          }
          .kb-actions-list a:hover {
            background: #ebebeb;
          }
          .kb-actions-list a:before {
            content: '';
            display: block;
            left: 10px;
            position: absolute;
            width: 16px;
            height: 16px;
            background-position: center center;
            background-repeat: no-repeat;
          }
          .kb-action-add:before {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAVFBMVEUAAAB/f7V7j6R9jqV7j6R8j6N7j6R7jqN7jqJ7j6R7jqN8jqR8j6N8jqN8jqR8jqR8j6R8jqR8jqN/jaF/jKV/lKp8j6R7jaJ6jqR7jqR/j598j6T3qQ82AAAAG3RSTlMABOmeqJaBeHP38uHXz8W/iF9VGRQM23xorxBsB1OeAAAAiElEQVQY002PWRaDMAwDnQTCvi+lnfvfszYp0Pmy9GT5WRIH5HLhplUCDOIOd+o3TemhLjsyc0r+KNTY2kf7RX4RH2NDKn4Fr3rVZKc9oRCMKMqEIXeXzMkY+woap+cHqNrMWoBunlVjUlzPzf5JXQ+jJTJ8Xut+vtMu505c7LletnGViwJCmr56Dw4w086x6QAAAABJRU5ErkJggg==');
          }
          .kb-action-delete:before {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAQCAMAAAD+iNU2AAAAYFBMVEUAAAB8jqR7j6R7j6N4jaN/f597jqR7jqR8j6N8jqR8j6R/f798jqR8j6R8j6V7jaN/jaJ7jqN8j6R9j6R7kKR6j6N6jaJ7j6R8jqN6j6R/kaR7j6R9jqV8j6J5kKJ8j6Qv+ZNLAAAAH3RSTlMAv6uyJQju4tjEkwTTt4tGGPPNm4JwbGJWMA7nn1AsEvQrDQAAAI5JREFUCNdNjekSgyAQg1cUARGp99Ej7/+WDVg75sfOfjvZRE7FdpO7Aor/7t+7FORq0wm1Qp25hTvIHVBmbgAl8gHskVk7IKZrJZnlUdM5oOWTQuAsmWTw4lY1O+cEiKPn0gjD+FpfbFkQge6HC7CmKEzJ4ecezrPlCZhxaSzQs5mHgFMDMWtVFqacPdcvZJMJ4ry49kQAAAAASUVORK5CYII=');
          }
          .kb-action-edit:before {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAATlBMVEUAAAB7j6R/f7F8jqR8jqR8jqR8j6V9jqV7jqN7j6R8jqR7jqR8j6N7jqV/ip97jqR7j6R6j6N/j598j6R7kKF/lKp8kKV6jqR5kKJ8j6QbGAgxAAAAGXRSTlMA+gXew7+Nn3nr0q+XIhjjqzEQyTwMg2gsalCx5AAAAIZJREFUGNNFTUcOAjEQc/q2tC1A/v9RYgsJHxK3kUGUJTjnY8YPixmCiVa6UawbX2+Zk8z2GSc5gGKmfkDQ6Srs9kl7QVYl8Ha7humwkzm4IWwf4E2CKm0K7MvI8DIurhEVUf8awirSkFUMQJJxa/1v7ACs50lKjlsn6BzMlFMT/ZhxbTf5Fy40DjsetsWjAAAAAElFTkSuQmCC');
          }
          .kb-actions:hover  {
            box-shadow: #cad3dc 0px 5px 25px 0px;
          }

          .kb-actions:hover .kb-actions-list{
            display: block;
          }
          .kb-actions:hover span {
            color: #000;
          }
          .kb-actions:hover span:after {
            transform: rotate(180deg);
          }
          .kb-article-body {
            display: -webkit-flex;
            display: -ms-flex;
            display: flex;
            padding: 15px;
          }
          .kb-article-contents {
            width: 30%;
            padding-right: 15px;
          }
          .kb-article-contents h2 {
            font-size: 18px;
            margin-bottom: 15px;
          }
          .kb-article-contents ol {
            counter-reset: item;
          }
          .kb-article-contents ol ol {
            padding: 12px 0 0 12px;
          }
          .kb-article-contents li {
            display: block;
            margin-bottom: 10px;
            font-size: 12px;
          }
          .kb-article-contents li:before {
            content: counters(item, ".") " ";
            counter-increment: item;
          }

          .kb-article-contents li:last-child {
            margin-bottom: 0;
          }
          .kb-article-contents a {
            color: #333;
            line-height: 1.2em;
          }
          .kb-article-contents a:hover {
            color: #0144dd;
          }
          .kb-fixed {
            position: fixed;
            top: 76px;
          }
          .kb-article-text {
            width: 70%;
            font-size: 14px;
            line-height: 1.3em;
            position: relative;
          }
          .kb-article-text h1 {
            font-weight: bold;
            font-size: 18px;
            margin-top: 20px;
            margin-bottom: 15px;
          }
          .kb-article-text h2 {
            font-weight: bold;
            font-size: 16px;
            margin-top: 5px;
            margin-bottom: 10px;
          }
          .kb-article-text h3 {
            font-weight: bold;
            margin-bottom: 5px;
          }
          .kb-article-text ol {
            list-style: decimal;
            padding-left: 15px;
            margin-bottom: 10px;
          }
          .kb-article-text li {
            margin-bottom: 10px;
          }
          .kb-article-text ul {
            list-style: disc;
            padding-left: 15px;
            margin-bottom: 10px;
          }
          .kb-article-text strong {
            font-weight: bold;
          }
          .kb-article-text i,
          .kb-article-text em {
            font-style: italic;
          }
          .kb-article-text h1 + .kb-article-body h2 {
            margin-top: 0px;
          }
          .kb-article-text h1:first-child {
            margin-top: 0;
          }
          .kb-article-text p {
            margin: 10px 0;
          }

        </style>
        <style>
          .kb-search-wrapper-small {
              padding: 25px;
              border: 1px solid #E4E4E4;
              background: #FAFBFC;
              margin-bottom: 15px;
          }
          .kb-search-wrapper-small input, 
          .kb-search-wrapper-small .searchInputImmitation,
          .kb-search-wrapper input {
              cursor: text;
              border: 1px solid #D9DBDD;
              padding: 0 10px 0 40px;
              height: 30px;
              line-height: 28px;
              width: 100%;
              background: #fff url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAPFBMVEX///+5u73Ky8y7vb/19fbz8/TO0NG+wML6+vrFx8jw8fH8/Pzu7u/m5ufk5eXCxMbd39/h4uLg4eLc3d4M1UP2AAAAeklEQVQY02WPWRLDIAxDkWwg7CS5/11LCm06jX88fl4kG2O2QhGWzaywDr41D2dnvTnwyHknOGcKGK8cif4G9MccrRLSlaXlCVS8PsBc2e+V36OWOL+yVbUSGI3VkhEAgi5rPXgfzhhAu9wn1TRk+LF/fyUPAmf+SH8BAcEDYEv/NMsAAAAASUVORK5CYII=') 13px center no-repeat;
          }
          .kb-search-wrapper {
              border: 1px solid #C5D0DB;
              background: #fff;
              position: absolute;
              left: 35px;
              width: 80%; 
              box-shadow: 0 5px 20px 0 #ccc;
              min-height: 200px;
              margin-left: -200px;
              opacity: 0;
              visibility: hidden;
              transition: opacity 0.3s, margin-left 0.5s, visibility 0s linear 0.5s;
          }
          .kb-search-wrapper.showed {
              opacity: 1;
              margin-left: 0;
              visibility: visible;
              transition-delay: 0s;
          }
          .kb-search-wrapper .kb-search {
              padding: 25px 25px 45px 25px;
          }
          .kb-search-wrapper .okButton {
              padding: 15px 25px;
              text-align: center;
              cursor: pointer;
              background: #FAFBFC;
              position: absolute;
              bottom: 0;
              left: 0;
              right: 0;
          }
          .kb-search-wrapper .okButton:hover {
              background: #0072FF;
              color: #fff;
          }
          .kb-search-wrapper .okButton.disabled {
              cursor: default;
              background: #ccc;
              color: #999;
          }
          
          /*@media (max-width: 1400px) {
            .kb-three &gt; ul &gt; li &gt; span,
            .kb-three-wrapper h2 {
              padding-left: 20px;
            }
            .kb-three-container &gt; span &gt; a:before {
              left: -16px;
            }
          }*/
        </style>
      </head>
      <body>
        <div class="kb-main">
          <div class="kb-three-wrapper">
            <div class="kb-search-wrapper-small" id="kb-search-small">
                <!--div class="searchInputImmitation">Поиск</div-->
                <input type="text" placeholder="Поиск"/>
            </div>
            <div class="kb-three">
              <h2>Статьи и проблемы</h2>
              <xsl:apply-templates select="//KB_STRUCTURE/XMLDOC"/>
            </div>
          </div>
          <div class="kb-content" id="articleContent">
          </div>
        </div>
        
        <div class="kb-search-wrapper" id="kb-search">
            <div class="kb-search" id="kb-search-container">
                <!--input type="text" placeholder="Поиск"/>
                <div class="kb-labels"></div>
                <div class="kb-label-list"></div-->
                <script type="text/javascript">
                    $.ajax('getCardHtml.action?cardId=CARD$KNOWLEDGE_BASE$SEARCH', {
                        async: false,
                        success: function(data) {
                            $('#kb-search-container').empty().append(data);
                        }
                    });
                </script>
            </div>
            <div class="okButton" onclick="if (!!window.baseSearch) baseSearch.start(this);">Применить</div>
        </div>
        {B{SCRIPT$RICOS_DROP}E}
        <script src="//cdnjs.cloudflare.com/ajax/libs/showdown/1.5.0/showdown.min.js"></script>
        <script>

          $(function(){
            window.searchLogic.search = false // for refresh on edit

            setTimeout(function(){
              var $link = $('*[data-id="<xsl:value-of select="//DOC_KEY//DOC_KEY"/>"]');
                $link.parents('.kb-three-container').children('a').click();
                $link.click();
            });
          });

<![CDATA[
          $('.kb-three-container > a').on('click', function(){
            var $this = $(this),
                $parent = $this.closest('.kb-three-container'),
                $children = $parent.find('.kb-three-inner').first(),
                $siblings = $parent.siblings('.kb-three-container'),
                $siblingsChilds = $siblings.find('.kb-three-inner');

            if ($this.hasClass('kb-havearticle-0')) return false;

              $parent.toggleClass('kb-three-open')
                .siblings().removeClass('kb-three-open')
                .find('.kb-three-container').removeClass('kb-three-open');

              ($parent.hasClass('kb-three-open')) ? $children.show() : $children.hide();

              $siblingsChilds.hide();

            return false;
          });

          $('.kb-three-inner li:not(.kb-three-container) > a').on('click', function(){
            var $this = $(this)

            if ($this.hasClass('kb-three-active')) return false;

            $('.kb-three-inner a').removeClass('kb-three-active');
            $this.addClass('kb-three-active');
            if (tabInfo) {
              tabInfo.showLoading();
            }

            $.get('/ugd/getCardHtml.action', {
              cardId: 'CARD$KNOWELGE_BASE$ARTICLE',
              documentId: $this.data('id')
            }).done(function(data) {
                $('#articleContent').html(data);
                if (tabInfo) {
                  tabInfo.hideLoading();
                }
            });
            return false;
          });
          
          $('#kb-search-small input').focus(showBaseSearch);
          $('body').on('click', '.kb-article-tag a', function() {
              var $link = $(this),
                  id = $link.attr('href').replace('#', '');
              
              if (!!window.baseSearch && baseSearch.addTagById) baseSearch.addTagById(id);
              showBaseSearch();
              return false;
          });
          
          

 ]]>         
          function getLocation(href) {
              var link = document.createElement("a");
              link.href = href;
              return link;
          };

          <xsl:text disable-output-escaping="yes">
          <![CDATA[
          function showBaseSearch() {
              var offset = $('#kb-search-small').offset();
              $('#kb-search').css({top: offset.top}).addClass('showed').find('input:first').focus();
              $(document).click(function(e) {
                  var $eTarget = $(e.target);
                  console.log($eTarget);
                  if (!$eTarget.closest('#kb-search').length && !$eTarget.closest('#kb-search-small').length) {
                      $('#kb-search').removeClass('showed');
                  }
              });
          }
          
          function urlToObject(url) {

              var request = {};
              var pairs = url.substring(url.indexOf('?') + 1).split('&');
              for (var i = 0; i < pairs.length; i++) {
                  if(!pairs[i])
                      continue;
                  var pair = pairs[i].split('=');
                  request[decodeURIComponent(pair[0])] = decodeURIComponent(pair[1]);
               }
               return request;
          }

          function objectToURL(obj) {
            var pairs = [];
            for (var key in obj)
              if (obj.hasOwnProperty(key)) pairs.push(key + '=' + obj[key]);
            return pairs.join('&');
          }
          
          var searchLabel = f.getUrlParams()['TAG_ID'] || null;
          if (searchLabel) {
              if (!!window.baseSearch && baseSearch.addTagById) baseSearch.addTagById(searchLabel);
              setTimeout(function() {
                  showBaseSearch();
                  if (!!window.baseSearch && baseSearch.start) baseSearch.start();
              }, 0);
          }
        ]]>
        </xsl:text>
        </script>
      </body>
      </html>
    </xsl:template>

    <xsl:template match="MENU">
        <ul class="kb-three-root">
            <xsl:apply-templates select="SECTION"/>
        </ul>
    </xsl:template>

    <xsl:template match="SECTION">
        <li>
          <xsl:if test="SETCION or IS_ARTICLE = 0">
            <xsl:attribute name="class">kb-three-container</xsl:attribute>
          </xsl:if>

              <a href="#" data-id="{ID}" class="kb-havearticle-{HAVEARTICLE}">
                <span>
                  <xsl:value-of select="NAME"/>
                </span>
              </a>
            <xsl:if test="SECTION">
                <ul class="kb-three-inner">
                    <xsl:apply-templates select="SECTION"/>
                </ul>
            </xsl:if>
        </li>
    </xsl:template>

</xsl:stylesheet>