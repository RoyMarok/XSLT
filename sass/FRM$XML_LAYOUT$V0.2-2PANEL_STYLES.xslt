<style type="text/css">
	 strong {
                font-weight: bold;
            }
            .frmAppeal_main{
                margin: 0 auto;
                width: 1170px;
                font-family: 'PTSans', "Helvetica CY", "Nimbus Sans L", sans-serif;
            }
            body{
                background-color: #ecedf1;
            }
            .frmAppeal_steps {
        background-color: #26374A;
        background-color: #ecedf1;
        padding: 30px 0;
        width: 319px;
        position: absolute;
        position: fixed;
        top: 0;
                color: #333;
      }
            ol { counter-reset: list; }
            .frmAppeal_steps ol li {
                font-size: 14px;
                position: relative;
                padding-left: 43px;
                padding-left: 48px;
                height: 24px;
                line-height: 25px;
                /*margin: 24px 0 24px 29px;*/
                cursor: default;
                cursor: pointer;
                margin-right: 4px;
                height: 36px;
                padding-top: 6px;
                border-radius: 3px;
                transition: all .3s;
            }
            .frmAppeal_steps li:hover{
                background: #f2f6fa;
            }

            .frmAppeal_steps li:before{
                width: 20px;
                height: 20px;
                /*padding-left: 1px;*/
                display: block;
                position: absolute;
                left: 0;
                text-align: center;
                border-radius: 50%;
                top: 50%;
                margin-top: -12px;
                background: #fff;
                background: #98b1c7;
                color: #26374A;
                content: counter(list);
                counter-increment: list;
                display: inline-block;
                /*margin-right: 20px;*/
                /*color: #0092FF;*/
                color: #ECEDF1;
                border: 2px solid #98b1c7;
                z-index: 200;
                margin-left: 13px;
                line-height: 20px;
                transition: all .3s;
            }
            .frmAppeal_steps li:not(:last-child):after{
                content: '';
                display: block;
                position: absolute;
                width: 4px;
                height: 16px;
                background: #98b1c7;
                margin-left: -25px;
                margin-top: -2px;
                z-index: 100;
                transition: all .3s;
            }

            .frmAppeal_steps li.frmAppeal_steps__checked{

            }
            .frmAppeal_steps li.frmAppeal_steps__checked:before{
                background: #0092FF;
                border: 2px solid #0092FF;
                color: #fff;
            }
            .frmAppeal_steps li.frmAppeal_steps__checked:after{
                background: #0092FF;

            }
            .frmAppeal_steps li.frmAppeal_steps__current{
                color: #0092FF;
            }
            .frmAppeal_steps li.frmAppeal_steps__current:before{
                background: #fff;
                border: 2px solid #0092FF;
                color: #0092FF;
            }
            .frmAppeal_steps li.frmAppeal_steps__current:after{
                background: #0092FF;
            }

            .frmAppeal_steps li.frmAppeal_steps__error:before{
                background-color: #dc3131;
                border-color: #dc3131;
                color: white;
            }
            .frmAppeal_steps li.frmAppeal_steps__error:after{
                background-color: #dc3131;
            }
            .frmAppeal_steps li.frmAppeal_steps__current.frmAppeal_steps__error{
                color: #dc3131;
            }
            .frmAppeal_steps li.frmAppeal_steps__current.frmAppeal_steps__error:before{
                background-color: white;
                color: #dc3131;
            }

            .frmAppeal_content {
                width: 850px;
                margin-left: 319px;
                background-color: #fff;
                border-radius: 5px;
                border-width: 1px;
                border-style: solid;
                border-color: rgba(215, 216, 219, 1);
                overflow: hidden;
                position: relative;
      }


            .formWrapper form{
                margin: 0;
            }
            .formWrapper{
                padding: 0 20px;
                min-height: 0;
            }


            .line .inputName{
                font-size: 14px;
            }
            input{
                border-radius: 2px;
            }
            .line input.form_button.afterClose{
                margin-left: -38px;
                background: transparent;
                color: #D9DBDD;
                border-left: 1px solid #D9DBDD;
                border-radius: 0;
                font-size: 16px;
                border-bottom-right-radius: 2px;
                border-top-right-radius: 2px;
            }
            .line input.form_button.afterClose:hover{
                color: #0092FF;
                background: transparent;
                border: 1px solid #0092FF;
            }
            .line.medium input, .line.medium select, .line.medium textarea, .line.medium .customSelect, .line.medium .gradWrapper, .line.medium .fileInputWrapper, .line.medium .tokenWrapper{
                width: 268px;
                width: 250px;
            }
            .line.medium .tokenWrapper{
                width: 250px!important;
            }
            .line .inputWrap label{
                margin: 0 5px;
            }
            .line input, .line select, .line .fileInputWrapper{
                height: 34px;
            }
            .folderWrapper .folderContainer, .line .gradWrapper, .line .curSelect, .line .fileInputWrapper, .formWrapper ul.token-input-list, .line input, .line textarea{
                border-radius: 2px;
            }
            .line.full input, .line.full select, .line.full textarea, .line.full .customSelect, .line.full .gradWrapper, .line.full .fileInputWrapper, .line.full .tokenWrapper{
                width: 512px;
                width: 546px;
            }
            .line.small input, .line.small select, .line.small textarea, .line.small .customSelect, .line.small .gradWrapper, .line.small .fileInputWrapper, .line.small .tokenWrapper{
                width: 140px;
                width: 150px;
            }

            .line.ultra_small input, .line.ultra_small select, .line.ultra_small textarea, .line.ultra_small .customSelect, .line.ultra_small .gradWrapper, .line.ultra_small .fileInputWrapper, .line.ultra_small .tokenWrapper{
                width: 40px;
            }
            .line.some_inline .inputWrap label{
                width: 55px;
                text-align: right;
                margin-right: 13px;
            }
            .line .inputWrap input.date + img, .line .inputWrap input.timeInput + img{
                padding: 8px;
                border-radius: 0 2px 2px 0;
            }
            .line .inputWrap input.date, .line .inputWrap input.timeInput{
                border-radius: 2px 0 0 2px;
            }
            ._token_input_wrapper{
                display: inline-block;
            }
            .line label{
                font-size: 14px;
            }
            form .header h1 span{
                background: none;
                padding-left: 0;
                color: #98B1C7;
                font-size: 20px;
            }/*
            .steps:not(.active){
                display: none;
            }*/
            .radioGroup_list.line.radio label.labelFloat {
                float: none;
                display: block;
                margin-left: 0;
                white-space: normal;
                padding-left: 27px;
                text-indent: -25px;
            }
            .radioGroup_list.line.radio label.labelFloat + label.labelFloat{
                margin-left: 0;
            }
            ul.token-input-list{

            }
            .hidden{
                display: none;

            }
            h3.header{
                font-weight: normal;
                font-size: 20px;
                margin-left: 250px;
                position: relative;
                width: 546px;
                display: inline-block;
                margin-bottom: 20px;
            }
            h3.header:before{
                content: '';
                position: absolute;
                width: 850px;
                height: 1px;
                background: #d7d8db;
                margin-left: -270px;
                margin-top: 15px;
            }
            h3.header span{
                background-color: white;
                padding: 0 10px;
                z-index: 20;
                width: 546px;
                position: relative;
            }
            .line.info{
                font-style: italic;
                margin-top: 0;
                color: gray;
            }
            .line textarea {
                height: 32px;
            }
            .customSelect .curSelect{
                height: 32px;
            }
            .line.grey_block{
                width: 808px;
                padding: 20px;
            }
            .grey_block{
                background-color: #f2f6fa;
                border-radius: 3px;
                padding: 20px;
            }
            .grey_block+.grey_block{
                margin-top: 20px;
            }
            .grey_block .line{
                width: 768px;
            }
            .grey_block .line .inputName{
                width: 197px;
            }
            .grey_block .line .inputWrap{
                margin-left: 210px;
            }
            .grey_block .line.medium input,
            .grey_block .line.medium select,
            .grey_block .line.medium textarea,
            .grey_block .line.medium .customSelect,
            .grey_block .line.medium .gradWrapper,
            .grey_block .line.medium .fileInputWrapper,
            .grey_block .line.medium .tokenWrapper{
                width: 245px;
            }
            .top_label_cell{
                display: inline-block;
                margin-right: 10px;
                margin-bottom: 10px;
            }
            .top_label_cell:last-child{
                margin-right: 0;
            }
            .top_label_cell.small, .top_label_cell.small input{
                width: 150px;
            }
            .top_label_cell.medium, .top_label_cell.medium .token-input-list{
                width: 270px;
            }
            .line.narrow{
                width: 748px;
                margin-left: auto;
                margin-right: auto;
            }
            .line .top_label{
                font-size: 14px;
                margin-bottom: 10px;
            }
            .line input.form_button{
                width: auto;
                padding: 0 10px;
                margin-left: 10px;
                background: #319adc;
                background: #0086bd;
                background: white;
                font-weight: normal;
                font-size: 14px;
                border: 0;
                text-shadow: none;
                line-height: 32px;
                text-align: center;
                color: white;
                cursor: pointer;
                transition: all .3s ease;
                color: #333;
                border: 1px solid #D9DBDD;
            }
            .line input.form_button:first-child{
                margin-left: 0;
            }
            .line input.form_button:hover{
                background: #44b2f7;
                background: #0086bd;
                border: 1px solid #0086bd;
                transition: all .3s ease;
                color: white;
            }
           .related_checkboxes{
              margin-top: 10px;
              }
          .related_checkboxes.hidden_box .checkbox-wrap{
            display: none;
          }
          .sectionContainer {
                position: relative;
            }
            .sectionContainer.sectionEmpty {

            }
            .sectionCaption{
                display: none;
            }

            .sectionBtnAdd,
            .sectionBtnDelete {
                display: inline-block;
                width: auto;
                float: none;
                background: none;
                border: none;
                cursor: pointer;
                padding-left: 1.5rem;
                font-size: 1rem;
                outline: none;
            }
            .sectionBtnAdd {
               /* position: absolute;
                bottom: 5px;
                left: 840px;*/
                position: relative;
                margin-right: 0;
                color: #1976D2;
            }
            .sectionBtnAdd:hover {
                color: #0D47A1;
            }
            .sectionContainer.sectionEmpty .sectionBtnAdd {
               /* left: 654px;*/
            }
            .sectionBtnDelete {
                float: none;
                /*margin-left: 250px;*/
                color: #d32f2f;
                position: relative;
            }
            .sectionBtnDelete:hover {
                color: #b71c1c;
                cursor: pointer;
            }
            .sectionBtnAdd:before,
            .sectionBtnDelete:before {

                display: inline-block;
                position: absolute;
                height: 31px;
                left: 0;
                top: -.5rem;
                font-size: 1.9rem;
            }
            .sectionBtnDelete:before{
                content: '\00d7';

            }
            .sectionBtnAdd:before{
                content: '+';
            }
            .wrapTable .sectionBtnAdd:before,
            .wrapTable .sectionBtnDelete:before{
                display: none;
            }
            .wrapTable .sectionBtnDelete,
            .wrapTable .sectionBtnAdd{
                margin: 0;
                padding: 0;
                left: 0;
            }

            .line .customSelect{
                width: 100%;
                height: 30px;
                border-radius: 2px;
            }
            .double_line .inputName{
                line-height: 14px;
            }
            .line.double_line.required .inputName strong{
                line-height: inherit;
            }
            .redStar strong{
                color: red;
                display: inline-block;
                font-size: 100%;
                font-weight: normal;
                margin: 0 4px;
                vertical-align: baseline;
            }

            .line.checkbox .overTrop{
                background-color: white;
            }

            a.link_img, a.link_img:visited{
                display: inline-block;
                position: relative;
                text-decoration: none;
                border-bottom: 1px dashed #cddada;
                margin-right: 25px;
                margin-left: 25px;
                line-height: 18px;
                color: #016AE5;
                transition: all .3s ease;
            }
            a.link_img:hover{
                color: #d04001;
                transition: all .3s ease;
            }

            .link_img:before{
                content: '';
                display: block;
                position: absolute;
                width: 18px;
                height: 17px;
                margin-left: -25px;
                background-repeat: no-repeat;
                margin-top: 2px;
            }
            .loadLink:before{
                background-image:  url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAM1BMVEUAAACysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrJzoZZyAAAAEHRSTlMA8igfsPniw7ypGZmYSAMFUZyiiAAAAF5JREFUGNO1yckNhFAMBFG3/XeWqfyjHYQFGVCyfHhtV16k4ma9250LQG6QUChrXe8FsXpf6AXI+xYqZyWoJzWh4QMYTkvYmDE0YrIlhJj+84nCskMA6LCn2Ftte+5/dSoGdVEjI8sAAAAASUVORK5CYII=');
            }
            .scanLink:before{
                background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAARCAMAAADnhAzLAAAATlBMVEUAAACxsbGzs7Ovr6+ysrKxsbGysrKxsbGxsbGvr6+ysrKxsbGysrKysrKysrKzs7OwsLCysrKxsbG/v7+xsbGysrKysrKysrKvr6+ysrKBNXn+AAAAGXRSTlMAgEAgwF+P+m8a7effz8ebfHQ2BtenPCgQyZNixgAAAGxJREFUGNN1zkcOgDAQQ1EzhBR6B9//okjDCAUk3vJvbACL422NMDt9oWp6S8ISqiWLT3JkSO90SkV5kin/UhqaPDXbgYHUE8qz6xwCX8aR4Ndv6p3pNQUyW9Q0S8xTlFmvTpWZ7P3S8lEn4AICRQ0NWJl47AAAAABJRU5ErkJggg==');
            }
            .requestLink:before{
                background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAMAAAAMs7fIAAAAUVBMVEUAAACysrKysrKysrKxsbGzs7OqqqqysrKysrKwsLCysrKxsbGxsbGysrKysrKysrKysrKwsLCzs7O/v7+ysrKysrKwsLCysrKysrKvr6+ysrK3wvbJAAAAGnRSTlMAn/WCX0EMwpBV7+fXyatQPDIWBLOnfGQoIDF7fLEAAABpSURBVBjTpc5JEoAgDETRGAziPE99/4NaQCxk7V+l3iLVFJsYqOlbCcD8FStiABQii4rD26CydArtRdrdBuA5fZrZiyTIN4+Fz45cW+evkxr4KruuFUKEWGciqGhNyZvLhA/0O2hAXv8AtSYNc7W6AZYAAAAASUVORK5CYII=');
            }
            .expShower{
                position: relative;
                padding-top: 10px;
            }

            .expShower:before,
            .expShower:after{
                content: '';
                position: absolute;
                width: 850px;
                width: 850px;
                height: 1px;
                background: #d7d8db;
                margin-left: -20px;

            }
            .expShower:before{
                margin-top: -10px;
            }
            .expShower:after{
                margin-top: 0px;
            }
            .expShower:hover:before{
                height: calc(100% + 15px);
                height: 100%;
                border-top: 1px solid #d7d8db;
                background-color: #f7f7f7;
            }

            .expShower .line{
                width: 810px;
            }
            .line{
                width: 810px;
            }
            .wrapTable .rowWrapTable .cellWrapTable{
                border: none;
                border-bottom: 1px solid transparent;
                background-color: transparent;
            }
            .wrapTable .rowWrapTable .cellWrapTable + .cellWrapTable:last-child{
                display: none;
            }
            .wrapTable .sectionBtnAdd {
                float: right;
            }
            .line .inputWrap label.labelFloat:first-child{
                margin-left: 0;
            }

            .formFooter{
                margin-top: 40px;
            }
            .formFooter,
            .formFooter .leftBlock,
            .formFooter .rightBlock{
                position: relative;
                z-index: 100;
            }
            .formFooter:before{
                content: '';
                width: 850px;
                position: absolute;
                height: 200%;
                background-color: #fafbfc;
                border-top: 1px solid #d7d8db;
                z-index: 10;
                margin-left: -20px;
                margin-top: -20px;
            }
            .formFooter .leftBlock,
            .formFooter .rightBlock{
                display: inline-block;
                vertical-align: top;
                line-height: 32px;
            }
            .formFooter .leftBlock{
                width: 225px;
                vertical-align: bottom;
            }

            .formFooter .rightBlock{
                float: right;
                margin-top: -5px;
            }
            .disclaimer{
                display: inline-block;
                width: 300px;
                font-size: 12px;
                line-height: 12px;
                color: #7D8FA4;
                text-align: right;
                padding-top: 8px;
            }
            .formFooter input.form_button{
                width: auto;
                padding: 3px 15px;
                margin-left: 10px;
                background: #319adc;
                background: #0086bd;
                background: white;
                font-weight: normal;
                font-size: 16px;
                border: 0;
                text-shadow: none;
                line-height: 32px;
                text-align: center;
                color: white;
                cursor: pointer;
                transition: all .3s ease;
                color: #333;
                border: 1px solid #D9DBDD;
                vertical-align: top;
            }
            .formFooter input.form_button.nextButton{
                background-color: #319adc;
                border-color: #319adc;
                color: white;
            }
            .formFooter input.form_button:hover{
                background-color: #0092ff;
                border-color: #0092ff;
                color: white;
            }

            .formFooter input.form_button.nextButton.notValidate,
            .formFooter input.form_button.disable
            {
                background-color: #dc3131;
                border-color: #dc3131;
                color: #e47474;
            }
            .formFooter input.form_button.nextButton.notValidate:hover,
            .formFooter input.form_button.disable:hover
            {
                background-color: #c62d2d;
                border-color: #c62d2d;
                color: white;
            }

            .prevButton, .prevButton:visited{
                color: #4364C8;
                border-bottom: 1px solid rgba(67, 100, 200, 0.5);
                transition: all .3s ease;
            }
            .prevButton:hover{
                color: rgb(208, 64, 1);
                border-bottom: 1px solid rgba(208, 64, 1, 1);
                transition: all .3s ease;

            }

            /* to 30px height */
            .token-input-list{
                height: 30px!important;
            }
            .line input, .line select,
            .line .fileInputWrapper,
            .customSelect .curSelect,
            .line textarea
            {
                height: 30px;
            }
            .line input.form_button{
                line-height: 17px;
                height: 30px;
            }
            .line .inputWrap input.date + img, .line .inputWrap input.timeInput + img{
                padding: 6px;
            }.formWrapper ul.token-input-list li.token-input-token{
                padding-top: 0;
                padding-bottom: 0;
            }
            .formWrapper ul.token-input-list li.token-input-token span{
                right: 5px;
                bottom: -1px;
            }
            .expShower .docLinks{
                position: relative;
                padding-bottom: 10px;
                font-size: 12px;
                color: #999;
            }
            .expShower .docLinks a, .expShower .docLinks a:visited{
                color: #999;
                display: inline-block;
                margin-right: 5px;
            }
            .expShower .docLinks a:hover{
                color: rgb(208, 64, 1);
            }
            .expShower:hover .wrapTable .theadAFT .headWrapTable{
                border-bottom: 1px solid #d7d8db;
                background-color: #f7f7f7;
                transition: all .3s ease;
            }
            .expShower:hover .hideAndShow.open{
                color: #999;
                transition: all .3s ease;
            }
            .hideAndShow{
                float: right;
                color: #999;
                color: transparent;
                position: relative;
                font-size: 12px;
                cursor: pointer;
                margin-top: 20px;
                margin-bottom: -20px;
                z-index: 200;
                margin-right: 20px;
                transition: all .3s ease;
            }
            .expShower:hover .hideAndShow.open:hover{
                color: rgb(208, 64, 1);
            }
            .hideAndShow:after{
                content: '';
                color: #969696;
                display: block;
                width: 11px;
                height: 8px;
                transition: all .3s ease;
                background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAAGAgMAAABoXIxrAAAACVBMVEUAAACFhYWFhYVSR9eKAAAAAnRSTlMAZtJCCVUAAAAfSURBVAjXY2BIYWBgXMnAwObmwCDJOIEhBQgnMEgAACi4A7V4a6kfAAAAAElFTkSuQmCC') no-repeat;
                position: absolute;
                right: -20px;
                margin-top: -8px;
                transform: rotate(180deg);
            }

            .expShower:hover .hideAndShow{
                color: transparent;
            }
            .hideAndShow.open:after{
                transform: rotate(0deg);
                transition: all .3s ease;
                transform-origin: 50% 50% 0;
            }
            .line.checkbox input.masked[type="checkbox"]{
                margin-left: 0px;
                margin-top: 5px;
                width: 19px;
                height: 18px;
            }
            .expShower .line.checkBox{
                margin-top: 0;
                padding-top: 0;
            }
            .expShower{
                padding-top: 0;
            }
            .expShower:before{
                margin-top: 0;
            }
            .expShower:after{}
            .fileButton{
                height: 30px;
            }
            .line label, .line span, .line input, .line select, .line textarea, .line br, .line img{
                line-height: 29px;
            }
            .line input.form_button.addNewOrg.pressed{
                background: #44b2f7;
                background: #065c80;
                color: #fff;
            }
            .full_fields_list{
                /*display: none;*/
                margin-top: 15px;
            }

            .line.redField .inputWrap&gt;input[type="text"],
            .line.redField .inputWrap .token-input-list,
            .line.redField .inputWrap .customSelect,
            .line.redField .inputWrap .curSelect,
            .line.redField .inputWrap textarea,
            .line.redField .inputWrap .overTrop,
            .line.redField .inputWrap input[type="text"] + img{
                box-shadow: 0 0 0 2px #fb7979;
                border-color: #d23d3d;
            }
            .hide{
                display: none;
            }

            .fileSign{
                display: none;
            }
            .tep_left{
                display: inline-block;
                vertical-align: top;
                margin-top: 24px;
                margin-right: 5px;
            }
            .tep_right{
                display: inline-block;
                width: 609px;
                vertical-align: top;
            }
            .tep_params{
                display: inline-block;
                width: 609px;
                margin-bottom: 10px;
            }
            .line  .tep_params ul.token-input-list{
                width: 604px;
            }
            .tep_measure{
                display: inline-block;
            }
            .tep_value_before{
                display: inline-block;
            }
            .tep_value_after{
                display: inline-block;
            }
            .tep_note{
                display: inline-block;
                margin-top: 10px;
            }
            .tep_right .label{
                display: inline-block;
                color: #797979;
                height: 30px;
                line-height: 30px;
                margin-right: 10px;
            }
            .tep_right .top_label{
                display: block;
                color: #797979;
            }
            .tep_right .label, .tep_right .top_label{
                font-size: 14px;
            }
            .tep_right .triple, .tep_right .triple input{
                width: 195px;
            }
            .tep_right .triple:not(:last-child){
                margin-right: 5px;
            }
            .tep .readOnly{
                background-color: #f7f7f7;
            }
            .centered {
                text-align: center;
            }
            .centered p{
                width: 560px;
                margin: 0 auto;
                margin-bottom: 20px;
            }
            .selectButton.selectButtonForTree.multiselectLoupe{
                background-image: url(/portal_static/img/searchForm/folder.png);
                width: 16px;
                height: 16px;
                position: absolute;
            }



</style>