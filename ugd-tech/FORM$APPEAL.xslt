<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="no"/>
<xsl:template match="/">
    <xsl:variable name="DATA" select="//CC_APPEAL//APPEAL"/>

    <link rel="stylesheet" href="/static/TokenInput/latest/token-input.css"/>
    <link rel="stylesheet" href="/static/typeForm/css/form.css"/>
    <link rel="stylesheet" href="/static/multiselect/multiselect.css"/>

    <link rel="stylesheet" href="/portal_static/css/ps/theme/ui.datepicker.css"/>
    <link rel="stylesheet" href="/autoform/css/spbren/custom-theme/jquery-ui.custom.css"/>
    <link rel="stylesheet" href="/portal_static/css/form-customize.css"/>

    <script src="/static/JQuery/1.8.3/jquery.min.js"></script>

    <style>
        body {
            margin: 0;
            font-family: 'PTSans', Arial, sans-serif;
            background-color: #fff;
        }
.sticky {
  position: fixed;
  z-index: 101;
}
.stop {
  position: relative;
  z-index: 101;
}
        .fa-wrapper {
            width: 100%;
            min-width: 1285px;
            display: -webkit-flex;
            display: -ms-flex;
            display: flex;
            font-size: 16px;
        }

        /* side panel
        width: 410px;
            margin: 20px 0 0 100px;
            box-shadow: -1px 1px 5px 0px rgba(0,0,0,0.15);
        */

        .control-group ul.token-input-list {
            width: 525px;
            border: 1px solid #bcbcbc;
        }

        .fa-container {
            width: 1285px;
            border: 1px solid #cccccc;
            margin: 10px auto;
            position: relative;
        }


        .fa-container .formWrapper {
            min-height: inherit;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }
        .fa-header {
            width: 880px;
            background-color: #f2f6fa;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            margin: 1px;
            padding: 20px 25px;
        }
        .fa-header h2 {
            font-weight: normal;
            margin-top: 0;
            padding: 0;
        }
        .fa-header p {
          margin: 0;
          padding: 0;
        }

        .gray {
            color: #bbb;
        }


        .fa-body {
            width: 880px;
        }
        .fa-body h2 {
            font-weight: normal;
            margin-top: 52px;
            margin-bottom: 30px;
            padding: 0;
            text-align: center;
        }

        .fa-popup-form {
            padding: 10px;
            min-width: 200px;
            min-height: 200px;
            max-width: 600px;
        }
        .fa-link-blank {
            position: absolute;
            display: none;
            width: 30px;
            height: 30px;
            background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAAQCAYAAAD0xERiAAAAvklEQVR42mNgIBVU/+1mqPr/HxP/uw9RUPFfBbsCNAw27L8NQ+W/z9jlq/9bEGUQzDB8BsIZDf8FiPZq5X8Nhup/z3EbRo5BINchu5Akw9ANAnkX2ctEGwbWiGYQslzF3/nEGYZsO7pBKICQYRX/XYgziJBhlf8DgAb8xjCo6r8Bdj34DKv+nwGWA4VV9X8TwnoIebPqfwI4FonSQ2o6o59h1X/bic6byLj6bz+mYQ3/OXAXKzgNmgzUx4NuFAANUGGBLCL6owAAAABJRU5ErkJggg==') center center no-repeat;
        }
        .fa-link-blank[href] {
            display: inline-block;
        }
        .fa-link-blank:hover {
            opacity: 0.7;
        }

        .fa-question {
            background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAATlBMVEUAAAB7j6R/f7F8jqR8jqR8jqR8j6V9jqV7jqN7j6R8jqR7jqR8j6N7jqV/ip97jqR7j6R6j6N/j598j6R7kKF/lKp8kKV6jqR5kKJ8j6QbGAgxAAAAGXRSTlMA+gXew7+Nn3nr0q+XIhjjqzEQyTwMg2gsalCx5AAAAIZJREFUGNNFTUcOAjEQc/q2tC1A/v9RYgsJHxK3kUGUJTjnY8YPixmCiVa6UawbX2+Zk8z2GSc5gGKmfkDQ6Srs9kl7QVYl8Ha7humwkzm4IWwf4E2CKm0K7MvI8DIurhEVUf8awirSkFUMQJJxa/1v7ACs50lKjlsn6BzMlFMT/ZhxbTf5Fy40DjsetsWjAAAAAElFTkSuQmCC') center center no-repeat;
            width: 16px;
            height: 16px;
            display: inline-block;
            margin: 0 0 0 5px;
            position: relative;
            vertical-align: middle;
        }
        .buttonOverlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            cursor: pointer;
        }
        body .fa-tooltip-body {
            padding: 5px 10px;
            background: #333;
            color: #fff;
            box-shadow: none;
        }
        body .fa-tooltip-body .arrow {
            border-color: transparent;
        }
        body .fa-tooltip-body .arrow:after {
            border-color: #333 transparent;
        }

        .fa-button-bar {
            display: table;
            margin: 10px 0 30px 0;
            width: 805px;
        }
        .fa-button-bar-left {
            display: table-cell;
            text-align: left;
            padding-left: 260px;
        }
        .fa-button-bar-right {
            display: table-cell;
            text-align: right;
            padding-left: 10px;
        }

        .control-group {
            margin-bottom: 15px;
        }
        .control-group label {
          width: 260px;
          display: inline-block;
          text-align: right;
          padding-right: 15px;
        }
        .control-group .input-default {
          width: 525px;
          height: 32px;
          border-radius: 2px;
          border: 1px solid #bcbcbc;
          padding: 0px 10px;
        }
        .control-group .input-default:focus {
          border-color: #41A3E0;
          outline: none;
        }
        .control-group .input-phone {
          width: 180px;
        }
        .control-group .input-email {
          width: 245px;
        }
        .control-group .input-inn,
        .control-group .input-ogrn {
          width: 200px;
        }
        .left-caption {
          display: inline-block;
        }




        .control-group .input-year {
          width: 105px;
        }
        .token-input-group label {
          vertical-align: middle;
        }
        .multicontrol-group {
          display: flex;
          flex-direction: row;
          padding-left: 160px;
        }
        .multicontrol-group .control-group label {
            width: 100px;
        }
        .multicontrol-big .control-group label {
            width: 120px;
        }
        .multicontrol-big {
            padding-left: 140px;
        }
        /*.multicontrol-group .email-group {
          margin-left: 45px;
        }*/
        .multicontrol-group .ogrn-group {
          margin-left: 25px;
        }
        .appeal-number {
          color: #009900;
          font-size: 14px;
          padding: 0px 10px;
        }

        .the-line {
          height: 1px;
          background-color: #e8edf0;
          width: 650px;
          margin-left: 135px;
          margin-bottom: 25px;
        }

        .button-group {
          text-align: center;
          margin-bottom: 30px;
        }
        .button-group button,
        .button-group .button {
          border: 1px solid #44a3df;
          font-size: 14px;
          background-color: #fff;
          cursor: pointer;
          padding: 10px 12px;
          border-right: none;
          outline: none;
          width: auto;
          text-align: center;
        }
        .button-group .btn-phys-person {
          margin-left: 100px;
        }
        .button-group button.active,
        .button-group .button.active {
          background-color: #319adc;
          color: #fff;
        }
        .button-group button:first-child,
        .button-group .button:first-child {
          border-top-left-radius: 3px;
          border-bottom-left-radius: 3px;
        }
        .button-group button:last-child,
        .button-group .button:last-child {
          border-top-right-radius: 3px;
          border-bottom-right-radius: 3px;
          border-right: 1px solid #44a3df;
        }
        .btn-appeal-group button,
        .btn-appeal-group .button {
          font-size: 12px;
          position: relative;
          padding-left: 34px;
        }
        .btn-appeal-group i {
          display: inline-block;
          width: 24px;
          height: 24px;
          position: absolute;
          top: 7px;
          left: 7px;
        }
        .btn-appeal-group i img.inactive {
            display: inline-block;
        }
        .btn-appeal-group i img.active {
            display: none;
        }
        .btn-appeal-group .active i img.inactive {
            display: none;
        }
        .btn-appeal-group .active i img.active {
            display: inline-block;
        }
        .btn-build-procedures i {
          background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MjA1QUREOENFQzNFMTFFNkIwOTVENjk4RDZGQjc3MUEiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MjA1QUREOEJFQzNFMTFFNkIwOTVENjk4RDZGQjc3MUEiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjA2NzMyYTdhLWE0OWItYzI0ZC05Y2VhLTRjZmZiZDNkNzgyMSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz5GOH6bAAAAwklEQVR42mL8//8/Ay0BEwONAc0tYMElYTT77mEgZQPlHjmXqmxLVQtAhgMNZYRa9p9iH6C5GJuPiLGkAYgbQQyg4zB8AHcxOsAljsUR/6DMRppEMtAhIPPqoZg2qQhqSQO2SD6CHs4URPJROAuUk7Fhw1l3/mNjE6MeGQ/9nDxqAX0sACZjGN1KEwtA5Q40z+SRUpqS4gOQy/OBeCJNLAC6vhpIVQ9IJDOiV/pA7z4EUnIE9D0CulqeLAuGXD4ACDAAuROEqyGAJ8wAAAAASUVORK5CYII=');
          background-repeat: no-repeat;
        }

        .btn-build-procedures.active i {
          background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RThDNTNCNkVFQzNEMTFFNkJBM0NDNzc1MkE1ODk5NjQiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RThDNTNCNkRFQzNEMTFFNkJBM0NDNzc1MkE1ODk5NjQiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjA2NzMyYTdhLWE0OWItYzI0ZC05Y2VhLTRjZmZiZDNkNzgyMSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz5OP0czAAAAiklEQVR42uxUWwrAIAyz4l13pnrZOMGPMl9bscjGAoHihDRmLQFwlvDOGFsF+CQKWStAgwzyB2rUageyY3QEZ6ydZgeFELWWGSzPwuJMSbg/rhmo33mUn3QQG28vQ36CaPEXNe98e5J/ARMBtl521T2/sHPIAduyrk0QOp3PanfXUeis3PfMQRJgAEmigygW+hIuAAAAAElFTkSuQmCC');
          background-repeat: no-repeat;
        }

        .btn-el-services i {
          background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTgxOTVEMDhFQzNEMTFFNjkyMDVGOERDODdFOThDRkYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTgxOTVEMDdFQzNEMTFFNjkyMDVGOERDODdFOThDRkYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOmE5OTQ5MTUzLWY5ZjItYmI0Yy04MjliLWYzNjFhMjM5NDBjNSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7kplR5AAAAhklEQVR42mL8//8/Ay0BEwONwagFA28BC4xhNPvuYSBlQyVzj5xLVbZFsQBkOFCQkRqmAx37n/5BhMUVZBkIDIXRZDpqAS2TKXIGoSCT4bZgyOfkI9QIIig4CmeB6mR82HDWHREgfolF/AoQcxLSz0KEa6YDsRgO300B4mR8mhmHfKsCIMAArlFnfY1uGwoAAAAASUVORK5CYII=');
          background-repeat: no-repeat;
          top: 3px;
        }
        .btn-el-services.active i {
          background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEU1QUU5OEVFQzNEMTFFNjkwNTJDQUYzNTA5MTI1RDIiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEU1QUU5OERFQzNEMTFFNjkwNTJDQUYzNTA5MTI1RDIiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOmE5OTQ5MTUzLWY5ZjItYmI0Yy04MjliLWYzNjFhMjM5NDBjNSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz74uqF1AAAAY0lEQVR42mL8//8/Ay0BEwONwagFg8uCw0D8n0r4MMxQRqRkCmIwUsnhcLNGI3nUglELGBhYsGQQmlpAzZxM/yA6QsUgOoqtsCOq8CIgRlYqWo1kIDIGgbmENDMO+VYFQIABAME4LWbnhLMIAAAAAElFTkSuQmCC');
          background-repeat: no-repeat;
          top: 3px;
        }
        .btn-ref-info i {
          background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzExQ0QxMjBFQzNDMTFFNkJCMjJDRjlCNjRGNEJCMzIiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzExQ0QxMUZFQzNDMTFFNkJCMjJDRjlCNjRGNEJCMzIiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOmE5OTQ5MTUzLWY5ZjItYmI0Yy04MjliLWYzNjFhMjM5NDBjNSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7yiWlEAAAB/ElEQVR42rSWzytEURTHZ4aUhYXZGD+ixn/gxw6llC01bGQhZKVQfqeQX5mVrBjsWJihKRsLRWyxsLEy8mP8WFmQMqXne+o7ej333oeaU5/p9e6959xz7vedO17LsjyZtGz5qYhcZcT5eXe5x+cyJwe0gi1wDT7AK7jkuxbOMWegsWawCMrAAVgFdxwrBTVgE9yAYbD72wBZYA4Mgg0wCe41mygGUyAGwmAMfLoFEOd9LE3MpYRJ0AX2mY2H2Xyb8wxCYAh0apzPgncw73gf45oh+vg2r8iUKpLDkocj0K7ZsTjPBW8gTzG+DhpBEKScKhJFBMC4oSRLdL6sGZ8ABSzvjxI1gRNwawgwyp2PacYf6KNJFaAaHGoWVoIVYNkIauaKjypVgIBGjmnnUeAHL3xOGJRVqAqQ0iwQ2Y3wY5NzymeA3/ci2iMoUcxpdQgh4RKgmL5+ZHAB6g0LpeYNzMRk4uNUFSAOatlnVJbefcLgvIg+4qoAkvYTmDEo6YXobBo820voPOQBfsVtisVSnjMessra2C762daVzS7KrrjBSfZ+5DfsPMQ2EXYKwKf5WqX3b4MIVWFSTIRz17jW9T6Qft7LprfAm0yUc2xrIyKEOpbtxtTaTTfaDtijeuR267Flk+R5dLAkqf9cmemD37RdJn82b6b/tnwJMABcen1eoqVm4wAAAABJRU5ErkJggg==');
          background-repeat: no-repeat;
        }
        .btn-ref-info.active i {
          background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyFpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpBQURCRkQxQ0VDM0MxMUU2ODUzMENCMTBBM0Q3QjYxNCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpBQURCRkQxREVDM0MxMUU2ODUzMENCMTBBM0Q3QjYxNCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkFBREJGRDFBRUMzQzExRTY4NTMwQ0IxMEEzRDdCNjE0IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkFBREJGRDFCRUMzQzExRTY4NTMwQ0IxMEEzRDdCNjE0Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+nEGE3AAAAZxJREFUeNrUls9Kw0AQxhurlYAo6kHxYMBX8BV8ANvGvoZaQUX0qGLxL558hijq3ZPgsa8QKHrpqYjSYrGN3+JXCM3ubCP04MAPQmYyszOzOxsniqLMMGUkM2QZtehzYJXMgS5oU/cO7sFj7F1SVIkM5MEz2AKeRu9Rp2wKJj+OpgdZcATGwT74tGQ5AU6Z0R7oxJW6ACfgDVynLPcmmAc7UpN9MCk4PwRNcKzRXYAp+tD2IAdegCv0pRn9yodB79JHrvcunsEauAMtoQxX7IkpwxZ9lHQZBIbdkhbl41aXwSyoGVa2DG7UemIsGWxr9JVocsfiPAAzoMHnUChlN82oUNtuFzyxT9MMYJsAiVHhGIxLfRshHCCA9hyo1D3BVtV8hZlIsgjqugAPoCh82Ft9aAng01cigEq7AFyh2Q1iEpeLDHQB2jxIZ4aPVXmqbLJJzsEl+JKGXQW8/mHYbYAFsG2bplmu4hscDDiuK9z764nzJBz5Ii+TsnDhlGnjp7lw+g+M2j151l4Zj7F3dV6ZgXRlOv/+r+JHgAEA1cuINZCXkbMAAAAASUVORK5CYII=');
          background-repeat: no-repeat;
        }
        .btn-complain i {
          background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAMAAADXqc3KAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyFpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo0QjdBRUJGRkVBMjYxMUU2ODZGOEQxRDM5RUY4Mzc4QyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo0QjdBRUMwMEVBMjYxMUU2ODZGOEQxRDM5RUY4Mzc4QyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjRCN0FFQkZERUEyNjExRTY4NkY4RDFEMzlFRjgzNzhDIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjRCN0FFQkZFRUEyNjExRTY4NkY4RDFEMzlFRjgzNzhDIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+ZWtBjQAAAFdQTFRFMZrckcnsMprcjsjs/P3+N53dOZ7df8Dpns/vms3un9DvX7Hkut3zUarhXK/jeb3os9rym87uer7oUqriVKvik8rtSabgr9jxmc3uksrskMjsPqDe////HRdxAAAAAB10Uk5T/////////////////////////////////////wBZhudqAAAAeklEQVR42rSRyQqAMAxEm9S17vuW//9Oa0EFU7UenENgeFkgI+hG4gGAYAIDhLX9BUhlvJJsAitdYuSrMNZl5EBGxkfS+ThRsfh9zUHpZ9rmOF3B3HmbH9IPN2zgeCKCXugB7k88FSRESWDLowVo7EGFoUuCv4NVgAEAO341dxoZzsMAAAAASUVORK5CYII=');
          background-repeat: no-repeat;
          left: 5px;
          top: 7px;
        }
        .btn-complain.active i {
          background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RUZCQTM1QUVFQzQwMTFFNjhGNUNCMTYxM0I1QTMwMkIiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RUZCQTM1QURFQzQwMTFFNjhGNUNCMTYxM0I1QTMwMkIiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjA2NzMyYTdhLWE0OWItYzI0ZC05Y2VhLTRjZmZiZDNkNzgyMSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDphOTk0OTE1My1mOWYyLWJiNGMtODI5Yi1mMzYxYTIzOTQwYzUiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz41XHgdAAAAw0lEQVR42uxVUQ7CIAylzG8/PDH791pewDP45QWcC+M5CSAhgAOZJotNmnRZea99aYEAsDWNs5XNJxCzo5ELC0qeRM+AGhXusL4qUVjBuwo/IqAMSJGUP5WIKrorkihnzSQSqflePrDzHhiHFwu8LMyB+c8y7s6lCHIgIkKcJNjWJvdLLrIJTJ6v94M9dLrc9uOEIcjrY5ddSftuVBWY4qTjqLy7iq7toh31Rwa8lkDjSgXZEXFDkE7c1JP5J4jaQ4ABABmh7k/SX8rJAAAAAElFTkSuQmCC');
          background-repeat: no-repeat;
          left: 5px;
          top: 7px;
        }


        .sf-calendar.line {
            /*width: 525px;*/
            margin: 10px 0 15px 0;
            clear: none;
            padding: 0;
        }
        .sf-calendar.line .inputWrap {
            position: static;
            margin: 0;
            padding: 0;
            display: inline-block;
        }
        .line.sf-calendar .inputWrap input.date {
          width: 120px;
          background: url(/portal_static/img/searchForm/calIco.png) no-repeat 95% 6px;
          cursor: pointer;
          border: 1px solid #bcbcbc!important;
          border-radius: 2px;

        }
        .sf-calendar input.date:focus {
          border-color: #41a3e0!important;
          box-shadow: none!important;
        }

        .fa-attached-file {
            margin-left: 19px;
            height: 16px;
        }
        .fa-linked-doc a,
        .fa-attached-file a {
            color: #0144dd;
            text-decoration: none;
        }
        .fa-linked-doc a:hover,
        .fa-attached-file a:hover {
            color: #c00;
            border-bottom: 1px solid #c00;
        }
        .fa-linked-doc a::after {
            content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPBAMAAADJ+Ih5AAAAGFBMVEX///9fmezw8PA2eMihw/M5eMeiwvOnxO40va+0AAAAPklEQVQI12PAChIFBUXADAEGBkYII9QYymAAMxwFBZiZQQwhpYIAKEOZgQHCMCoUFAMzlBSBFDaGI9gCBAAAc7wGGRqx47YAAAAASUVORK5CYII=');
            display: inline-block;
            margin-left: 4px;
            position: absolute;
        }

        .fa-attached-file.pdf-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/pdf.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.bmp-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/image.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.xls-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/x_office_spreadsheet.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.doc-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/document.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.pptx-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/image_x_eps.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.rar-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/zip.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.txt-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/text_plain.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.xml-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/xml.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .fa-attached-file.other-file a::before {
            content: '';
            display: block;
            position: absolute;
            width: 16px;
            background: url(https://ugd-tech.mos.ru/portal_static/img/mime/application_octet_stream.png);
            height: 17px;
            margin-left: -20px;
            background-size: 16px 18px;
        }

        .control-group textarea,
        .control-group .textarea {
            border: 1px solid #bcbcbc;
            min-height: 110px;
            width: 525px;
            padding: 7px 7px 7px 10px;
            font-family: 'PTSans', Arial, sans-serif;
            resize: vertical;
            border-radius: 2px;
            overflow: auto;
        }
        .control-group .textarea {
            display: inline-block;
        }
        .control-group.text-group label {
          vertical-align: top;
        }
        .control-group .textarea.gray {
            border-color: #bbb;
        }
        .control-group.text-group label .gray {
            font-size: 0.8em;
        }

        .control-group textarea:focus {
            border-color: #41a3e0;
            outline: none;
        }


        .control-group h2 {
            font-weight: normal;
            margin: 0 0 10px 0px;
            padding: 0;
        }
        .control-group ._token_input_wrapper {
            width: 525px;
            display: inline-block;
        }
        .input-region ._token_input_wrapper,
        .input-region .token-input-list {
          width: 300px!important;
        }

        .fa-container .formWrapper input {
            font-size: 13px;
        }

        .fa-container .formWrapper ul.token-input-list li,
        .fa-container .formWrapper ul.token-input-list li input:first-child {
          height: 30px;
        }
        .fa-container .formWrapper ul.token-input-list li.token-input-token {
            padding: 2px 22px 2px 7px;
            margin: 2px;
            background: #319ADC;
            position: relative;
            min-height: 26px;
        }
        .fa-container .formWrapper ul.token-input-list li.token-input-token * {
            color: #fff;
        }
        .fa-container .formWrapper ul.token-input-list .token-input-delete-token {
            position: absolute;
            right: 4px;
            bottom: 2px;
        }
        .fa-container .formWrapper ul.token-input-list {
          vertical-align: middle;
          border-radius: 2px;
        }
        .fa-container .formWrapper .tokenWrapper .multiselectLoupe {
            background: url('/portal_static/img/searchForm/folder.png') center center no-repeat;
            width: 30px;
            height: 100%;
            position: absolute;
            top: 0;
            margin: 0 0 0 -30px;
        }

        .fa-container .redField input,
        .fa-container .redField .token-input-list,
        .fa-container .redField textarea,
        .fa-container .redField .control__indicator {
            border-color: #FF7878;
        }



        .control-group .tokenWrapper b {
            top: 9px;
        }

        .radio-group {
          margin-left: 260px;
        }
        .radio-inline {
          margin-left: 174px;
          margin-bottom: 30px;
        }
        .radio-inline label:first-child {
          width: 88px;
          display: inline-block;
        }
        .radio-inline label.control--radio {
          display: inline-block;
          margin-right: 20px;
        }

        .radio-group .control-group label {
          width: auto;
        }


        .fa-footer {
            border-top: 1px solid #d7d8db;
            padding: 22px 35px 22px 35px;
            background-color: #fafbfc;
        }
        .fa-button {
            display: inline-block;
            border-radius: 3px;
            border: 1px solid transparent;
            /* min-width: 150px; */
            padding: 7px 10px;
            background: transparent;
            font-size: 13px;
            position: relative;
            cursor: pointer;
            text-decoration: none;
        }
        .fa-button + .fa-button {
            margin-left: 10px;
        }
        .fa-button:hover {
            background-color: #fff;
            border-color: #ccc;
        }
        .fa-button:before {
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
        .fa-button-primary,
        .fa-button-change {
            color: #fff;
            background-color: #319ADC;
        }
        .fa-button-primary:hover,
        .fa-button-change:hover {
            background-color: #0072ff;
            border-color: transparent;
        }
        .fa-button-close-appeal,
        .fa-button-two-line {
            border: 1px solid #44A3DF;
        }
        .fa-button-close-appeal:hover,
        .fa-button-two-line:hover {
            border-color: #0072ff;
        }
        .fa-button-close-appeal.disabled {
            color: #999;
            border-color: #ccc;
            cursor: default;
            outline: 0;
        }
        .fa-button-cancel {
            padding-left: 30px;
        }
        .fa-button-cancel:before {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAOCAMAAADDoWbgAAAAM1BMVEUAAAB/f3+AgICAgIB/f39/f3+AgICAgICAgICAgICAgICAgIB/f3+AgICAgIB/f3+AgIBsJ/mfAAAAEHRSTlMADKvDBBjXuvOjjYII48sokG78nwAAAFJJREFUCNddzlEKwCAMA1CrVjd1W+5/2jUFQeqH4ZVAm8KTKZ5rqv0dhawZzeKGkUD3IUmw4rzg/U0i6GyujaYFyJUbiCSk6SUS+VjoMJDjCzf/QmwDXrc94cYAAAAASUVORK5CYII=');
            width: 13px;
        }

        .fa-single-person {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            height: 34px;
            margin-bottom: 10px;
        }

        .fa-person-photo {
            width: 34px;
            height: 34px;
        }
        .fa-person-photo img {
            width: 34px;
            height: 34px;
            border-radius: 100px;
        }

        .fa-person-initials {
            line-height: 34px;
            margin-left: 12px;
            font-size: 16px;
            width: 300px;
        }

        .fa-calendar.line {
            width: 115px;
            margin: 2px 0 0 0;
            clear: none;
            padding: 0;
        }
        .fa-calendar.line .inputWrap {
            position: static;
            margin: 0;
            padding: 0;
        }
        .fa-calendar .date {
            font-size: 15px;
        }

        .fa-delete-person .line {
            width: 32px;
            height: 32px;
            padding: 0;
            margin: 2px 0 0 0;
        }

        .fa-no-image {
            background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAMAAAANmfvwAAAAh1BMVEUAAADY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+XY3+WKk5iPmJ2NlpvU2+Grs7nDy9G+xsuttrugqa7N1Nqyur+VnqOSm6DW3eOjrLGcpaqXoKXJ0de6wseosLadpqvP192aoqh4jQezAAAAFXRSTlMA+uy0s6BgIhbyy35aPcxZ83w+ejxHN123AAABYklEQVQ4y42U2XLCMAxFnZUQdlpvsbMCAUL///vaNLIsmtLpfZPnjCVdyWZEWZrkYRCEeZJm7Ddt4oCjgngzAxYR/6Fo8Uzslnym5ZoSKw4yg7gYhFaeeIMjfRajztoxB8wCB6dKTKpOjtlBpa4OK5ws1jPVjL0UiBS+r5F4x1AiIjlq9CfGqEek90jMWOY97RBpic8ZS32kEFHcK2WJDypEPgiSsNwHN0QaguQs9AFad9EECVlAohqQKycKKKKv92lGV00Rn6huWlUXUsl7LdumJomgXF2q79mYxnAztl24m7bQtB6mFLwRJZ/SDcAkYF0Js9GmNRpcLk5gXRbQCd6sullnsZkGAGNEWwtRXFxQwhjZhiJfgN+ayi0Di+iqdLbFpRlviXAxH7as+k4qJaRQSnZ9VdqHX0y25i+FT+nwiliRp/YnAbn2c2C//v+zRx1jujrxcQbAF7Qdv6Dt8xf0CQt3TYPhEUP4AAAAAElFTkSuQmCC');
        }

        .ui-datepicker .ui-datepicker-title {
            color: #fff;
        }
        .token-input-dropdown ul li {
            font-size: 16px;
        }
        div.token-input-dropdown ul li.token-input-selected-dropdown-item {
            background-color: #319adc;
            color: #fff;
        }


        /* Custom checkbox */

        .control {
            font-size: 15px;
            position: relative;
            display: block;
            padding-left: 30px;
            cursor: pointer;
            line-height: 26px;
        }

        .control input {
            position: absolute;
            z-index: -1;
            opacity: 0;
        }
        .control__indicator {
            position: absolute;
            top: 2px;
            left: 0;
            width: 20px;
            height: 20px;
            background: #fff;
            border: 1px solid #7b838e;
            box-sizing: border-box;
            overflow: hidden;
        }
        .control--radio .control__indicator {
           border-radius: 50%;
        }
        /* hover */
        .control:hover input ~ .control__indicator {
            background: #fff;
            border: 1px solid #7b838e;
        }
        /* checked */
        .control input:checked ~ .control__indicator {
            background: #fff;
            border: 1px solid #319adc;
        }
        /* check mark */
        .control__indicator:after {
            position: absolute;
            content: '';
        }
        /* checkbox tick */
        .control--checkbox .control__indicator:after {
            transform: rotate(45deg);
            display: block;
            margin-top: -3px;
            margin-left: 7px;
            width: 0;
            height: 0;
            box-shadow: 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 0 inset;
        }

        /* show check mark */
        .control--checkbox input:checked ~ .control__indicator:after {
            color: #319adc;
            box-shadow: 0 0 0 10px, 10px -10px 0 10px, 32px 0 0 20px, 0px 32px 0 20px, -5px 5px 0 10px, 20px -12px 0 11px;
            -webkit-animation: checkbox-on 0.3s forwards;
            -o-animation: checkbox-on 0.3s forwards;
            animation: checkbox-on 0.3s forwards;
        }

        .control--radio .control__indicator:after {
            top: 7px;
            left: 7px;
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: #fff;
        }
        .control--radio input:checked ~ .control__indicator {
          border: 1px solid #7b838e;
        }

        .control--radio input:checked ~ .control__indicator:after {
            width: 10px;
            height: 10px;
            top: 4px;
            left: 0;
            right: 0;
            background-color: #007aff;
            border-radius: 50%;
            margin: 0 auto;
            animation: radio-on 0.3s forwards;
        }


        .select-style {
            cursor: pointer;
            display: inline-block;
            padding: 0;
            margin: 0;
            overflow: hidden;
            background-color: #fff;
            background-color: transparent;
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJAAAACQCAYAAADnRuK4AAAKQWlDQ1BJQ0MgUHJvZmlsZQAASA2dlndUU9kWh8+9N73QEiIgJfQaegkg0jtIFQRRiUmAUAKGhCZ2RAVGFBEpVmRUwAFHhyJjRRQLg4Ji1wnyEFDGwVFEReXdjGsJ7601896a/cdZ39nnt9fZZ+9917oAUPyCBMJ0WAGANKFYFO7rwVwSE8vE9wIYEAEOWAHA4WZmBEf4RALU/L09mZmoSMaz9u4ugGS72yy/UCZz1v9/kSI3QyQGAApF1TY8fiYX5QKUU7PFGTL/BMr0lSkyhjEyFqEJoqwi48SvbPan5iu7yZiXJuShGlnOGbw0noy7UN6aJeGjjAShXJgl4GejfAdlvVRJmgDl9yjT0/icTAAwFJlfzOcmoWyJMkUUGe6J8gIACJTEObxyDov5OWieAHimZ+SKBIlJYqYR15hp5ejIZvrxs1P5YjErlMNN4Yh4TM/0tAyOMBeAr2+WRQElWW2ZaJHtrRzt7VnW5mj5v9nfHn5T/T3IevtV8Sbsz55BjJ5Z32zsrC+9FgD2JFqbHbO+lVUAtG0GQOXhrE/vIADyBQC03pzzHoZsXpLE4gwnC4vs7GxzAZ9rLivoN/ufgm/Kv4Y595nL7vtWO6YXP4EjSRUzZUXlpqemS0TMzAwOl89k/fcQ/+PAOWnNycMsnJ/AF/GF6FVR6JQJhIlou4U8gViQLmQKhH/V4X8YNicHGX6daxRodV8AfYU5ULhJB8hvPQBDIwMkbj96An3rWxAxCsi+vGitka9zjzJ6/uf6Hwtcim7hTEEiU+b2DI9kciWiLBmj34RswQISkAd0oAo0gS4wAixgDRyAM3AD3iAAhIBIEAOWAy5IAmlABLJBPtgACkEx2AF2g2pwANSBetAEToI2cAZcBFfADXALDIBHQAqGwUswAd6BaQiC8BAVokGqkBakD5lC1hAbWgh5Q0FQOBQDxUOJkBCSQPnQJqgYKoOqoUNQPfQjdBq6CF2D+qAH0CA0Bv0BfYQRmALTYQ3YALaA2bA7HAhHwsvgRHgVnAcXwNvhSrgWPg63whfhG/AALIVfwpMIQMgIA9FGWAgb8URCkFgkAREha5EipAKpRZqQDqQbuY1IkXHkAwaHoWGYGBbGGeOHWYzhYlZh1mJKMNWYY5hWTBfmNmYQM4H5gqVi1bGmWCesP3YJNhGbjS3EVmCPYFuwl7ED2GHsOxwOx8AZ4hxwfrgYXDJuNa4Etw/XjLuA68MN4SbxeLwq3hTvgg/Bc/BifCG+Cn8cfx7fjx/GvyeQCVoEa4IPIZYgJGwkVBAaCOcI/YQRwjRRgahPdCKGEHnEXGIpsY7YQbxJHCZOkxRJhiQXUiQpmbSBVElqIl0mPSa9IZPJOmRHchhZQF5PriSfIF8lD5I/UJQoJhRPShxFQtlOOUq5QHlAeUOlUg2obtRYqpi6nVpPvUR9Sn0vR5Mzl/OX48mtk6uRa5Xrl3slT5TXl3eXXy6fJ18hf0r+pvy4AlHBQMFTgaOwVqFG4bTCPYVJRZqilWKIYppiiWKD4jXFUSW8koGStxJPqUDpsNIlpSEaQtOledK4tE20Otpl2jAdRzek+9OT6cX0H+i99AllJWVb5SjlHOUa5bPKUgbCMGD4M1IZpYyTjLuMj/M05rnP48/bNq9pXv+8KZX5Km4qfJUilWaVAZWPqkxVb9UU1Z2qbapP1DBqJmphatlq+9Uuq43Pp893ns+dXzT/5PyH6rC6iXq4+mr1w+o96pMamhq+GhkaVRqXNMY1GZpumsma5ZrnNMe0aFoLtQRa5VrntV4wlZnuzFRmJbOLOaGtru2nLdE+pN2rPa1jqLNYZ6NOs84TXZIuWzdBt1y3U3dCT0svWC9fr1HvoT5Rn62fpL9Hv1t/ysDQINpgi0GbwaihiqG/YZ5ho+FjI6qRq9Eqo1qjO8Y4Y7ZxivE+41smsImdSZJJjclNU9jU3lRgus+0zwxr5mgmNKs1u8eisNxZWaxG1qA5wzzIfKN5m/krCz2LWIudFt0WXyztLFMt6ywfWSlZBVhttOqw+sPaxJprXWN9x4Zq42Ozzqbd5rWtqS3fdr/tfTuaXbDdFrtOu8/2DvYi+yb7MQc9h3iHvQ732HR2KLuEfdUR6+jhuM7xjOMHJ3snsdNJp9+dWc4pzg3OowsMF/AX1C0YctFx4bgccpEuZC6MX3hwodRV25XjWuv6zE3Xjed2xG3E3dg92f24+ysPSw+RR4vHlKeT5xrPC16Il69XkVevt5L3Yu9q76c+Oj6JPo0+E752vqt9L/hh/QL9dvrd89fw5/rX+08EOASsCegKpARGBFYHPgsyCRIFdQTDwQHBu4IfL9JfJFzUFgJC/EN2hTwJNQxdFfpzGC4sNKwm7Hm4VXh+eHcELWJFREPEu0iPyNLIR4uNFksWd0bJR8VF1UdNRXtFl0VLl1gsWbPkRoxajCCmPRYfGxV7JHZyqffS3UuH4+ziCuPuLjNclrPs2nK15anLz66QX8FZcSoeGx8d3xD/iRPCqeVMrvRfuXflBNeTu4f7kufGK+eN8V34ZfyRBJeEsoTRRJfEXYljSa5JFUnjAk9BteB1sl/ygeSplJCUoykzqdGpzWmEtPi000IlYYqwK10zPSe9L8M0ozBDuspp1e5VE6JA0ZFMKHNZZruYjv5M9UiMJJslg1kLs2qy3mdHZZ/KUcwR5vTkmuRuyx3J88n7fjVmNXd1Z752/ob8wTXuaw6thdauXNu5Tnddwbrh9b7rj20gbUjZ8MtGy41lG99uit7UUaBRsL5gaLPv5sZCuUJR4b0tzlsObMVsFWzt3WazrWrblyJe0fViy+KK4k8l3JLr31l9V/ndzPaE7b2l9qX7d+B2CHfc3em681iZYlle2dCu4F2t5czyovK3u1fsvlZhW3FgD2mPZI+0MqiyvUqvakfVp+qk6oEaj5rmvep7t+2d2sfb17/fbX/TAY0DxQc+HhQcvH/I91BrrUFtxWHc4azDz+ui6rq/Z39ff0TtSPGRz0eFR6XHwo911TvU1zeoN5Q2wo2SxrHjccdv/eD1Q3sTq+lQM6O5+AQ4ITnx4sf4H++eDDzZeYp9qukn/Z/2ttBailqh1tzWibakNml7THvf6YDTnR3OHS0/m/989Iz2mZqzymdLz5HOFZybOZ93fvJCxoXxi4kXhzpXdD66tOTSna6wrt7LgZevXvG5cqnbvfv8VZerZ645XTt9nX297Yb9jdYeu56WX+x+aem172296XCz/ZbjrY6+BX3n+l37L972un3ljv+dGwOLBvruLr57/17cPel93v3RB6kPXj/Mejj9aP1j7OOiJwpPKp6qP6391fjXZqm99Oyg12DPs4hnj4a4Qy//lfmvT8MFz6nPK0a0RupHrUfPjPmM3Xqx9MXwy4yX0+OFvyn+tveV0auffnf7vWdiycTwa9HrmT9K3qi+OfrW9m3nZOjk03dp76anit6rvj/2gf2h+2P0x5Hp7E/4T5WfjT93fAn88ngmbWbm3/eE8/syOll+AAADKElEQVR4Ae3XS27bMBRA0QzbrKzLypLaQf8by6wlgTygKFJXovl7yjEgaGJT5HkXBvTw4EOAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBAgQIECAAAECBDoIPJY1nsr1rsNauy1Rz/RUriuebQvrGs/Pcv0q1+dyXQm6nuXby9nq/UpnK8dZ/3lfthDx1ICuFNGf8cTZRNSxudfiCejs/0SvxRNnE1GHiG7FE9BZI7oVT5xNRHdEVOP5Ua7AvHXPFtGReOK8ImqI6Ew8AZ0lojPxxNlEdCKiGs/3g/88ARz33SNqiSfOJqKDEX1qjCegd43onnjibB8PGr7pr30op3++WEQ94qkm1cbngMCVIhLPgYGP+MoVIhLPiDJOrJk5IvGcGPTIr2aMSDwji2hYO1NE4mkY8IyfZIioxvO1XPHa3XL3tjWwpp0jEs/AwfdceseIxNNzwhPW2iki8UwY+IhH7BCReEZMduKaKyMSz8RBj3zUiohqPF/K1fKWFb/xtjWyipNrz4xIPCeHk+XrMyIST5YaGvc5MiLxNA4l289GRCSebBXcud+eEYnnzmFk/XmviLxtZS2gw757RBSv3S13r+odhrh6iVURiWf15Ds+f3ZE4uk4vF2WmhWReHaZ+IB9jI5IPAOGttuSoyISz26THrif3hGJZ+Cwdl26V0Ti2XXCE/Z1b0TimTCk3R/RGpF4dp/sxP2djUg8E4eT5VFHIxJPloku2Of/IhLPgqFke+S/IhJPtkku3O/fEYln4TCyPjoiEk/WCW6w7xpRvXwIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAm9I4DeC3zPK4LVGUQAAAABJRU5ErkJggg==');
            background-repeat: no-repeat;
            background-size: 24px 24px;
        }

        .select-style select {
            padding: 5px 8px;
            width: 130%;
            border: none;
            box-shadow: none;
            background-color: transparent;
            background-image: none;
            -webkit-appearance: none;
               -moz-appearance: none;
                    appearance: none;
            cursor: pointer;
        }

        .select-style select:focus {
            outline: none;
        }

        .select-style.source-select {
          position: relative;
          margin-left: 10px;
          background-position: right 0;
          vertical-align: top;
        }

        .fa-header .customSelect {
            height: auto;
            line-height: inherit;
        }
        .fa-header .customSelect .curSelect {
            height: auto;
            line-height: inherit;
            background: none;
            height: auto;
            border: 0;
            padding: 0 25px 0 0;
            display: inline-block !important; /*не показывать поле ввода для фильтрации*/
        }
        .fa-header .customSelect .curSelect:before {
            display: none;
        }
        .fa-header .customSelect .curSelect span {
            height: auto;
            line-height: inherit;
            margin: 0;
        }
        .fa-header .customSelect .finderForSelect {
            height: 20px;
            line-height: inherit;
            display: none !important; /*не показывать поле ввода для фильтрации*/
        }

        .fa-header .date {
            border: 0;
            background: transparent;
            height: 20px;
            line-height: inherit;
            width: 75px;
            padding: 0;
            text-align: center;
        }

        .st_rightSideBar {
            width: 400px;
            float: right;
            position: relative;
            /*position: absolute;
            top: 0;
            right: 0;*/
        }
        .st_rightSideBar .cardBodySide {
            width: 400px;
            padding: 25px;
            box-shadow: 0 0 5px 0 #ccc;
            background: #fff;
        }
        .st_rightSideBar.minimized {
            box-shadow: 0 0 5px 0 #ccc;
            background: #fff;
        }
        .st_rightSideBar.minimized .cardBodySide {
            visibility: hidden;
        }
        .st_rightSideBar .grip {
            width: 45px;
            height: 48px;
            position: absolute;
            top: 103px;
            left: -45px;
            cursor: pointer;
            box-shadow: -2px 1px 5px 0 #ccc;
            background: #fff url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAbCAMAAABRPb9kAAAAM1BMVEX///+ioqKoqKju7u77+/vR0dHAwMCxsbGlpaX39/fx8fHm5ubh4eHa2trHx8e8vLy3t7cWDO8jAAAAZUlEQVQoz9WQVw7AIAxD40AhbO5/2k51gCp+W39ZflKG6afyhgE2vs0nwSaZmhywUetogQcJgry7DAk3YFC1K6yIdIW5cmeRqGAFlGDdCRSzUryAw49AP2qwvD938GBXyWuJn9YM6XEDE4pEbXsAAAAASUVORK5CYII=') center center no-repeat;
        }
        .st_rightSideBar .grip:hover {
            opacity: 0.7;
        }
        .st_rightSideBar .progress,
        .st_rightSideBar .knowledgeControls .addNew {
            display: none;
        }


        .switcherWrap {
            width: 35px;
            height: 21px;
            border-radius: 21px;
            border: 0;
            position: relative;
            background: #777;
            cursor: pointer;
        }
        .switcherWrap .switcherGrip {
            position: absolute;
            top: 0;
            border-radius: 100%;
            border: 1px solid #777;
            width: 21px;
            height: 21px;
            background: #fff;
        }
        .switcherWrap[data-index="0"] .switcherGrip {
            left: 0;
        }
        .switcherWrap[data-index="1"] .switcherGrip {
            right: 0;
        }
        .switcherLabel {
            padding: 0 10px;
            cursor: default;
        }
        .switcherLabel:first-child {
            padding-left: 0;
        }
        .fieldTrigger {
            line-height: 32px;
        }
        .fieldTrigger div {
            display: inline-block;
            vertical-align: middle;
        }
        .fieldTrigger label {
            display: none;
        }

        .required &gt; label:not(.button):first-child:before {
            content: ' * ';
            display: inline;
            color: red;
        }

        .smallText {
            font-size: 0.8em;
        }

        .fa-change-contact {

        }
        .fa-change-contact-icon {
            width: 32px;
            height: 32px;
            background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAMAAAAMs7fIAAAAWlBMVEUAAAB8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6T///98j6StucbW3OOcqrqElqrv8fTGzteMna/3+Pne4+ilssDm6u6+x9LP6jQrAAAAEHRSTlMAvxDvYJ+AcDAg38+vj0BQ9e/ofAAAAIxJREFUGNN1j9sOgyAQBRGwVqutA+K1/f/fLCwSkyadtzMcWFb9wfYdVI0u+d6RMc0pDMH5fV9WqJNoDdM8Cg5e0dSsm2RRRisNPgWfilvAqidBjhfeUqrVjWm8+FD9mCMay3oJRzQtzPmdTPxkxSGzAkKr4jBcuQKDigww+VM88rI3CpUuy/dIwabwBarCDeD1+p+LAAAAAElFTkSuQmCC') center center no-repeat;
            cursor: pointer;
        }
        .fa-change-contact-list {
            z-index: 1000;
            padding: 10px 0;
        }
        .fa-change-contact-list .fa-change-contact-item {
            position: relative;
            padding: 5px 90px 5px 30px;
        }
        .fa-change-contact-list .fa-change-contact-item + .fa-change-contact-item {
            border-top: 1px solid #D8DFE5;
        }
        .fa-change-contact-list .fa-change-contact-item:nth-child(even) {
            background: #F2F6FA;
        }
        .fa-change-contact-list .fa-change-contact-item .fa-change-contact-button {
            background: #319ADC;
            color: #fff;
            top: 0;
            right: 0;
            bottom: 0;
            cursor: pointer;
            position: absolute;
            width: 80px;
            display: none;
        }
        .fa-change-contact-list .fa-change-contact-item:hover .fa-change-contact-button {
            display: block;
        }
        .fa-change-contact-list .fa-change-contact-item .fa-change-contact-button span {
            position: absolute;
            top: 50%;
            width: 100%;
            text-align: center;
            transform: translate(0, -50%);
        }

        .st_hyperselect .token-input-input-token, .st_hyperselect .token-input-input-token input { width: 100% !important; }


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
        /* radio animation */
        @-webkit-keyframes radio-on {
            0% { opacity: .3; }
            50% { opacity: .7; }
            100% { opacity: 1; }
        }
        @keyframes checkbox-on {
            0% { opacity: .3; }
            50% { opacity: .7; }
            100% { opacity: 1; }
        }





    </style>
    <div class="fa-wrapper">

        <div class="fa-container">
            <xsl:if test="$DATA/TEXT">
                <p><xsl:value-of select="$DATA/TEXT"/></p>
            </xsl:if>
            <form action="submit/simpleSubmit.action?action=contact_center.save_appeal" method="POST" class="formWrapper" id="formWrapper"><!-- xfTag="APPEAL" -->
                <div id="rightSideBar" class="st_rightSideBar">{B{CARD$APPEAL$SIDEBAR}E}</div>
                <!--input id="xml" type="hidden" name="XML"/>
                <input type="hidden" name="action" value="functional_agreement.save_agreement_list"/>
                <input type="hidden" xfTag="TYPE" value="{$DATA//TYPE}"/-->

                <input type="hidden" name="ID" value="{$DATA/ID}"/>

                <input type="hidden" name="EXECUTOR_2LINE" value=""/>

                <div class="fa-header">
                   <div class="left-block">
                    <input type="hidden" name="ALT_CODE" value="{$DATA/ALT_CODE}"/>
                    <div>Номер обращения: <span class="appeal-number">№ <xsl:value-of select="$DATA/ALT_CODE"/><!--КС-00001/16--></span> от <!--
                    --><input type="text" class="date" name="APPEAL_DATE" value="{$DATA/APPEAL_DATE}"/></div>
                    <div style="padding-top: 10px;">Источник: <!--
                      --><span class="select-style source-select"><!--
                        --><select class="customSelect" name="APPEAL_SOURCE_NICK"><xsl:for-each select="//CC_CALL_APPEAL_SOURCE/ROW_SET/ROW"><!--
                            --><option value="{ID}"><xsl:if test="ID = $DATA/APPEAL_SOURCE_NICK">
                                <xsl:attribute name="selected">selected</xsl:attribute></xsl:if><!--
                            --><xsl:value-of select="NAME"/></option><!--
                        --></xsl:for-each></select><!--
                      --></span></div>
                   </div>

                   <div class="right-block">
                      <div style="text-align: right;" xmlTag="MANAGEMENTS">Оператор: <!--
                      --><span class="select-style source-select"><!--
                        --><select class="customSelect" name="EXECUTOR_ID" data-role="OPERATOR" data-role-name="DOC_MNG_ROLE"><xsl:for-each select="//CC_EMPLOYEES/ROW_SET/ROW"><!--
                            --><option value="{ID}"><xsl:if test="ID = $DATA/MANAGEMENTS/EXECUTOR_ID">
                                <xsl:attribute name="selected">selected</xsl:attribute></xsl:if><!--
                            --><xsl:value-of select="NAME"/></option><!--
                        --></xsl:for-each></select><!--
                      --></span>
                          <input type="hidden" name="AUTHOR_ID" value="{$DATA/MANAGEMENTS/AUTHOR_ID}"/>
                          <input type="hidden" name="CURATOR_ID" value="{$DATA/MANAGEMENTS/CURATOR_ID}"/>
                      </div>
                      <div style="text-align: right; padding-top: 10px;">Статус обращения: <!--
                      --><span class="select-style source-select"><!--
                        --><select class="customSelect" name="APPEAL_STATUS_NICK"><xsl:for-each select="//CC_CALL_APPEAL_STATUS/ROW_SET/ROW"><!--
                            --><option value="{ID}"><xsl:if test="ID = $DATA/APPEAL_STATUS_NICK">
                                <xsl:attribute name="selected">selected</xsl:attribute></xsl:if><!--
                            --><xsl:value-of select="NAME"/></option><!--
                        --></xsl:for-each></select><!--
                      --></span></div>
                   </div>
                </div>

                <div class="fa-body">

                  <h2>Регистрация</h2>

                  <div class="control-group required">
                    <label>Фамилия</label>
                    <input type="text" class="input-default" name="LAST_NAME" value="{$DATA/LAST_NAME}"/>
                  </div>

                  <div class="control-group required">
                    <label>Имя</label>
                    <input type="text" class="input-default" name="FIRST_NAME" value="{$DATA/FIRST_NAME}"/>
                  </div>

                  <div class="control-group">
                    <label>Отчество</label>
                    <input type="text" class="input-default" name="MIDDLE_NAME" value="{$DATA/MIDDLE_NAME}"/>
                  </div>

                  <div class="control-group multicontrol-group">
                    <div class="control-group">
                      <label>Телефон</label>
                      <input type="text" class="input-default input-phone" placeholder="+7(___) ___-__-__" name="PHONE" value="{$DATA/PHONE}"/>
                    </div>
                    <div class="control-group email-group">
                      <label>или email</label>
                      <input type="text" class="input-default input-email" name="EMAIL" value="{$DATA/EMAIL}"/>
                    </div>
                    <div class="fa-change-contact" style="display: none;"><div class="rDrop fa-change-contact-icon"></div><div class="rDropTarget fa-change-contact-list" style="display: none;"></div></div>
                  </div>

                  <div class="the-line"></div>

                  <div class="control-group button-group js_applicant required">
                      <xsl:for-each select="//CC_ORG_TYPE/ROW_SET/ROW">
                          <xsl:sort select="ID"/>
                          <xsl:variable name="applicantId" select="ID"/>
                          <xsl:variable name="className">button
                              <xsl:if test="$DATA/APPLICANT_TYPE_NICK = $applicantId">
                                  active
                              </xsl:if>
                          </xsl:variable>
                          <label class="{$className}" data-type-id="{ID}">
                              <xsl:value-of select="NAME"/><span style="display: none;">
                              <input type="radio" name="APPLICANT_TYPE_NICK" value="{ID}">
                                  <xsl:if test="$DATA/APPLICANT_TYPE_NICK = $applicantId">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                  </xsl:if>
                              </input>
                          </span></label>
                      </xsl:for-each>
                      <!-- btn-phys-person | btn-jur-person -->
                  </div>


                  <div class="control-group token-input-group js_applicant_ext js_applicant_YUL st_hyperselect">
                      <label>Организация</label>
                      <div class="_token_input_wrapper">
                          <input type="text" class="input-default tokenInput applicantOrg" data-identifier="CC_ORGANIZATIONS" data-save-text="true" data-load-names="true" data-token-limit="1" data-info="inputName" name="APPLICANT_ORG"/>
                          <span class="hidden tokenValues">
                            <xsl:if test="$DATA/APPLICANT_ORG_ID != '' or $DATA/APPLICANT_ORG != ''">
                               <span class="tokenItem">
                                   <span class="tokenId"><xsl:value-of select="$DATA/APPLICANT_ORG_ID"/></span>
                                   <span class="tokenValue"><xsl:value-of select="$DATA/APPLICANT_ORG"/></span>
                               </span>
                            </xsl:if>
                          </span>
                     </div>
                  </div>


                  <div class="control-group multicontrol-group js_applicant_ext js_applicant_YUL">
                    <div class="control-group">
                      <label>ИНН</label>
                      <input type="text" class="input-default input-inn applicantInn" name="APPLICANT_ORG_INN" value="{$DATA/APPLICANT_ORG_INN}"/>
                    </div>
                    <div class="control-group ogrn-group">
                      <label>ОГРН</label>
                      <input type="text" class="input-default input-ogrn applicantOgrn" name="APPLICANT_ORG_OGRN" value="{$DATA/APPLICANT_ORG_OGRN}"/>
                    </div>
                  </div>

                  <div class="the-line"></div>

                  <h2>Тип обращения</h2>

                  <!--div class="control-group button-group btn-appeal-group">
                    <button class="btn-build-procedures active">
                      <i></i>
                      Госуслуги и процедуры  в строительстве
                    </button>
                    <button class="btn-el-services">
                      <i></i>
                      Электронные сервисы</button>
                    <button class="btn-ref-info">
                      <i></i>
                      Справочная информация</button>
                    <button class="btn-complain">
                      <i></i>
                      Жалобы</button>
                  </div-->

                  <div class="control-group button-group btn-appeal-group js_appeal_type">
                      <xsl:for-each select="//CC_CALL_APPEAL_TYPE//TYPES/TYPE">
                          <xsl:variable name="typeId" select="NICK"/>
                          <xsl:variable name="className">button
                              <xsl:if test="$DATA/APPEAL_TYPE_NICK = $typeId or TYPE[NICK=$DATA/APPEAL_TYPE_NICK] != ''">
                                  active
                              </xsl:if>
                          </xsl:variable>
                          <label class="{$className}" data-type-id="{ID}">
                              <i><img src="/portal_static/img/icons/contact_center/{ICON_INACTIVE}" class="inactive"/><!--
                              --><img src="/portal_static/img/icons/contact_center/{ICON_ACTIVE}" class="active"/><!--
                              --></i><xsl:value-of select="NAME"/><span style="display: none;">
                              <input type="radio" value="{NICK}">
                                  <xsl:if test="$DATA/APPEAL_TYPE_NICK = $typeId or TYPE[ID=$DATA/APPEAL_TYPE_NICK] != ''">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                  </xsl:if>
                              </input>
                          </span></label>
                      </xsl:for-each>
                  </div>

                  <xsl:for-each select="//CC_CALL_APPEAL_TYPE//TYPES/TYPE">
                      <div class="radio-group js_appeal_type_ext js_appeal_type_{NICK}" style="display: none;">
                          <xsl:for-each select="TYPE">
                              <xsl:variable name="typeId" select="NICK"/>
                              <div class="control-group">
                                  <label class="control control--radio"><xsl:value-of select="NAME"/>
                                      <input type="radio" name="APPEAL_TYPE_NICK" value="{NICK}">
                                          <xsl:if test="$DATA/APPEAL_TYPE_NICK = $typeId">
                                              <xsl:attribute name="checked">checked</xsl:attribute>
                                          </xsl:if>
                                      </input>
                                      <div class="control__indicator"></div>
                                  </label>
                              </div>
                          </xsl:for-each>
                      </div>
                  </xsl:for-each>

                  <div class="control-group text-group required">
                    <label>Текст обращения</label>
                    <textarea name="APPEAL_TEXT"><xsl:value-of select="$DATA/APPEAL_TEXT"/></textarea>
                  </div>

                  <div class="control-group required" xmlTag="LABELS">
                    <label>Метки</label>
                    <div class="_token_input_wrapper">
                        <input type="text" class="input-default tokenInput tagList" data-identifier="KB_TAG" data-load-names="true" data-search-multiple="true" data-info="inputName" name="LABEL"/>
                         <span class="hidden tokenValues">
                            <xsl:for-each select="$DATA/LABELS/LABEL">
                                <span class="tokenItem">
                                    <span class="tokenId"><xsl:value-of select="ID"/></span>
                                    <span class="tokenValue"><xsl:value-of select="NAME"/></span>
                                </span>
                             </xsl:for-each>
                         </span>
                   </div>
                </div>

                  <div class="the-line"></div>

                  <div class="control-group token-input-group js_appeal_type_sub st_hyperselect" style="display: none;" data-appeal-types="NONPAYMENT_OF_SALARY">
                      <label>Организация</label>
                      <div class="_token_input_wrapper">
                          <input type="text" class="input-default tokenInput complainOrg" data-identifier="CC_ORGANIZATIONS" data-save-text="true" data-load-names="true" data-token-limit="1" data-info="inputName" name="COMPLAIN_ORG"/>
                           <span class="hidden tokenValues">
                             <xsl:if test="$DATA/COMPLAIN_ORG_ID != '' or $DATA/COMPLAIN_ORG != ''">
                               <span class="tokenItem">
                                 <span class="tokenId"><xsl:value-of select="$DATA/COMPLAIN_ORG_ID"/></span>
                                 <span class="tokenValue"><xsl:value-of select="$DATA/COMPLAIN_ORG"/></span>
                               </span>
                             </xsl:if>
                           </span>
                     </div>
                  </div>

                  <div class="control-group js_appeal_type_sub" style="display: none;" data-appeal-types="NONPAYMENT_OF_SALARY">
                    <label>Профессия</label>
                    <input type="text" class="input-default" name="POSITION" value="{$DATA/POSITION}"/>
                  </div>

                  <div class="control-group sf-calendar line js_appeal_type_sub" style="display: none;" data-appeal-types="SALARY_NONPAYMENT">
                    <label>Период невыплат с</label>
                    <span class="inputWrap">
                      <input class="date dateFrom" name="COMPLAIN_PERIOD_SINCE" value="{$DATA/COMPLAIN_PERIOD_SINCE}"/> по
                      <input class="date dateTo" name="COMPLAIN_PERIOD_TO" value="{$DATA/COMPLAIN_PERIOD_TO}"/>
                    </span>
                  </div>

                  <div class="control-group token-input-group js_appeal_type_sub" style="display: none;" xmlTag="OBJECTS" data-appeal-types="PREP_FOR_CONSTR, SMR, ZSMR, RES_CONNECT, INITIAL_OPERATION, CONSTRUCTION_VIOLATIONS, NIGHT_NOISE, SHARE_BUILDING, CONSTR_SITE, SALARY_NONPAYMENT, CONSTR_IMPERFECTIONS, RENOVATION, DEMOLITION_AND_RELOCATION, RENOVATE_EXIST_BUILD, BUILD_EXIST_AREA, REFERENCE_INF, BUILD_COMPL_DATE, MAJOR_OVERHAUL, BEAUTIFICATION, UNCOMPLETE_CONSTR">
                      <label>Объект реестра</label>
                      <div class="_token_input_wrapper">
                          <input type="text" class="input-default tokenInput" data-identifier="CC_OBJECT_RS" data-load-names="true" data-token-limit="1" data-info="inputName" name="OBJECT"/>
                           <span class="hidden tokenValues">
                               <xsl:for-each select="$DATA/OBJECTS/OBJECT">
                                   <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="ID"/></span>
                                       <span class="tokenValue"><xsl:value-of select="NAME"/></span>
                                   </span>
                               </xsl:for-each>
                           </span>
                     </div>
                     <a class="fa-link-blank" id="fa-link-object-rs" target="_blank"></a>
                  </div>


                  <div class="control-group token-input-group js_appeal_type_sub" style="display: none;" xmlTag="ADDRESS" data-appeal-types="CONSTRUCTION_VIOLATIONS, NIGHT_NOISE, SHARE_BUILDING, CONSTR_SITE, SALARY_NONPAYMENT, CONSTR_IMPERFECTIONS, RENOVATION, DEMOLITION_AND_RELOCATION, RENOVATE_EXIST_BUILD, BUILD_EXIST_AREA, REFERENCE_INF, BUILD_COMPL_DATE, MAJOR_OVERHAUL, BEAUTIFICATION, UNCOMPLETE_CONSTR">
                      <label>Адрес объекта</label>
                      <div class="_token_input_wrapper">
                          <input type="text" class="input-default tokenInput" data-identifier="CC_ADSRESSES" data-load-names="true" data-token-limit="1" data-info="inputName" name="ADDRESS_ID"/>
                           <span class="hidden tokenValues">
                               <xsl:for-each select="$DATA/ADDRESS">
                                   <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="ADDRESS_ID"/></span>
                                       <span class="tokenValue"><xsl:value-of select="ADDRESS_ID"/></span>
                                   </span>
                               </xsl:for-each>
                           </span>
                     </div>
                  </div>
                  <div class="control-group js_appeal_type_sub" style="display: none;" xmlTag="ADDRESS" data-appeal-types="CONSTRUCTION_VIOLATIONS, NIGHT_NOISE, SHARE_BUILDING, CONSTR_SITE, SALARY_NONPAYMENT, CONSTR_IMPERFECTIONS, RENOVATION, DEMOLITION_AND_RELOCATION, RENOVATE_EXIST_BUILD, BUILD_EXIST_AREA, REFERENCE_INF, BUILD_COMPL_DATE, MAJOR_OVERHAUL, BEAUTIFICATION, UNCOMPLETE_CONSTR">
                      <label></label>
                      <input type="text" class="input-default" name="ADD_INFO" value="{$DATA/ADDRESS/ADD_INFO}" placeholder="Дом, строение, квартира"/>
                  </div>

                  <div class="control-group multicontrol-group multicontrol-big" xmlTag="ADDRESS">

                    <div class="control-group token-input-group input-region js_appeal_type_sub" style="display: none;" data-appeal-types="CONSTRUCTION_VIOLATIONS, NIGHT_NOISE, SHARE_BUILDING, CONSTR_SITE, SALARY_NONPAYMENT, CONSTR_IMPERFECTIONS, RENOVATION, DEMOLITION_AND_RELOCATION, RENOVATE_EXIST_BUILD, BUILD_EXIST_AREA, REFERENCE_INF, BUILD_COMPL_DATE, MAJOR_OVERHAUL, BEAUTIFICATION, UNCOMPLETE_CONSTR">
                        <label>Округ, район</label>
                        <div class="_token_input_wrapper">
                            <input type="text" class="input-default tokenInput" data-identifier="CC_OMKTE" data-paramnames="omkymId" data-parameters="NULL" data-load-names="true" data-token-limit="1" data-info="inputName" name="DIST_PREF_ID" data-ext-search="true" data-viewing-id="9F93B2C0E50F4A648DC4B8CCF6380A2D"/>
                             <span class="hidden tokenValues">
                                 <xsl:for-each select="$DATA/ADDRESS">
                                   <span class="tokenItem">
                                       <span class="tokenId"><xsl:value-of select="DIST_PREF_ID"/></span>
                                       <span class="tokenValue"><xsl:value-of select="DIST_PREF_ID"/></span>
                                   </span>
                               </xsl:for-each>
                             </span>
                       </div>
                    </div>


                    <div class="control-group js_appeal_type_sub" style="display: none;" data-appeal-types="CONSTRUCTION_IMPERFECTIONS">
                      <label>Год заселения</label>
                      <input type="text" class="input-default input-year" name="LAUNCH_YEAR" value="{$DATA/ADDRESS/LAUNCH_YEAR}"/>
                    </div>
                  </div>

                  <div class="radio-group radio-inline js_appeal_type_sub" style="display: none;" xmlTag="ADDRESS" data-appeal-types="CONSTRUCTION_IMPERFECTIONS">
                    <label>Тип жилья</label>
                    <xsl:for-each select="//CC_CALL_HOME_TYPE/ROW_SET/ROW">
                      <xsl:variable name="homeType" select="ID"/>
                      <label class="control control--radio"><xsl:value-of select="NAME"/>
                      <input type="radio" name="HOUSING_TYPE_NICK" value="{$homeType}">
                          <xsl:if test="$homeType = $DATA/ADDRESS/HOUSING_TYPE_NICK">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                      </input>
                      <div class="control__indicator"></div>
                    </label>
                    </xsl:for-each>
                  </div>

                  <xsl:choose>
                      <xsl:when test="$DATA/DEADLINE/VISIBLE = 1">
                          <div class="the-line"></div>

                          <div class="radio-group radio-inline" style="margin-bottom: 15px;">
                              <label>Тип дней</label>
                              <span class="control-group fieldTrigger">
                                  <label class="control control--radio">Рабочий
                                      <input type="radio" name="DEADLINE_DAYS_TYPE" value="1" data-color="#319ADC">
                                          <xsl:if test="$DATA/DEADLINE/DEADLINE_DAYS_TYPE = 1">
                                              <xsl:attribute name="checked">checked</xsl:attribute>
                                          </xsl:if>
                                      </input>
                                  </label>
                                  <label class="control control--radio">Календарный
                                      <input type="radio" name="DEADLINE_DAYS_TYPE" value="0" data-color="#319ADC">
                                          <xsl:if test="$DATA/DEADLINE/DEADLINE_DAYS_TYPE = 0">
                                              <xsl:attribute name="checked">checked</xsl:attribute>
                                          </xsl:if>
                                      </input>
                                  </label>
                              </span>
                          </div>

                          <div class="control-group sf-calendar multicontrol-group line">
                            <label>Количество дней</label>
                            <div class="control-group">
                                <input class="input-default" name="DAYS_TO_DEADLINE" value="{$DATA/DEADLINE/DAYS_TO_DEADLINE}" style="width: 50px;"/>
                            </div>
                            <div class="control-group inputWrap">
                                <label style="width: 150px;"> Срок исполнения </label>
                                <input class="input-default date" name="DEADLINE_DATE" value="{$DATA/DEADLINE/DEADLINE_DATE}" style="width: 120px;"/>
                            </div>
                          </div>
                      </xsl:when>
                      <xsl:otherwise>
                          <input type="hidden" name="DEADLINE_DAYS_TYPE" value="{$DATA/DEADLINE/DEADLINE_DAYS_TYPE}"/>
                          <input type="hidden" name="DAYS_TO_DEADLINE" value="{$DATA/DEADLINE/DAYS_TO_DEADLINE}"/>
                          <input type="hidden" name="DEADLINE_DATE" value="{$DATA/DEADLINE/DEADLINE_DATE}"/>
                      </xsl:otherwise>
                  </xsl:choose>

                  <div class="the-line"></div>

                  <div class="control-group text-group">
                    <label>Ответ оператора</label>
                    <textarea name="APPEAL_ANSWER"><xsl:value-of select="$DATA/APPEAL_ANSWER"/></textarea>
                  </div>

<!--<APPEAL>
<COMMENTS>
	<COMMENT>
		<ID></ID>
		<FIO></FIO>
		<APPEAL_COMMENT></APPEAL_COMMENT>
		<COMMENT_DATE></COMMENT_DATE>
	</COMMENT>
</COMMENTS>
</APPEAL>-->
                  <xsl:for-each select="$DATA/COMMENTS/COMMENT">
                      <div class="control-group text-group">
                          <label>Примечание
                              <div class="gray">
                                  <xsl:value-of select="FIO"/>
                                  <xsl:if test="COMMENT_DATE != ''"><br/>от <xsl:value-of select="COMMENT_DATE"/></xsl:if>
                              </div>
                          </label>
                          <div class="textarea gray"><xsl:value-of select="APPEAL_COMMENT"/></div>
                      </div>
                  </xsl:for-each>

                  <div class="control-group text-group">
                    <label>Примечание</label>
                    <textarea name="APPEAL_COMMENT"><xsl:value-of select="$DATA/APPEAL_COMMENT"/></textarea>
                  </div>

                  <div class="fa-button-bar">
                      <div class="fa-button-bar-left">
                          <button type="button" class="fa-button fa-button-primary">Сохранить</button>
                          <div class="fa-button fa-button-two-line" style="position: relative;">Передать на вторую линию<div class="buttonOverlay rDrop"></div><div class="rDropTarget fa-popup-form fa-popup-executors" style="display: none;">
                              <xsl:call-template name="executorSelect">
                                  <xsl:with-param name="data" select="//CC_EMPLOYEES//ROW"/>
                              </xsl:call-template>
                              <div style="text-align: center;"><div type="button" class="fa-button fa-button-change">Выбрать и сохранить</div></div>
                          </div></div>
                      </div>
                      <div class="fa-button-bar-right">
                          <button type="button" class="fa-button fa-button-close-appeal">Закрыть обращение</button>
                          <div class="fa-question"><div class="buttonOverlay rDrop"></div><div class="rDropTarget fa-tooltip-body" style="display: none;">Заполните тип обращения и ответ оператора для закрытия обращения</div></div>
                      </div>
                  </div>
                  <!--button type="button" class="fa-button fa-button-primary">Сохранить</button>
                  <button type="button" class="fa-button fa-button-close-appeal">Закрыть обращение</button>
                  <div class="fa-question"><div class="buttonOverlay rDrop"></div><div class="rDropTarget fa-tooltip-body" style="display: none;">Чтобы закрыть обращение заполните поле<br/>Тип обращения и Ответ оператора</div></div-->

                </div>

            </form>

        </div>
    </div>




    <xml style="display: none" class="FORM">
        <xsl:copy-of select="*"/>
    </xml>
    <script src="/static/HSF/latest/hsf.js"></script>
    <script src="js/spbren/configuration.js"></script>
    <script src="/static/TokenInput/latest/jquery.tokeninput.js"></script>
    <script src="/static/typeForm/formHelper.js"></script>
    <script src="/static/JQueryPlugins/jquery-ui.custom.min.js"></script>
    <script src="js/ui.datepicker-ru.js"></script>
    <script src="/static/JQueryPlugins/jquery.ricos.select-1.0-full.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
    {B{SCRIPT$SWITCHER}E}
    {B{SCRIPT$RICOS_DROP}E}


    {B{FRM$XML_GENERATION$V0}E}


    <script><![CDATA[

        window.formDatePickerFormat = {
            dateFormat:      "dd.mm.yy",
            /*showOn:          "button",
            buttonImage:     "/portal_static/img/searchForm/calIco.png",
            buttonImageOnly: true,*/
            changeYear:      true,
            changeMonth:     true,
            duration:        '',
            showButtonPanel: true,
            gotoCurrent:     false/*,
            beforeShow:      window.typeForm.showPicker,
            onClose:         window.typeForm.hidePiker*/
        };

        window.changeContactList = [];

        $(function(){
            var actions = {
                close: 'submit/simpleSubmit.action?action=contact_center.complete_appeal',
                save: 'submit/simpleSubmit.action?action=contact_center.save_appeal',
                save2line: 'submit/simpleSubmit.action?action=contact_center.transfer_2line'
            };
            var $triggerBtn = $('.button-group button, .button-group .button');
            var $triggerApplicant = $('.js_applicant button, .js_applicant .button');
            var $triggerAppealType = $('.js_appeal_type button, .js_appeal_type .button');

            var $appOrg = $('.applicantOrg');
            var $appInn = $('.applicantInn');
            var $appOgrn = $('.applicantOgrn');

            $('.date').datepicker(window.formDatePickerFormat);

            $('.tokenInput').each(function() {
                initTokenInput($(this), {
                    deleteAlways: true
                });
            });

            $('.fieldTrigger').switcher();

            $triggerBtn.on('click', function(e){
                $(this).addClass('active').siblings().removeClass('active');
            });

            //Показать/скрыть блок полей организации (Юр.лицо)
            $triggerApplicant.on('click', function() {
                var val = $(this).find('input').val(),
                    $group = $('.js_applicant_ext').hide();

                $group.filter('.js_applicant_' + val).show();

            });
            //Активировать активную или первую кнопку
            var $activeApplicant = $triggerApplicant.filter('.active');
            if (!$activeApplicant.length) $activeApplicant = $triggerApplicant.first();
            $activeApplicant.click();

            //Показать/скрыть блоки полей "тип обращения"
            $triggerAppealType.on('click', function() {
                var val = $(this).find('input').val(),
                    $groups = $('.js_appeal_type_ext').hide();

                $groups.filter('.js_appeal_type_' + val).show();
            });
            //Активировать активную или первую кнопку
            var $activeAppealType = $triggerAppealType.filter('.active');
            //if (!$activeAppealType.length) $activeAppealType = $triggerAppealType.first();
            $activeAppealType.click();

            $('[name="APPEAL_TYPE_NICK"]').on('change', function() {
                var $targets = $('.js_appeal_type_sub'),
                    appealType = $(this).val() || '';

                $targets.each(function() {
                    var $t = $(this),
                        isNeedShow = false,
                        appealNickList = $t.attr('data-appeal-types').split(/,\s*/);

                    for (var i=0; i<appealNickList.length; i++) {
                        if (appealType == appealNickList[i]) {
                            isNeedShow = true;
                            break;
                        }
                    }
                    console.log();
                    if (isNeedShow) $t.show();
                    else $t.hide();
                });
            }).filter(':checked').trigger('change');

            //.js_applicant_org

            $('.input-phone').mask("+7(999) 999-99-99");

            $('select.customSelect').customSelect();

            $('.fa-question').ricosDrop({
                margin: 15
            });

            $('.fa-change-contact').ricosDrop({
                margin: 15
            });

            $(':input').on('change', function() {
                var $t = $(this),
                    name = $t.attr('name') || $t.attr('data-name'),
                    dependNames = ['FIRST_NAME', 'LAST_NAME', 'PHONE', 'EMAIL', 'APPLICANT_ORG_ID', 'COMPLAIN_ORG_ID', 'APPEAL_TYPE_NICK', 'LABEL'];

                $t.closest('.redField').removeClass('redField');

                if (~('|' + dependNames.join('|') + '|').indexOf(name)) {
                    $('#rightSideBar').trigger('update', _makeSidebarParams());
                }

                updateStatusCloseButton();

                if ($t.attr('data-name') == 'OBJECT') {
                    var val = $t.tokenInput('get'),
                        $targetLink = $('#fa-link-object-rs');
                    if (val.length) {
                        $targetLink.attr('href', 'tabInfo.action?tab=CARD$CARD_OBJ&tab2=CARD_OBJ_TAB&documentId=' + val[0].id);
                    } else {
                        $targetLink.removeAttr('href');
                    }
                }

                if ($t.is($appOrg)) { //calc inn and ogrn
                    var orgList = $t.data('tokenInputObject').selectedItems;
                    if (orgList.length) {
                        var orgExtraFields = orgList[0].extraFields;
                        $appInn.val(orgExtraFields.inn);
                        $appOgrn.val(orgExtraFields.ogrn);
                    } else {
                        $appInn.val('');
                        $appOgrn.val('');
                    }
                    console.log('Start calc INN and OGRN');
                }
                if ($t.is($appInn) || $t.is($appOgrn)) { //calc organization
                    var inn = $appInn.val(), ogrn = $appOgrn.val();
                    if (inn && ogrn) {
                        var apppOrgSettings = $appOrg.data('tokenInputSettings');
                        //TODO AJAX-запрос для получения orgId
                        $.ajax(apppOrgSettings.url, {
                            data: {term: inn + '%' + ogrn},
                            success: function(data) {
                                if (data.split) data = JSON.parse(data);
                                if (data[0]) $appOrg.tokenInput('clear').tokenInput('add', data[0].objectId);
                            }
                        });
                    } else {
                        //не заполнены поля для расчета...
                    }
                    console.log('Start calc organization');
                }

                if ($t.attr('data-name') == 'ADDRESS_ID') {
                    var val = $t.tokenInput('get'),
                        selectedItems = $t.data('tokenInputObject').selectedItems,
                        addrId = val.length ? val[0].id : 'NULL',
                        $inputDistPref = $('[data-name="DIST_PREF_ID"]');

                    $inputDistPref.tokenInput('setParam', {
                        paramNames: 'omkymId',
                        parameters: addrId
                    });

                    if (selectedItems.length) {
                        var extraFields = selectedItems[0].extraFields;
                        if (extraFields && extraFields.omkte_id) {
                            $inputDistPref.tokenInput('clear', false).tokenInput('add', extraFields.omkte_id);
                        }
                    } else {
                        $inputDistPref.tokenInput('clear', false);
                    }
                }

                if ($t.attr('name') == 'APPEAL_DATE' || $t.attr('name') == 'DEADLINE_DAYS_TYPE' || $t.attr('name') == 'DAYS_TO_DEADLINE') {
                    if (window.debug) debugger;
                    updateDeadlineDate();
                }

                if (name == 'PHONE' || name == 'EMAIL') {
                    checkChangeContact();
                }
            });

            $('form#formWrapper').submit(function() {
                if (!checkForm()) {
                    enableButtons();
                    return false;
                }
                $.ajax(this.action, {
                    type: 'POST',
                    data: {
                        XML: makeXML(),
                        ID: $(':input[name="ID"]').val(),
                        EXECUTOR_2LINE: $('[name="EXECUTOR_2LINE"]').val()
                    },
                    success: function(data) {
                        console.log('Data:', data);
                        try {
                            if (data.split) data = JSON.parse(data);
                            switch(data.status) {
                                case 'error':
                                    alert(data.msg);
                                    break;

                                default:
                                    if (data.url) {
                                        if (window.opener) {
                                            window.opener.location.href = data.url;
                                            window.close();
                                        } else {
                                            alert('Данные успешно сохранены');
                                        }
                                    }
                                    break;
                            }
                        } catch(e) {
                            console.log(e);
                        }
                        enableButtons();
                    },
                    error: function(xhr, eType, eText) {
                        alert(eText);
                        enableButtons();
                    }
                });
                return false;
            });
            $('.fa-button-primary').click(function(e) {
                if (buttonsIsDisabled()) return false;
                disableButtons();
                $('form#formWrapper').attr('action', actions.save).trigger('submit');
                return false;
            });
            $('.fa-button-two-line').ricosDrop({
                margin: 15
            });
            /*.click(function() {
                $('form#formWrapper').attr('action', actions.save2line).trigger('submit');
                return false;
            });*/
            $('.fa-button-close-appeal').click(function() {
                if ($(this).hasClass('disabled') || buttonsIsDisabled()) {
                    return false;
                }
                disableButtons();
                $('form#formWrapper').attr('action', actions.close).trigger('submit');
                return false;
            });

            //init right sidebar
            $('#rightSideBar')//.empty()
                //.html($('#rightSideBarTemplate').html())
                .append('<div class="grip showed"></div>')
                .on('click', '.grip', function() {
                    var $t = $(this);

                    if ($t.hasClass('showed')) {
                        $t.removeClass('showed').closest('#rightSideBar').addClass('minimized').stop().animate({marginRight: -402}, 500);
                    } else {
                        $t.addClass('showed').closest('#rightSideBar').removeClass('minimized').stop().animate({marginRight: 0}, 500);
                    }
                })
                .on('update', function(e, params) {
                    getSideBlockData(params || {});
                    /*Возможные параметры:
                      - documentId
                      - firstName
                      - lastName
                      - phone
                      - email
                      - org
                      - appealType
                      - tag
                    */
                });

                $('body')
                    .on('click', '.fa-popup-executors [data-id]', function() {
                        var $t = $(this);

                        $('.fa-popup-executors .selected').removeClass('selected');
                        $t.addClass('selected');
                    })
                    .on('click', '.fa-popup-executors .fa-button-change', function() {
                        var val = $('.fa-popup-executors [data-id].selected').attr('data-id');
                        if (!val) return false;
                        $('[name="EXECUTOR_2LINE"]').val(val);
                        $('form#formWrapper').attr('action', actions.save2line).trigger('submit');
                    });

                updateStatusCloseButton(); //lock/unlock close button

                checkChangeContact();

                setTimeout(function() {
                    $('#rightSideBar').trigger('update', _makeSidebarParams())
                }, 1000);

                function _makeSidebarParams() {
                    var params = {};
                    params.documentId = $(':input[name="ID"]').val() || '';
                    params.firstName = $(':input[name="FIRST_NAME"]').val() || '';
                    params.lastName = $(':input[name="LAST_NAME"]').val() || '';
                    params.phone = $(':input[name="PHONE"]').val() || '';
                    params.email = $(':input[name="EMAIL"]').val() || '';
                    params.org = (function() {
                        var applicantOrg = $(':input.applicantOrg').tokenInput('get');
                        var complainOrg = $(':input.complainOrg').tokenInput('get');
                        return applicantOrg.length ? applicantOrg[0].id : complainOrg.length ? complainOrg[0].id : '';
                    })();
                    params.tag = (function() {
                        var tags = $(':input.tagList').tokenInput('get');
                        var arr = [];
                        for (var i=0; i<tags.length; i++) {
                            arr.push(tags[i].id);
                        }
                        return arr || '';
                    })();
                    params.appealType = $('[name="APPEAL_TYPE_NICK"]:checked').val() || '';
                    return params;
                }

        });

function checkChangeContact() {
    var phone = $(':input[name="PHONE"]').val(),
        email = $(':input[name="EMAIL"]').val();
    if (!phone && !email) return makeContactList();
    $.ajax('submit/simpleSubmit.action?action=contact_center.calc_participants', {
        data: {
            PHONE: $(':input[name="PHONE"]').val(),
            EMAIL: $(':input[name="EMAIL"]').val()
        },
        success: function(data) {
            if (data.split) data = JSON.parse(data);
            makeContactList(data);
        },
        error: function(xhr, eType, eText) {
            console.log(eText);
        }
    });
}
function makeContactList(data) {
    if (!data) data = [];
    changeContactList = data;
    var $iconBlock = $('.fa-change-contact');
    var $listWrapper = $('.fa-change-contact-list');
    var html = '';

    if (data.length) {
        $iconBlock.show();
        html += '<div style="padding: 0 30px 5px;">Возможные заявители:</div>';
        for (var i=0; i<data.length; i++) {
            html += '<div class="fa-change-contact-item">';

            if (data[i]['last_name']) html += data[i]['last_name'] + ' ';
            if (data[i]['first_name']) html += data[i]['first_name'] + ' ';
            if (data[i]['middle_name']) html += data[i]['middle_name'];

            if (data[i]['email']) html += '<div class="smallText">' + data[i]['email'] + '</div>';
            if (data[i]['phone']) html += '<div class="smallText">' + data[i]['phone'] + '</div>';

            html += '<div class="fa-change-contact-button" onclick="fillContactInfo(' + i + ');"><span>Выбрать<span></div>';

            html += '</div>';
        }

        $listWrapper.html(html);
    } else {
        $iconBlock.hide();
    }
}

function fillContactInfo(index) {
    var contInfo = changeContactList[index] || {};
    for (var p in contInfo) if (contInfo.hasOwnProperty(p)) {
        $(':input[name="' + p.toUpperCase() + '"]').val(contInfo[p]);
    }
    $('.fa-change-contact').ricosDrop('close');
}

function buttonsIsDisabled() {
    return $('.fa-button-bar').hasClass('disabled');
}
function disableButtons() {
    $('.fa-button-bar').addClass('disabled');
}
function enableButtons() {
    $('.fa-button-bar').removeClass('disabled');
}

function updateStatusCloseButton() {
    var $closeButton = $('.fa-button-close-appeal');
     if (checkForClose()) {
        $closeButton.removeClass('disabled');
     } else {
        $closeButton.addClass('disabled');
     }
}
function checkForClose() {
    var r = true;

    r = r && !!$('.js_appeal_type :input:checked').length; //Тип обращения
    r = r && !!$('[name="APPEAL_ANSWER"]').val().trim(); //Ответ оператора

    return r;
}

function checkForm() {
    var err = '';
    $('.required').each(function() {
        var $field = $(':input[name]', this),
		    val = null,
        labelText = $('label:first', this).html();

	      if ($field.length > 1) {
		        $field.each(function() {
			          var $t = $(this);
			          if ($t.attr('type') == 'radio') {
				            if ($t.is(':checked')) val = $t.val();
                } else if ($t.closest('.token-input-list').length) {
				            if (!val) val = [];
				            val.push($t.val());
                }
            });
        } else {
		        val = $field.val();
        }
	      if (!val) {
            $(this).addClass('redField');
            err += "\n" + ' - ' + labelText;
        }
    });

    var phoneOrEmail = $('[name="PHONE"]').val() + $('[name="EMAIL"]').val();
    if (!phoneOrEmail) {
        err += "\n" + ' - Телефон или email';
    }

    if (err) {
        alert('Не заполнены обязательные поля:' + err);
        return false;
    }
    return true;
}

function makeXML() {
    var xml = {
				    name: 'APPEAL',
				    content: '',
				    tags: {}
        };
    $(':input[name]').each(function() {
				var $t = $(this),
					  name = $t.attr('name'),
					  type = $t.attr('type'),
					  addXmlTag = function(val) {
                var wrp = xml;

						    if ($t.closest('[xmlTag]').length) {
							      var wrpName = $t.closest('[xmlTag]').attr('xmlTag');
							      if (!xml.tags[wrpName]) xml.tags[wrpName] = {content: ''};
							      wrp = xml.tags[wrpName];
						    }

						    /*if (name == 'MANAGEMENT') {
							      var roleName = $t.data('roleName'), roleVal = $t.data('role');
							      val = '<' + roleName + '>' + roleVal + '</' + roleName + '>' +
								          '<OSHS_PERSON_ID>' + val + '</OSHS_PERSON_ID>';
						    }*/

						    if (name == 'OBJECT' || name == 'LABEL') {
							      val = '<ID>' + val + '</ID>';
						    }

						    wrp.content += '<' + name + '>' + val + '</' + name + '>';
					  };

				switch(type) {
					  case 'radio':
						    if ($t.is(':checked'))
							      addXmlTag($t.val());
						    break;

					  case 'text':
						    addXmlTag($t.val());
						    break;

					  case 'hidden':
						    if ($t.closest('.token-input-list').length) { //Это мультиселект. Можно обработать как-то по-другому
							      addXmlTag($t.val());
						    } else {
							      addXmlTag($t.val());
						    }
						    break;

            default:
						    addXmlTag($t.val());
						    break;
        }
    });

    for (var p in xml.tags) if (xml.tags.hasOwnProperty(p)) {
				xml.content += '<' + p + '>' + xml.tags[p].content + '</' + p + '>';
    }

    if (xml.name) xml.content = '<' + xml.name + '>' + xml.content + '</' + xml.name + '>';

    return xml.content;
}
function postDeleteToken($input, item) {
    if ($input.attr('data-name') == 'ADDRESS_ID' && !$input.tokenInput('get').length) {
        $('[data-name="DIST_PREF_ID"]').tokenInput('clear', false);
    }
}
function updateDeadlineDate() {
    var params = {
            DEADLINE_DAYS_TYPE: $('[name="DEADLINE_DAYS_TYPE"]:checked').val(),
            DAYS_TO_DEADLINE: $('[name="DAYS_TO_DEADLINE"]').val(),
            APPEAL_DATE: $('[name="APPEAL_DATE"]').val()
        },
        $target = $('[name="DEADLINE_DATE"]');

    $.ajax('/ugd/submit/simpleSubmit.action?action=contact_center.get_deadline_date', {
        data: params,
        success: function(data) {
            try {
                data = JSON.parse(data);
                $target.val(data.deadline_date);
            } catch(e) {}
        },
        error: function(xhr, eType, eText) {
            console.log(eText);
        }
    });
}


(function(){
var a = document.querySelector('#rightSideBar'), b = null, K = null, Z = 0, P = 0, N = 0;  // если у P ноль заменить на число, то блок будет прилипать до того, как верхний край окна браузера дойдёт до верхнего края элемента, если у N — нижний край дойдёт до нижнего края элемента. Может быть отрицательным числом
window.addEventListener('scroll', Ascroll, false);
document.body.addEventListener('scroll', Ascroll, false);
function Ascroll() {
  var Ra = a.getBoundingClientRect(),
      R1bottom = document.querySelector('.fa-container').getBoundingClientRect().bottom;
  if (window.debug) debugger;
  if (Ra.bottom < R1bottom) {
    if (b == null) {
      var Sa = getComputedStyle(a, ''), s = '';
      for (var i = 0; i < Sa.length; i++) {
        if (Sa[i].indexOf('overflow') == 0 || Sa[i].indexOf('padding') == 0 || Sa[i].indexOf('border') == 0 || Sa[i].indexOf('outline') == 0 || Sa[i].indexOf('box-shadow') == 0 || Sa[i].indexOf('background') == 0) {
          s += Sa[i] + ': ' +Sa.getPropertyValue(Sa[i]) + '; '
        }
      }
      b = document.createElement('div');
      b.className = "stop";
      b.style.cssText = s + ' box-sizing: border-box; width: ' + a.offsetWidth + 'px;';
      a.insertBefore(b, a.firstChild);
      var l = a.childNodes.length;
      for (var i = 1; i < l; i++) {
        b.appendChild(a.childNodes[1]);
      }
      a.style.height = b.getBoundingClientRect().height + 'px';
      a.style.padding = '0';
      a.style.border = '0';
    }
    var Rb = b.getBoundingClientRect(),
        Rh = Ra.top + Rb.height,
        W = window.innerHeight, //document.documentElement.clientHeight,
        R1 = Math.round(Rh - R1bottom),
        R2 = Math.round(Rh - W);
    if (Rb.height > W) {
      if (Ra.top < K) {  // скролл вниз
        if (R2 + N > R1) {  // не дойти до низа
          if (Rb.bottom - W + N <= 0) {  // подцепиться
            b.className = 'sticky';
            b.style.top = W - Rb.height - N + 'px';
            Z = N + Ra.top + Rb.height - W;
          } else {
            b.className = 'stop';
            b.style.top = - Z + 'px';
          }
        } else {
          b.className = 'stop';
          b.style.top = - R1 +'px';
          Z = R1;
        }
      } else {  // скролл вверх
        if (Ra.top - P < 0) {  // не дойти до верха
          if (Rb.top - P >= 0) {  // подцепиться
            b.className = 'sticky';
            b.style.top = P + 'px';
            Z = Ra.top - P;
          } else {
            b.className = 'stop';
            b.style.top = - Z + 'px';
          }
        } else {
          b.className = '';
          b.style.top = '';
          Z = 0;
        }
      }
      K = Ra.top;
    } else {
      if ((Ra.top - P) <= 0) {
        if ((Ra.top - P) <= R1) {
          b.className = 'stop';
          b.style.top = - R1 +'px';
        } else {
          b.className = 'sticky';
          b.style.top = P + 'px';
        }
      } else {
        b.className = '';
        b.style.top = '';
      }
    }
    window.addEventListener('resize', function() {
      a.children[0].style.width = getComputedStyle(a, '').width
    }, false);
  }
}
})()
    ]]></script>
</xsl:template>
{B{FORM$APPEAL$APPOINT_EXECUTOR_TMPL}E}
</xsl:stylesheet>
