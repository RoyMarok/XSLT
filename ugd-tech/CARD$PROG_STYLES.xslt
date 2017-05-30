<link rel="stylesheet" href="/portal_static/css/reset.css"/>
<link rel="stylesheet" href="/portal_static/css/fonts/PTSans.css"/>
<style>

   body {
    margin: 0;
    font-family: 'PTSans', Arial, sans-serif;
    background-color: #EEF2F4 !important; /* так как  CARD$ASSOC_PROCESS перебивает фон */
  }
  #tabViewContent {
    overflow: hidden;
  }
  .tableCardStyle th {
    vertical-align: middle;
  }
  .pd-header {
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #ccc;
    background-color: #fff;
    padding-top: 20px;
    position: relative;
  }
  .pd-header:before {
    content: '';
    display: block;
    position: absolute;
    background-color: #fff;
    top: -1px;
    bottom: -1px;
    z-index: -1;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    left: -100%;
    right: -100%;
  }
  .pd-header__inner {
    padding: 0 0 50px;
    position: relative;
  }
  .pd-header-title {
    font-size: 16px;
    display: block;
    color: #7d8fa4;
    padding-left: 23px;
    margin-bottom: 15px;
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAPAQMAAADu2mw3AAAABlBMVEUAAAB9j6SU7qG5AAAAAXRSTlMAQObYZgAAABNJREFUCNdjqP8BRQkSQISVAUcAXeYQAKKNC+UAAAAASUVORK5CYII=');
    background-position: left center;
    background-repeat: no-repeat;
  }
  .pd-header h1 {
    color: #1e1e1e;
    font-size: 22px;
    margin-bottom: 15px;
  }
  .pd-header h2 {
    color: #7d8fa4;
    font-size: 16px;
  }
  .pd-header-status {
    position: absolute;
    right: 0;
    top: 0;
    font-size: 11px;
    color: #fff;
    border-radius: 3px;
    padding: 4px 10px;
  }
  .pd-tabs {
    margin-top: -34px;
    position: relative;
  }
  .pd-tabs ul {
    padding: 0;
  }
  .pd-tabs li {
    display: inline-block;
  }
  .pd-tabs a {
    color: #7d8fa4;
    padding: 8px 20px;
    background-color: #fff;
    display: block;
    border-bottom: 1px solid #ccc;
    line-height: 16px;
  }
  .pd-tabs a:hover {
    color: #235dc1;
    border-bottom: 0;
  }
  .pd-tabs a[data-clickable="0"] {
    cursor: default;
    opacity: .5;
  }
  .pd-tabs a[data-clickable="0"]:hover {
    color: inherit;
  }
  .pd-tabs li.pd-tab-active a {
    background-color: #EEF2F4;
    border: 1px solid #ccc;
    border-bottom-color: #EEF2F4;
    border-top-right-radius: 3px;
    border-top-left-radius: 3px;
  }
  .pd-body {
    padding-top: 20px;
  }
  .pd-heading {
    font-size: 20px;
    color: #000;
    margin: 15px 0 5px;
    position: relative;
    padding-left: 20px;
    cursor: pointer;
    line-height: 1.2em;
  }
  .pd-heading[data-count="0"] {
    opacity: .4;
    cursor: default;
  }
  .pd-heading:before {
    content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAcAAAANCAMAAABSF4SHAAAAPFBMVEUAAACGiZCGiZCFiZCFiI+Hi5J/f5SGiY+GiI+FiI+GiJCFiJCGiJCFiJCGiY+HiJGGiZGGiI6FhZKGiZA1lUxjAAAAE3RSTlMA2auMVRYMw3BA7+fLt6OXh3QoqnjULgAAADpJREFUCNdVjMcRACAIBM2KWa//Xh3ho3zYuaSWVXwNAiEiMXgN98MuIAZCfoxQkaQ4r2pkqMNwdsg7XAkBv4X4f4MAAAAASUVORK5CYII=');
    display: block;
    transform: rotate(90deg);
    position: absolute;
    left: 0;
    top: 50%;
    margin-top: -11px;
  }
  .pd-heading[data-count="0"]:before,
  .pd-heading.pd-heading-collapsed:before {
      transform: rotate(0deg);
  }
  .pd-items {
    display: -webkit-flex;
    display: -ms-flex;
    display: flex;
    -webkit-flex-wrap: wrap;
    flex-wrap: wrap;
    font-size: 14px;
  }
  .pd-section {
    width: 100%;
  }
  .pd-item {
    width: calc(33.333333% - 20px);
    margin: 10px;
    border: 1px solid #e7e8ec;
    background: #fff;
  }
  .pd-item:hover {
      box-shadow: 0px 10px 15px rgba(0, 51, 102, 0.3);
  }
  .pd-item-head {
    border-bottom: 1px solid #e7e8ec;
    padding: 15px 15px 10px 50px;
    position: relative;
    line-height: 1.2em;
    background-color: #F4F9FD;
  }
  .pd-item-num {
    text-align: center;
    width: 32px;
    height: 32px;
    border-radius: 50%;
    background-color: #888;
    color: #fff;
    font-weight: bold;
    font-size: 13px;
    line-height: 28px;
    display: block;
    position: absolute;
    top: 50%;
    margin-top: -16px;
    border: 2px solid #ebebeb;
    left: 10px;
  }
  .pd-item-name {
    display: block;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .pd-item-name a {
    color: #0144dd;
  }
  .pd-item-body {
    padding: 10px 15px 15px;
    position: relative;
  }
  .pd-actual-end {
    position: absolute;
    top: 10px;
    right: 15px;
    height: 17px;
    line-height: 17px;
    padding-left: 20px;
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAIAAAC0D9CtAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAF9SURBVDhPnVO7isJQEL1rVkihEK0MNtqkF0H8AMFCe3/ApLNLawr/wA9IqaRIGrHQTrARv0BERLAQ06SIr0biSeauZEFY3VOEmXPOzM3cTL6CIGA/OJ1O0+l0uVz6vk9MOp2uVCr1ej2VShETAjWEyWSiaZpt28fjEallWXgiBgMeauQKwWtM0zQMA+0pBdrtNo+CADxUeCgNa9Cj2+3e73eiCOfzmUcRoMJDpzH0UFU1fsJL7Ha7p1Mol8vFYrFUKvH5GNtsNtlslieMHQ6HwWAATy6Xu16v2+1WKBQKrVYL98MtjM1mM9d1wd9ut+FwOBqNcAf5fB4SejmO8+15nizL5CY0m81Op7NarRaLhaIovV5PFEWS4IQ/fLfL5dLv92u1WjKZhCAIAgS0r1aruq4Tud/vESNYr9cMY/ExY0DNeDx+eTHwJzKZDKYMD45BkqRGo/Hr20eAE/4EVmM+n3PuL8AJ/7vfB3g6/7UHRH28bwT0eHOvP/9/GHsANmUAUc2pJVQAAAAASUVORK5CYII=');
    background-repeat: no-repeat;
    background-position: left center;
  }
  .pd-item-peoples {
    color: #333;
    margin-bottom: 15px;
    min-height: 69px;
  }
  .pd-item-peoples li {
    margin-bottom: 10px;
    position: relative;
    padding-left: 32px;
    line-height: 16px;
  }
  .pd-item-peoples li:first-child {
    padding-right: 95px;
  }
  .pd-item-peoples li:last-child {
    margin-bottom: 0;
  }
  .pd-item-peoples li:before {
    position: absolute;
    display: block;
    left: 4px;
  }
  .pd-item-peoples li:before {
    content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAb1BMVEVcaXr///9ueYlgbX1fbHz9/f1jb4CiqbOdprDV2d2XoKuCjJlpdYX8/Pzs7e/m5+re4uXY29/P0tfKz9W+w8qqsbqIkp5lcYLb3uHP0tjFytG3vcW0u8KutLyTnKePmaWFj5x+iJZ8hpN1gI90f44+B0niAAAAhElEQVQY013ORxbDIAxF0S8EGDBucUvv+19jAkQZ+E2kcwc6An0znbOLbyiV4agArLMRaB/IDQJDLDALHFByArsfVH/QG2hrpFYvYPYZJlMgVVnoO1GB3r2Y6HqhqG5jQ+gVgEDqRAzos0E+aOkdKC3KY5ND+UEGFoxVrSwza7bxGabuA0XTBJDUmw5rAAAAAElFTkSuQmCC');
  }
  .pd-item-peoples li.pd-item-chief {
    margin-left: 30px;
    padding-left: 15px;
  }
  .pd-item-peoples li.pd-item-chief:before {
    content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAcAAAAGAQMAAAA1wBY1AAAABlBMVEX///8AAABVwtN+AAAAEElEQVQI12NoAMMWhn8MLAATHgMHoiZTCgAAAABJRU5ErkJggg==');
    top: 50%;
    margin-top: -10px;
    opacity: .6;
  }
  .pd-item-indicator-peoples {
    display: -webkit-flex;
    display: -ms-flex;
    display: flex;
    color: #333;
    border-bottom: 1px solid #ccc;
    padding:  10px 15px 10px;
  }
  .pd-item-indicator-peoples strong {
    display: block;
    margin-bottom: 5px;
    position: relative;
    padding-left: 32px;
    line-height: 16px;
  }
  .pd-item-indicator-peoples span {
    margin-left: 30px;
    padding-left: 20px;
    position: relative;
    display: block;
    font-style: italic;
  }
  .pd-item-indicator-peoples strong:before,
  .pd-item-indicator-peoples span:before {
    position: absolute;
    display: block;
    left: 4px;
  }
  .pd-item-indicator-peoples strong:before {
    content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAb1BMVEVcaXr///9ueYlgbX1fbHz9/f1jb4CiqbOdprDV2d2XoKuCjJlpdYX8/Pzs7e/m5+re4uXY29/P0tfKz9W+w8qqsbqIkp5lcYLb3uHP0tjFytG3vcW0u8KutLyTnKePmaWFj5x+iJZ8hpN1gI90f44+B0niAAAAhElEQVQY013ORxbDIAxF0S8EGDBucUvv+19jAkQZ+E2kcwc6An0znbOLbyiV4agArLMRaB/IDQJDLDALHFByArsfVH/QG2hrpFYvYPYZJlMgVVnoO1GB3r2Y6HqhqG5jQ+gVgEDqRAzos0E+aOkdKC3KY5ND+UEGFoxVrSwza7bxGabuA0XTBJDUmw5rAAAAAElFTkSuQmCC');
  }
  .pd-item-indicator-peoples span:before {
    content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAcAAAAGAQMAAAA1wBY1AAAABlBMVEX///8AAABVwtN+AAAAEElEQVQI12NoAMMWhn8MLAATHgMHoiZTCgAAAABJRU5ErkJggg==');
    top: 4px;
    opacity: .6;
  }
  .pd-item-documents-table {
    width: 100%;
  }
  .pd-item-documents-table th {
    color: #7d8fa4;
    font-size: 10px;
    text-align: center;
    font-weight: bold;
    vertical-align: middle;
    padding: 5px;
  }
  .pd-item-documents-table tbody th {
    font-weight: normal;
    text-align: left;
    width: 60%;
    font-size: 12px;
    line-height: 1.2em;
  }
  .pd-item-documents-table tbody th a {
      color: #7d8fa4;
  }
  .pd-item-documents-table td {
    text-align: center;
    width: 20%;
    font-size: 20px;
    font-weight: bold;
    color: #333;
    vertical-align: middle;
    padding: 5px;
    position: relative;
  }
  .pd-item-documents-table tr td span {
    display: block;
    text-align: center;
    position: relative;
  }
  .pd-item-documents-table tr td span:after {
    content: '';
    display: block;
    position: absolute;
    width: 1px;
    height: 20px;
    top: 50%;
    margin-top: -10px;
    right: -6px;
    background-color: #ccc;
  }

  .pd-item-period {
    color: #7c8fa4;
    margin-bottom: 5px;
  }
  .pd-item-comments {
    font-size: 11px;
    margin-bottom: -5px;
  }
  .pd-item-comments li {
    display: inline-block;
    margin: 0 5px 5px 0;
  }
  .pd-item-comments li:last-child {
    margin-right: 0;
  }
  .pd-item-comments a {
    padding: 5px 10px;
    display: block;
    color: #0070c0;
    background-color: #E5F1FF;
    border-radius: 4px;
  }
  .pd-item-comments a:hover {
    color: #fff;
    background-color: #0070c0;
  }

  .pd-modal-place {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 10;
    background-color: rgba(0,0,0,0.1);
    display: none;
    overflow: hidden;
    display: none;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    z-index: 1000000;
  }
  .pd-modal {
    position: absolute;
    width: 720px;
    margin: 0 auto;
    color: #fff;
    cursor: pointer;
  }
  .pd-modal-head {
    border-bottom: 1px solid #ccc;
    position: relative;
    background-color: #4169E1;
    display: -webkit-flex;
    display: -ms-flex;
    display: flex;
    align-content: center;
  }
  .pd-modal-num {
    position: absolute;
    left: 10px;
    top: 50%;
    margin-top: -17px;
    width: 35px;
    height: 35px;
    border-radius: 50%;
    border: 3px solid rgba(0, 0, 0, .3);
    text-align: center;
    font-weight: bold;
    line-height: 28px;
  }
  .pd-modal-name {
    width: auto;
    padding-left: 60px;
    padding-right: 100px;
    padding: 15px 115px 15px 60px;
    line-height: 1.3em;
    font-size: 16px;
  }
  .pd-modal-date {
    position: absolute;
    right: 10px;
    top: 50%;
    margin-top: -1em;
  }
  .pd-modal-date span {
    display: block;
    font-size: 12px;
    margin-bottom: 5px;
  }
  .pd-modal-date strong {
    display: block;
    text-align: right;
    font-weight: bold;
    padding-left: 15px;
  }
  .pd-modal-body {
    background-color: #2D499E;
    padding: 20px 15px;
  }
  .pd-modal-cols {
    display: -webkit-flex;
    display: -ms-flex;
    display: flex;
  }
  .pd-modal-col {}
  .pd-modal-col:first-child {
    padding-right: 20px;
    width: 56%;
  }
  .pd-modal-col:last-child {
    width: 44%;
  }
  .pd-modal-table { }

  .pd-modal-table th {
    background-color: rgba(255, 255, 255, .3);
    padding: 5px 10px;
    border: 1px solid  #ccc;
    font-weight: bold;
    font-size: 13px;
    width: 33%;
    text-align: left;
  }
  .pd-modal-table td {
    font-size: 14px;
    text-align: center;
    padding: 5px 10px;
    border: 1px solid  #ccc;
  }
  .pd-modal-table tr td:first-child {
    text-align: left;
  }
  .pd-modal-people {
    margin-bottom: 15px;
  }
  .pd-modal-info span,
  .pd-modal-people span {
    display: block;
    font-size: 12px;
  }
  .pd-modal-info strong,
  .pd-modal-people strong {
    display: block;
    font-weight: bold;
    font-size: 16px;
    padding-left: 10px;
  }
  .pd-modal-info {
    display: -webkit-flex;
    display: -ms-flex;
    display: flex;
    padding-top: 20px;
    margin-top: 25px;
    border-top: 1px solid rgba(255, 255, 255, .3);
  }
  .pd-modal-info div {
    width: 50%;
  }
  .pd-modal-table {
    color: #fff;
  }
  .pd-modal-report {
    margin-top: 15px;
  }

  .pd-hidden {
    display: none;
  }
  .pd-item-defaultColor {}
  .pd-item-blue .pd-item-num {
      background-color: #476BB3;
      border-color: #6699FF;
  }
  .pd-item-green .pd-item-num  {
    background-color: #196332;
    border-color: #248D48;
  }
  .pd-item-red .pd-item-num {
    background-color: #A61C28;
    border-color: #ED2939;
  }


</style>