<style>
  body {
	background-color: #F7F7F7;
  }
  #tabs-container {
    display: none;
  }
  #tabViewContent {
    overflow: hidden;
    background-color: #EEF2F4;
  }
  .mainpage-content {
    margin-top: -39px;
    position: relative;
    z-index: 2;
  }
  /* mainpage layout */
  .mainpage {
    position: relative;
    min-height: 344px;
  }
  .mainpage-left {
    margin-right: 372px;
  }
  .mainpage-right {
    width: 358px;
    position: absolute;
    right: 0;
    top: 0;
  }

  /* header */

  .mainpage-header-wrapper {
    position: relative;
    width: 100%;
    height: 219px;
    background-color: #fff;
    z-index: 1;
    border-bottom: 1px solid #E4E4E4;
  }
  .mainpage-header-wrapper::before {
    content: '';
    display: block;
    position: absolute;
    background-color: #fff;
    top: 0;
    bottom: -1px;
    z-index: -1;
    border-bottom: 1px solid #E4E4E4;
  }
  .mainpage-header-wrapper::before {
    left: -100%;
    right: -100%;
  }
  .mainpage-header {
    height: 100%;
    overflow: hidden;
  }
  .mainpage-header ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: table;
    table-layout: fixed;
    height: 100%;
    width: 100%;
    position: absolute;
    z-index: 2;
  }
  .mainpage-header ul li {
    display: table-cell;
    vertical-align: top;
    text-align: center;
  }
  .mainpage-header ul li a {
    color: #333;
    text-decoration: none;
    position: relative;
    display: block;
    padding-top: 80px;
    background-repeat: no-repeat;
    background-position: top center;
    width: 125px;
    text-align: center;
    margin: 37px auto 0;
  }
  .mainpage-header ul li a::before {
    content: '';
    width: 100px;
    height: 100px;
    border-radius: 50%;
    background-color: #EEF2F4;
    display: block;
    position: absolute;
    top: -23px;
    left: 50%;
    margin-left: -50px;
    z-index: -1;
  }
  .mainpage-header ul li a span {
    display: block;
    font-size: 16px;
    font-weight: bold;
  }
  .mainpage-header ul li a:hover {
    color: #4364C8;
  }

  /* mainpage menu */
  .mainpage-menu {
    margin: 0 0 15px;
    height: 39px;
  }
  .mainpage-menu ul {
    list-style: none;
    margin: 0;
    padding: 0;
    height: 100%;
  }
  .mainpage-menu li {
    display: inline-block;
    color: #7D8FA4;
    font-size: 16px;
    padding: 0 25px;
    height: 100%;
    line-height: 39px;
  }
  .mainpage-menu li.active {
    color: #235DC1;
    border: 1px solid #E4E4E4;
    border-bottom: 0;
    border-radius: 3px;
    border-bottom-right-radius: 0px;
    border-bottom-left-radius: 0px;
    background-color: #EEF2F4;
  }
  .mainpage-menu li.active a::before {
    opacity: 1;
  }
  .mainpage-menu a {
    color: inherit;
    text-decoration: none;
    position: relative;
  }
  .mainpage-menu a:hover {
    color: #235DC1;
  }
  .mainpage-menu a::before {
    display: inline-block;
    margin-right: 10px;
    position: relative;
    opacity: .4;
  }
  .mainpage-menu a[data-type=tasks]::before {
    content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAQAgMAAACwzR2qAAAACVBMVEUAAAB8j6R8j6Q+d/8qAAAAAnRSTlMA3Pn2U8cAAAAmSURBVAjXY1i1yoEBSExgYFjAsARErAQRqxyABFMDsQTQgFUQAgBsOxa+2G6oXwAAAABJRU5ErkJggg==');
    top: 2px;
  }
  .mainpage-menu a[data-type=request]::before {
  content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQBAMAAADt3eJSAAAAJFBMVEUAAAB8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6R8j6QAuMGqAAAAC3RSTlMAsTIS593SkXtHCLlccysAAAAsSURBVAjXY9gNBUgMBjCgmAEyyxBqMlM0kACJdidBpbcvgDC2TGCAAGEwCQBhQyXE6U5uFQAAAABJRU5ErkJggg==');
    top: 4px;
  }
  .mainpage-menu a[data-type=control]::before {
    content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAQCAYAAADNo/U5AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAGNJREFUeNpirOlf8p8BP7jbXBCtgizAxEAYKNdOWHoHWYAFxgCaxohNB1DDf5hGmI3E2IRhIwse00GAEZtGFkLGIzsb5lRSnEdS6FFHEy4/MdLNef+heID9xEhEKqeO8wACDADr0iDfRd9oCAAAAABJRU5ErkJggg==');
    top: 2px;
  }
  .mainpage-menu li.active a[data-type=tasks]::before {
    content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAQAgMAAACwzR2qAAAACVBMVEUAAAAjXcEjXcHVVDXHAAAAAnRSTlMA3Pn2U8cAAAAmSURBVAjXY1i1yoEBSExgYFjAsARErAQRqxyABFMDsQTQgFUQAgBsOxa+2G6oXwAAAABJRU5ErkJggg==');
  }
  .mainpage-menu li.active a[data-type=request]::before {
    content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQBAMAAADt3eJSAAAAKlBMVEUAAAAjXcEjXcEjXcEjXcEjXcEjXcEjXcEjXcEjXcEjXcEjXcEjXcEjXcFy/RZfAAAADXRSTlMAsQv5593SkXtHMzIVyhNPuAAAACxJREFUCNdjuAsFSAwGMKCYATJLEWoyVyyQAIk2Z0OlrytAGFcmMECADJgEAIdgK6QR1PKmAAAAAElFTkSuQmCC');
  }
  .mainpage-menu li.active a[data-type=control]::before {
    content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAQCAYAAADNo/U5AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAGJJREFUeNpiVI49+J8BP7h7Z5GdCrIAEwNhoKwSd+gOsgAjzCagaYzYdAA1/Ee3kRibMGxkwmU6kg0YGlkIGY/sbKhByqQ4j6TQo44mFkL+oK3z8AQ5nf3EgiWN0SbIAQIMAPiXJ9ZBOAopAAAAAElFTkSuQmCC');

  }
  /*deadline*/
  .deadline {
    background-color: #017fbd;
    border: 1px solid #E4E4E4;
    border-radius: 3px;
    margin-bottom: 10px;
    padding: 10px 15px;
    display: none;
  }
  .deadline h2 {
    display: block;
    margin: 0 0 15px;
    font-size: 16px;
    color: #fff;
    font-weight: 300;
  }
  .deadline h2 a {
    color: #fff;
    border-bottom: 1px dashed #fff;
    text-decoration: none;
  }
  .deadline h2 a:hover {
    color: #fff;
    border-bottom-color: transparent;
  }
  .deadline-items {
    margin-bottom: 20px;
  }
  .deadline-items::before,
  .deadline-items::after {
    content: '';
    display: table;
    clear: both;
  }
  .deadline-item {
    display: inline-block;
    color: #fff;
    text-decoration: none;
    text-align: center;
    width: 33.333333333%;
    float: left;
    border-right: 1px solid #00689D;
  }
  .deadline-item:last-child {
    border-right: none;
  }
  .deadline-item strong {
    display: block;
    font-size: 36px;
    line-height: 40px;
  }
  .deadline-item span {
    font-size: 14px;
  }
  .deadline-item[data-count="0"] {
      cursor: default;
  }

  .deadline-progressbar {
    height: 4px;
    background: #00689D;
    width: 100%;
    clear: both;
  }
  .deadline-progressbar span {
    display: block;
    width: 0;
    height: 100%;
    background: #fff;
    -webkit-transition: width 1s;
    -o-transition: width 1s;
    transition: width 1s;
  }
  /*actions*/
  .my-actions {
    background-color: #fff;
    border: 1px solid #E4E4E4;
    border-radius: 3px;
    margin-bottom: 10px;
  }
  .my-actions h2 {
    display: block;
    background: #017fbd;
    padding: 12px 18px;
    margin: 0 0 15px;
    border-bottom: 1px solid #E4E4E4;
    font-size: 16px;
    font-weight: 300;
    color: #FFF;
  }
  .my-actions-buttons {
    padding: 0 10px 15px;
  }
  .my-actions-buttons .ugdButton {
    margin-top: 19px;
    height: auto;
    display: inline-block;
    padding: 0 0 0 35px;
    cursor: pointer;
    position: relative;
    font-size: 14px;
    line-height: 21px;
    color: #235DC1;
  }
  .my-actions-buttons .ugdButton:hover {
    color: #C00000;
  }
  .my-actions-buttons td > div:first-child {
    margin-top: 0;
  }
  .my-actions-buttons .ugdButton::before {
    content: '';
    display: inline-block;
    width: 30px;
    height: 23px;
    line-height: 21px;
    position: absolute;
    left: 0;
    background-position: center center;
    background-repeat: no-repeat;
  }


  /*Зарегистрировать заявление на утверждение ПД*/
  .my-actions div[id='E1B11A6FF0A14C58BBF873E38053A1E9']::before {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAXCAMAAAA8w5+RAAAAP1BMVEUAAAB7j6N8jqR/j6d7j6N7j6R7j6R8j6R/jaR8jqN7jqJ7j6R7jqN6jqN/ip98j6N8jqR9j6R8jqR6jaJ8j6Q95k3/AAAAFHRSTlMAgN8gQKv3YBPOdO16ZBjXw5uPbEoX1bkAAABxSURBVBjThdBZDoAgDEXROjA6a/e/VoFQfKaJ3j9OQniBouWnEKmExpZNQWaSRl4MG4WOkmrMqjBr98bDObdME+IqSxDJjzlBP9R8Ogjath4wdrW5IQa497UAGAS3v+uXfgg/VRDHrw2xD7Sso1ObuQHaCA57uIdsdwAAAABJRU5ErkJggg==');
  }

  /*Подать заявление на видеомониторинг*/
  .my-actions div[id='7ECC4002290D46CBBA0114226168E7C1']::before {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAZCAMAAAAR624oAAAATlBMVEX///98j6Tx8/Wcq7r4+fve4+j09feHmaz9/f7T2uGotMJ+kaXHz9iLnK6Dlanl6e3W3OO2wMywu8ilssGWpbbr7vHi5uvO1d3M09uPn7H+MnjfAAAAoElEQVQoz6WRRw7EIBAEGZKxCY6b/v/RBWm0M1rCxX2x5BLdhRC/bKcU/egIKbgu3iHnWjt09VDid92i7gJM3Bo4AKVWlInhWvHktFacJ0ItRbsQIsVRgSLWKjCEWgUMUMFw4A3/A5bVPH11WBKWeduHYjDNEe0IOwWQTDFYrDhwmXD+83kIzAuvJvmWpkdCbYYP/lBGmfLRpFblNhZD/AXZjgSn3kqc9wAAAABJRU5ErkJggg==');
    background-size: 80%;
  }

  /*Подать заявку на подключение пользователей*/
  .my-actions div[id='426C2FE56C804D9DA319EF4B83967A60']::before {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAXCAMAAADX9CSSAAAAe1BMVEX///98j6T9/f5+kab6+vt5jaKGl6t0iZ97jqNziJ7w8vS3ws52iqByhp2ClKh4jKHz9vfs7/Lj5+zg5eq9xtGmssGJmq3L09vBytSUo7SPoLKNnbDo7PDQ197FzdeyvcmXprdvhJvW3eOvuseuusart8Sjsb+cq7pnfZUvbV2HAAAA+UlEQVQoz1WQV7LDIAxFBbIpprg7bs+OU9/+VxgYyMScz3PvCAn4Ulw6tdWQQqG1pZQaN6Cpfxh0CH4DetYNEg/qPvV/JgTllI658eD1O3kg6wSJ/fZcvxwYPPI5eTbPozcK6CnoSCCfi3QhZdCPt3XUX18sfpK4AHUkF0gk+hraMXGNn6d1UzsVw2ochLtqgvaK2vZF/OKecTce5bYiJ1ia2QXNy3Iu0C85VO8DsWSrekLNjCDO+npfiIlJ1sDdwsi9DH5fSdUuLeycgPp5/qrIAzKnxALKiDyibfX8v4OSaDoYcWCRAcdsPgaRy54Czc5AsTOydBl8AG4jDYRp+B2ZAAAAAElFTkSuQmCC');
  }

  /*Подать заявку на отключение пользователей*/
  .my-actions div[id='B0445E0194B84CAEB1EBF6537DF4EEE7']::before {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAXCAMAAADX9CSSAAAAdVBMVEX///98j6T9/f5/kaZ5jaJ0iJ/6+vt3iqB6jqOHmKtxhp2ms8Hx8/Xh5eqPn7GJmq319vju8fTr7vHP1t69x9KwvMiTo7S5w8+3wc1ug5vY3uTT2uHL09vFzdfCy9Wjsb+dq7uElqqClKhzh57m6e7k6OyXprc2nUFBAAAA9UlEQVQoz1WPWZaEIAxFAwFBUHCe56rq/S+xFewuuZ/35SQv8Ec+td1cQAiF9BCcC5yBhr5WeCL5APSpP0guUOjQl8oHognXjPz2W3AgqiRxsCZ9jk89eo/cBC0Zu73qgD6ClniYycNCrSvEjsLpr8/NtUlOQE+CD15IxI+f9sk18vW0+OTwHyZLLN23aYMMt8QlSal3zq7y89uuTNi2OYN03TmXro3NNplVMh/7GopdSYL+V50QYd5JyWQMFXfS+brg5DWAVkige/g1QzamOtLcQKck80hxZBpT29dDX8GCNr6xuGRGMRRKU6DRgwyS2hJTRfALJPsNWGmFX0QAAAAASUVORK5CYII=');
  }
  .my-actions div[id='02AA48E672124E86954A566F6230166B']::before {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAXCAYAAADgKtSgAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAgxJREFUeNq0lTtLA0EQgGc2Giz8ARYWlpYWERRsLO0stBDNw8JO0EQjGgOJkEQQ85BYCsGcYKFgaRmLFAqWFiktLSwtlOR2nD1z56lnvDvwIOSyZL+d+XZ2FokI/usR8I9Pn59JiGh8p0qnIcTABv96DrTb+b2t5Sc1btpAP1oUfLdyOgVSXPP74McotQLtzrRawGT61kI6jn2CjSVH9f6+RuagNmQ5V1F4+aSP6lOpYn21sBE5lkDxbznxAv01XxtqqhBCVFNlbb0QD1ck0QoBdayMAMY8w9Pl+mzX8QMTmgKwvFvWsoVE+AQJFswFWPeelYcrcEmbI4RzJLzlSJMo8IonDnVDreQSS3H1H4kwrLKxqsULmEjmWfzF1400MIe5+GLSUuOmWtyADR0k7zyd0HRRW3IDVr5zifCla7iqBC5SrSeY6AWB5n8DOzpXYFUJbO0JCMMA8soJDELO5NejTccD5rShJrjnyfwD7LihFphrWJI+bkTuA/zDeaqoTXTBN4FgcKaQiN5LHaftC9jBmUxtwN5DesJRwEBX0m2n/RZSr/ubiy12tmMH59YiTZVyNht7zSZjRvfr1VW/V8s2t6eG2Ud4YlVFLwVNulXx52WRLp01SFKIS/BF6dnfjLR830Qk4ZW76aNtfIQzeNR1nFd6/PZ89HRB/OLXvPY89Rb7kznShr1G/i7AAGUYLV7hGT72AAAAAElFTkSuQmCC');
  }
  .my-actions div[id='996B63888CDC4BD296241A61AC48D489']::before{
    background-image: url(/portal_static/img/icons/docDown_grey.png);
    background-repeat: no-repeat;
  }
  .output {}

  .request-item,
  .task-item {
  	background-color: #fff;
    border: 1px solid #E4E4E4;
    border-radius: 3px;
    margin-bottom: 10px;
    padding: 12px 100px 12px 24px;
    position: relative;
    font-size: 14px;
  }
  .request-item:hover,
  .task-item:hover {
  	background: #FFFAE6;
  	border-color: #FEEB9F;
  }
  .request-item h2,
  .task-item h2 {
  	margin: 0 0 10px;
  	line-height: 14px;
    font-size: 14px;
    color: #4364C8;
  }
  .request-item h2 a,
  .task-item h2 a {
  	text-decoration: none;
  	color: inherit;
  	font-size: 14px;
  }
  .request-item a,
  .task-item a {
    color: #235DC1;
    text-decoration: none;
  }
  .request-item a:hover,
  .task-item a:hover {
  	color: #C00000;
  }
  .task-item table {
  	margin-top: -7px;
  }
  .task-item table td {
  	vertical-align: top;
  	padding-top: 7px;
  }
  .task-table-label {
  	color: #7D8FA4;
  	width: 60px;
  	font-weight: bold;
  }
  .task-doc-type {
	  background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAALAgMAAADQN0+IAAAACVBMVEV9j6T///++x9Joc+aTAAAAGUlEQVQI12NgkHRgYBACYoEGBgZRII0bAAA2yAGRc+tZGQAAAABJRU5ErkJggg==');
  	background-repeat: no-repeat;
  	background-position: left center;
  	padding-left: 14px;
  }
	.task-date {
		position: absolute;
		right: 16px;
		top: 11px;
		width: 81px;
		text-align: center;
	}
  .request-status {
    position: absolute;
		right: 16px;
		top: 11px;
    font-size: 11px;
    color: #fff;
    border-radius: 2px;
    height: 18px;
  	line-height: 18px;
    padding: 0 5px;
    background-color: #e97600;
  }
  .task-date div {
  	height: 18px;
  	line-height: 18px;
  	border-radius: 2px;
  	color: #fff;
  	font-size: 11px;
  }
  .task-date strong {
    font-size: 16px;
    color: #333;
    margin-bottom: 3px;
   	display: block;
  }
  .task-item.task-expired .task-date div {
    background-color: #C00;
  }
  .task-item.task-today .task-date div {
    background-color: #8BC24A;
  }
  .task-item.task-nextday .task-date div {
    background-color: #0073B6;
  }
  .task-add-favorites {
  	position: absolute;
  	cursor: pointer;
    display: block;
    visibility: hidden;
  	top: 0;
  	width: 12px;
  	height: 12px;
  	left: 6px;
	  top: 14px;
	  opacity: 0;
  	background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAATlBMVEUAAAB9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6R9j6Q3iDOUAAAAGXRSTlMAtIBOBOGq9NqtWTXz8OWjmY+KZl1BLhUTogXPoQAAAFNJREFUCNdFjUcOgDAMBNcJpNL7/v+jCCcic5qRXKCkHQ0nzbvRd39Y0qpsyxwH0kfnVpwTK30Gbikuj66Hz0M90etQ8Ys0hswahgk4aDTE6i8BXkz4BK+qg6lSAAAAAElFTkSuQmCC');
    background-repeat: no-repeat;
    background-position: center center;
  }
  .task-item:hover .task-add-favorites {
  	opacity: 1;
  }
  .task-add-favorites:hover {
  	opacity: 1;
  }
  .task-add-favorites__added {
  	opacity: 1;
  	background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAAY1BMVEUAAADhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulPhulP/127wyF/71Gr2z2Xqw1vnwFj3z2ajQLf9AAAAGnRSTlMAq/y0TgTh9NqCfVkwFPPw5bejmY+KZl1BOAHPpvIAAABgSURBVAjXRY1JEoAgEAMzgLjvOwPq/1+pTlnSp/QhCYRyQYR0zEmbJr+Y4zAS5nGgJlwpEU3YOg7uIbDdgVrzK6xrqWfeOZ99E9YzewuhOlWRq7MSKVQJrCoX0Ua+euAGXNIEzQeFJ8QAAAAASUVORK5CYII=');
  }
  .pages {
    margin-left: -6px;
  }
  .pages ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  .pages li {
    display: inline-block;
    padding: 11px 0;
    margin: 0 0 6px 6px;
    border: 1px solid #E4E4E4;
    background-color: #fff;
    font-size: 14px;
    width: 40px;
    text-align: center;
    cursor: pointer;
  }
  .pages li.current-page {
    background-color: #E8E8E8;
  }
  .pages li:hover {
    opacity: .9;
  }
  .wizardWrapper{
    background-color: white;
    padding-left: 54px;
    padding-top: 36px;
    padding-bottom: 36px;
    min-height: 300px;
    border: 1px solid #E4E4E4;
    border-radius: 3px;
    margin-bottom: 40px;
  }
  .wizardPix{
      display: inline-block;
      margin-right: 30px;
  }
  .wizardMessage{
      color: #7C8FA4;
      display: inline-block;
      vertical-align: top;
  }
  .big{
      font-size: 48px;
  }
  .middle{
      font-size: 36px;
  }
</style>
