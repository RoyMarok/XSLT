<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/ROOT">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en" id="PortalLoginPageIdentif">
            <head>
                <meta content="IE=edge" http-equiv="X-UA-Compatible"/>
                <meta charset="UTF-8"/>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"></link>
                <link rel="icon" href="/favicon.ico" type="image/x-icon"></link>
                <title>АИС "Экспертиза проектов"</title>
                <link href="/portal_static/img/ps/favicon.ico" rel="shortcut icon"></link>

                <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/common.css"></link>
                <link type="text/css" rel="stylesheet" href="/portal_static/css/ps/login.css"></link>

                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
                <script type="text/javascript" src="/portal_static/js/jquery-1.7.2.min.js"></script>
                <script type="text/javascript" src="/portal_static/js/jquery.validate.js"></script>
                <script type="text/javascript">
                    $(document).ready(function () {

                        if ($('#username').val() &amp;&amp; $('#password').val())
                            $('#rememberMe').attr('checked', 'checked');

                        $('.bg_input_password[type=text]').focus(function () {
                            $(this).hide();
                            $(this).parent().find('input[type=password]').addClass('onFocus')
                                    .focus()
                                    .blur(function () {
                                        $(this).removeClass('onFocus');
                                        if ($(this).val() == '') {
                                            $(this).parent().find('input[type=text]').show();
                                        }
                                    });
                        });

                        //добавить поля смены пароля
                        $('#change_pass').click(function () {
                            changepwd = true;
                            $('#checkbox_place, #submit_place').hide();
                            $('div#new_pass, #newpass_label').show();

                            if ($("#f_login").val() == "")
                                $("#f_login").focus();
                            else {
                                if ($("#f_pass").val() == "")
                                    $("#f_pass").focus();
                                else
                                    $("#f_newpass").focus();
                            }

                            return false;
                        });

                        //убрать поля смены пароля
                        $('#cancel').click(function () {
                            changepwd = false;
                            $('#checkbox_place, #submit_place').show();
                            $('div#new_pass, #newpass_label').hide();

                            if ($("#f_login").val() == "")
                                $("#f_login").focus();
                            else {
                                $("#f_pass").focus();
                            }
                            return false;
                        });

                        $('#fm1').submit(function (e) {
                            if (!$('#rememberMe').is(':checked')) {
                                removeCookie('REM', '/auth', location.origin.replace(location.protocol + '//', ''));
                            }
                            return true;
                        });
                    });

                    function showAdminMessage() {
                        try {
                            $.ajax({
                                type: "GET",
                                url: "showAdminMessage.action",
                                timeout: 90000,
                                error: function (xhr, msg) {
                                    alert(msg);
                                },
                                success: function (data) {
                                    if (data != null) {
                                        $(".foot_links").css("display", "none");
                                        $(".chb_butsub").css("display", "none");
                                        $("#forgetPassword").css("display", "block");
                                        $("#mainPassword").css("display", "none");
                                        $("#fm1").width(358);
                                        $("p.forget").text(data['message']);
                                    } else if (data.status == "SYSTEM_ERROR") {
                                        alert("Проблемма соеденения с БД обратитесь к системному администратору");
                                    }

                                }
                            });

                        } catch (err) {
                            alert(err);
                        }
                    }

                    function changePassword() {
                        var login = $("#username").val();
                        var oldPassword = $("#password").val();
                        var newPassword = $("#newPassword").val();
                        var confirmNewPassword = $("#newConfirmPassword").val();

                        if (newPassword == '' || confirmNewPassword == '') {
                            alert("Поля нового пароля должны быть заполнены");
                            return;
                        }

                        if (newPassword != confirmNewPassword) {
                            alert("Поля нового пароля должны совпадать");
                            return;
                        }

                        try {
                            $.ajax({
                                type: "GET",
                                url: "changePassword.action",
                                data: {login: login, oldPassword: oldPassword, newPassword: newPassword},
                                timeout: 90000,
                                error: function (xhr, msg) {
                                    alert(msg);
                                },
                                success: function (data) {
                                    if (data != null) {
                                        if (data.status == "SUCCESS") {
                                            $('#checkbox_place, #submit_place').show();
                                            $('div#new_pass, #newpass_label').hide();
                                            $(".foot_links").css("display", "block");
                                            $(".chb_butsub").css("display", "block");
                                            alert("Пароль успешно изменен");
                                            $("#password").val(newPassword);
                                        } else if (data.status == "ERROR") {
                                            alert("Проверьте корректность существующего пароля");
                                        } else if (data.status == "SYSTEM_ERROR") {
                                            alert("Проблема соеденения с БД обратитесь к системному администратору");
                                        }

                                    } else {
                                        alert("Ошибка");
                                    }


                                }
                            });

                        } catch (err) {
                            alert(err);
                        }
                    }

                    function forgetOK() {
                        $("#forgetPassword").css("display", "none");
                        $("#mainPassword").css("display", "block");
                        $(".chb_butsub").css("display", "block");
                        $(".foot_links").css("display", "block");
                        $("#fm1").width(320);
                    }

                    function removeCookie(sKey, sPath, sDomain) {
                        document.cookie = encodeURIComponent(sKey) +
                                "=; expires=Thu, 01 Jan 1970 00:00:00 GMT" +
                                (sDomain ? "; domain=" + sDomain : "") +
                                (sPath ? "; path=" + sPath : "");
                    }

                    function submitESIAClick(){
        localStorage.loginType=1;
        /*window.location = 'https://esia-portal1.test.gosuslugi.ru/idp/rlogin?cc=bp?epx=EXP_EXPERT_CHEL';*/
        window.location = 'https://expert.ursip.ru/esia/sp/priv1.jsp?forceAuthn=True';
  }



                </script>
            </head>
            <body>
                <xml style="display: none;">
                    <xsl:copy-of select="*"/>
                </xml>
                <div id="content">

                    <div class="logo">
                        <img class="logo2x__img" src="/portal_static/img/icons/logo@2x.png"/>
                    </div>

                    <div class="boxLoginWrapper">

                        <h1>АИС "Экспертиза проектов"</h1>

                        <div class="box fl-panel" id="login">
                            <form method="post" id="fm1" class="fm-v clearfix form" action="/auth/j_spring_security_check">
                                <input type="hidden" name="service">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="SERVICE/ROW_SET/ROW/SERVICE"/>
                                    </xsl:attribute>
                                </input>
                                <div id="msg" class="errors">
                                    <xsl:value-of select="ERROR/ROW_SET/ROW/ERROR"/>
                                </div>

                                <div id="logo_pass">
                                    <div class="item_form">
                                        <label for="username">Логин:</label>
                                        <input class="bg_input_login required" type="text" maxlength="32" name="j_username" value="##username##" size="25" autocomplete="true" id="username"/>
                                    </div>
                                    <div class="item_form">
                                        <label for="password">Пароль:</label>
                                        <input class="bg_input_password required" type="password" maxlength="32" name="j_password" value="##password##" autocomplete="true" id="password"/>
                                    </div>

                                    <div id="checkbox_place" class="item_form">
                                        <input id="rememberMe" value="true" tabindex="3" type="checkbox" name="_spring_security_remember_me"/>
                                        <label for="rememberMe" class="fl-rem"><span>З</span>апомнить меня
                                        </label>
                                    </div>

                                    <div id="submit_place" class="item_form" style="margin-bottom: 0">
                        <input class="bt_blue" type="submit" id="submitBtn" name="submitBtn" value="Войти"/>
                        <input type="button" onclick="submitESIAClick()" accesskey="2" value="Вход ЕСИА" name="cert" class="bt_white bt_ecp"/>
                    </div>
                                </div>

                                <div id="new_pass">
                                    <div class="item_form">
                                        <label for="newPassword"></label>
                                        <div style="position:relative; float:left">
                                            <input class="bg_input_password required" type="password" maxlength="32" id="newPassword" name="newPassword"/>
                                            <input class="bg_input_password password_text" type="text" maxlength="32" value="Новый пароль" id="newPassword_text"/>
                                        </div>
                                    </div>
                                    <div class="item_form">
                                        <label for="newConfirmPassword"></label>
                                        <div style="position: relative; float:left">
                                            <input class="bg_input_password required" type="password" maxlength="32" id="newConfirmPassword" name="newConfirmPassword"/>
                                            <input class="bg_input_password password_text" type="text" maxlength="32" value="Подтверждение" id="newConfirmPassword_text"/>
                                        </div>
                                    </div>
                                    <div class="item_form" style="margin-bottom: 0; padding-top: 6px">
                                        <div id="save_place">
                                            <input class="bt_blue bt_save" type="button" name="changePasswordButton" value="Сохранить" id="save" onclick="changePassword()"/>
                                        </div>

                                        <div id="cancel_place">
                                            <input type="button" name="cancelChangePasswordButton" value="Отмена" id="cancel" class="bt_white"/>
                                        </div>
                                    </div>
                                </div>
                                <div style="clear: both"></div>
                            </form>

                            <div id="forgot_password" style="display:none">
                                <h3>Забыли пароль?</h3>
                                <div class="forgot_password_text">Для восстановления доступа к АИС «Контроль прохождения
                                    экспертизы» необходимо связаться по телефонам внутр. 56-440, 58-833 или электронной
                                    почте
                                    <a class="mailto" href="mailto:Rulev.AI@mge.mos.ru">Rulev.AI@mge.mos.ru</a>,
                                    <a class="mailto" href="mailto:Sartakov.KE@mge.mos.ru">Sartakov.KE@mge.mos.ru</a>
                                </div>
                                <div class="forgot_password_bt">
                                    <input type="button" name="ok" value="OK" onclick="$('form.form').show(); $('#forgot_password').hide()" class="bt_white"/>
                                </div>
                            </div>

                        </div>

                        <div class="links">
                            <a href="#" id="change_pass" class="dynamicActionLinkBlue">Сменить пароль</a>
                            |
                            <a href="#" class="dynamicActionLinkBlue" onclick="$('form.form').hide();$('#forgot_password').show()">Забыли пароль?
                            </a>
                        </div>

                    </div>

                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
