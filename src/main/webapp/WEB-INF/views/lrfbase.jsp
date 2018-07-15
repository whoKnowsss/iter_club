<%--
  Created by IntelliJ IDEA.
  User: 11655
  Date: 7/14/2018
  Time: 12:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>


<!DOCTYPE html>
<html>


<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, userforum-scalable=no">
    <title>ITer_Club（艾特社区）</title>
    <link rel="stylesheet" href="${ctx}/css/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/css/css/ydx.css"/>
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/bootstrap.js"></script>

</head>
<body>


<header>

    <nav class="navbar navbar-default mybar">
        <div class="container mycontainer" style="width: 1480px;">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="true">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand " href="${ctx}/portal/index">
                    <img alt="Brand" style="height: 72px;width: 120px;margin-top: -20px;" src="${ctx}/image/iter_logo.png">
                </a>
                            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right mynav">
                    <li><a href="${ctx}/portal/toLogin">登陆</a></li>
                    <li><a href="${ctx}/portal/toRegister">注册</a></li>
                </ul>
            </div>
        </div>
    </nav>

</header>








</body>
</html>











