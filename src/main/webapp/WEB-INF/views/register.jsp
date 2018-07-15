<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ITer_Club（艾特社区）</title>
    <style>
        .captcha {
            width: 120px;
            z-index: 1000;
            margin-left: -60px;

        }

        #id_captcha_1 {
            display: inline-block;
            width: 170px;
            height: 40px;
            box-sizing: border-box;
            background-color: #f8f8f8;
            padding: 0 20px;
            float: left;
            margin-left: 70px;
            line-height: 20px;
            font-size: 12px;
            color: #aaa;
            border-radius: 25px;
            outline: 0;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border: 1px solid #f8f8f8;
            color: black;
        }

        #id_captcha_1:focus {
            background: #F5D220;
        }

        .register {
            height: 480px;
        }
        .register em {
            font-size: 20px;
            font-weight: 600;
            color: rgb(77, 85, 93);
            margin-top: 0px;
            margin-right: 3px;
            margin-bottom: 0px;
            margin-left: 3px;
        }
    </style>
</head>
<body>
<%@ include file="lrfbase.jsp" %>


<%--<div class="l-middle">--%>
<%--<img src="${ctx}/image/bg/02.jpg">--%>
<%--<div class="tolayer"></div>--%>
<%--<div class="register-box">--%>
<%--<div class="register-title"><span>注册MOOC账号</span></div>--%>
<%--<form class="register-form" method="post" action="${ctx}/login/register">--%>
<%--<input type="text" name="name" class="l-input" placeholder="请输入用户名">--%>
<%--<input type="text" name="email" class="l-input" placeholder="请输入邮箱">--%>
<%--<input type="password" name="password" class="l-input" placeholder="请输入密码">--%>
<%--<input type="submit" name="" class="l-btn" value="即刻注册">--%>
<%--</form>--%>
<%--<div class="login">--%>
<%--已有账号？<a href="${ctx}/login/toLogin" class="f-01">立即登录</a>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<c:if test="${info eq '0' }">
    <div class="container-fluid content" style="background:url(${ctx}/image/bg/9.jpg) no-repeat -300px -50px ">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 loginbox" style="margin-top:50px;">

                <div class="register" style="height: 100px;top: 150px;">
                        ${error}
                </div>
            </div>

        </div>
    </div>
</c:if>
<c:if test="${info ne '0' }">
    <div class="container-fluid content" style="background:url(${ctx}/image/bg/10.jpg) no-repeat -300px -50px ">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 loginbox" style="margin-top:50px;">


                <div class="register">
                    <div class="login_title">用户注册</div>
                    <form id="email_register_form" method="post" action="${ctx}/portal/register" autocomplete="off">
                        <div class="register-group">
                            <input type="email" class="username" name="email" placeholder="邮箱">
                        </div>


                        <div class="register-group">
                            <input type="password" class="password" name="password" placeholder="登陆密码">
                        </div>


                        <div class="register-group">
                            <input type="password" class="password" name="password_2" placeholder="再次输入密码">
                        </div>


                        <p class="help-block">
                                ${info}
                                <%--{% for key, error in register_form_errors.items %}--%>
                                <%--{{ error }}--%>
                                <%--{% endfor %}--%>
                                <%--{% if not register_form_errors %} {{ msg }} {% endif %}--%>

                        </p>
                        <div class="register-group">
                            <button type="submit" class="btn_register">注册</button>
                        </div>
                        <div class="tologin">
                            已有账号点此 <a class="gologin" href="${ctx}/portal/toLogin">立即登陆</a>
                        </div>
                            <%--{% csrf_token %}--%>
                    </form>


                </div>
            </div>

        </div>
    </div>
</c:if>

<footer style="margin-top: 20px">
    <div class="container">
        <div class="col-sm-8 text-left">© 2018 艾特社区（ITer_Club）</div>
        <div class="col-sm-4 text-right"><i class="fa fa-desktop" aria-hidden="true"></i>互联网虚拟学习社区</div>
    </div>
</footer>

</body>
</html>