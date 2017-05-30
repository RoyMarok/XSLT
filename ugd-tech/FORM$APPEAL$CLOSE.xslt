<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="no"/>
<xsl:template match="/">
    <!-- recomment window size: 800 x 300 -->
    <xsl:variable name="DATA" select="//SESSION_TEMP_PARAMETERS/ROW_SET"/>
    <XML class="APPEAL_CLOSE" style="display: none;"><xsl:copy-of select="*"/></XML>
    <link rel="stylesheet" href="/static/typeForm/css/form.css"/>
    <link rel="stylesheet" href="/portal_static/css/form-customize.css"/>
    
    <style>
        body {
            margin: 0;
            font-family: 'PTSans', Arial, sans-serif;
            background-color: #fff;
        }
        .fa-wrapper {
            width: 100%;
            display: -webkit-flex;
            display: -ms-flex;
            display: flex;
            font-size: 16px;
        }


        .fa-container {
            margin: 10px auto;
        }


        .fa-container .formWrapper {
            min-height: inherit;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }
        .gray {
            color: #bbb;
        }


        .fa-body {
            padding-top: 10px;
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
            width: 100%;
        }
        .fa-button-bar-left {
            display: table-cell;
            text-align: left;
            padding-left: 180px;
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
          width: 180px;
          display: inline-block;
          text-align: right;
          padding-right: 15px;
        }
        .control-group .input-default {
          width: 450px;
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

        .control-group textarea,
        .control-group .textarea {
            border: 1px solid #bcbcbc;
            min-height: 110px;
            width: 450px;
            padding: 7px 7px 7px 10px;
            font-family: 'PTSans', Arial, sans-serif;
            resize: vertical;
            border-radius: 2px;
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

        .fa-container .formWrapper input {
            font-size: 13px;
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
          margin-left: 180px;
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
        
        .required &gt; label:not(.button):first-child:before {
            content: ' * ';
            display: inline;
            color: red;
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
            <form action="submit/simpleSubmit.action?action=contact_center.complete_appeal_card" method="POST" class="formWrapper" id="formWrapper">
                <input type="hidden" name="APPEAL_ID" value="{$DATA/ROW[NAME='DOCUMENT_ID']/VALUE}"/>
                
                <div class="fa-body">
                    <xsl:variable name="appealType" select="$DATA/ROW[NAME='APPEAL_TYPE']/VALUE"/>
                    <div class="control-group button-group btn-appeal-group js_appeal_type">
                        <xsl:for-each select="//CC_CALL_APPEAL_TYPE//TYPES/TYPE">
                            <xsl:variable name="typeId" select="NICK"/>
                            <xsl:variable name="className">button
                                <xsl:if test="$appealType = $typeId or TYPE[NICK=$appealType] != ''">
                                    active
                                </xsl:if>
                            </xsl:variable>
                            <label class="{$className}" data-type-id="{ID}">
                                <i><img src="/portal_static/img/icons/contact_center/{ICON_INACTIVE}" class="inactive"/><!--
                                --><img src="/portal_static/img/icons/contact_center/{ICON_ACTIVE}" class="active"/><!--
                                --></i><xsl:value-of select="NAME"/><span style="display: none;">
                                <input type="radio" value="{NICK}">
                                    <xsl:if test="$appealType = $typeId or TYPE[NICK=$appealType] != ''">
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
                                        <input type="radio" name="APPEAL_TYPE" value="{NICK}">
                                            <xsl:if test="$appealType = $typeId">
                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                            </xsl:if>
                                        </input>
                                        <div class="control__indicator"></div>
                                    </label>
                                </div>
                            </xsl:for-each>
                        </div>
                    </xsl:for-each>
                </div>
                
                

                <div class="control-group text-group required">
                    <label>Ответ оператора</label>
                    <textarea name="ANSWER"><xsl:value-of select="//CC_APPEAL_ANSWER//ANSWER"/></textarea>
                </div>
                
                <div class="fa-button-bar">
                    <div class="fa-button-bar-right">
                        <button type="button" class="fa-button fa-button-primary">Сохранить</button>
                    </div>
                </div>
                  
            </form>
        </div>
    </div>

<script src="/static/HSF/latest/hsf.js"></script>
<script src="js/spbren/configuration.js"></script>
<script src="/static/JQuery/1.8.3/jquery.min.js"></script>
    
<script type="text/javascript"><![CDATA[
var $triggerBtn = $('.button-group button, .button-group .button');
var $triggerAppealType = $('.js_appeal_type button, .js_appeal_type .button');

$(function() {

    $triggerBtn.on('click', function(e){
        $(this).addClass('active').siblings().removeClass('active');
    });

    //Показать/скрыть блоки полей "тип обращения"
    $triggerAppealType.on('click', function() {
        var val = $(this).find('input').val(),
            $groups = $('.js_appeal_type_ext').hide();

        $groups.filter('.js_appeal_type_' + val).show();
    });
    var $activeAppealType = $triggerAppealType.filter('.active');
    $activeAppealType.click();
    
    $('form#formWrapper').submit(function() {
        if (!checkForm()) return false;
        $.ajax(this.action, {
            type: 'POST',
            data: $('form#formWrapper').serialize(),
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
            },
            error: function(xhr, eType, eText) {
                alert(eText);
            }
        });
        return false;
    });
    $('.fa-button-primary').click(function(e) {
        $('form#formWrapper').trigger('submit');
        return false;
    });
});

function checkForm() {
    var err = '';
    if (!$('[name="APPEAL_TYPE"]:checked').length) {
        err += "\n" + ' - Тип обращения';
    }
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
]]></script>
    
</xsl:template>
</xsl:stylesheet>