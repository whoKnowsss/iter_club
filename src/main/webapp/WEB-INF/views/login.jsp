<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ITer_Club（艾特社区）</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/login.css">
</head>
<body>
<%@ include file="lrfbase.jsp" %>


<div class="container-fluid content" style="background:url(${ctx}/image/bg/11.jpg) no-repeat -350px -50px">
    <div class="row">
        <div class="col-md-4 col-md-offset-4 loginbox" style="margin-top:50px;">
            <div class="login">
                <div class="login_title">用户登陆</div>
                <form action="${ctx}/portal/login" method="post" autocomplete="off">
                    <div class="login-group">
                        <input type="text" class="username" name="email" placeholder="邮箱">
                    </div>
                    <div class="login-group">
                        <input type="password" class="password" name="password" placeholder="登陆密码">
                    </div>
                    <div class="login-group">
                        <a class="forget" href="${ctx}/portal/userforum/forget">忘记密码</a>
                    </div>
                    <p class="help-block">
                        ${info}

                    </p>

                    <div class="login-group">
                        <button type="submit" class="btn_login">登陆</button>
                    </div>
                    <div class="toregister">
                        还没有账号？点此 <a class="goregister" href="${ctx}/portal/toRegister">立即注册</a>
                    </div>
                    <input type="hidden" name="next" value="{{ redirect_url }}"/>

                </form>


            </div>
        </div>
    </div>
</div>


<footer style="margin-top: 20px">
    <div class="container">
        <div class="col-sm-8 text-left">© 2018 艾特社区（ITer_Club）</div>
        <div class="col-sm-4 text-right"><i class="fa fa-desktop" aria-hidden="true"></i>互联网虚拟学习社区</div>
    </div>
</footer>
</body>
</html>