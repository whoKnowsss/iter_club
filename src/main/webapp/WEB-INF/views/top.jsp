<%--
  Created by IntelliJ IDEA.
  User: 11655
  Date: 7/14/2018
  Time: 12:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>


<!DOCTYPE html>
<html>


<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>ITer_Club（艾特社区）</title>
    <link rel="stylesheet" href="${ctx}/css/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/css/css/ydx-main.css"/>
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/bootstrap.js"></script>

</head>
<body>

<!-- <nav class="navbar navbar-default my-navbar navbar-inverse">  -->

<nav class="navbar navbar-default my-navbar ">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- <img alt="Brand" class="logo" src="../image/ydx6.png"> -->
            <a class="navbar-brand mynavbar-brand" href="${ctx}/portal/index">
                <img alt="Brand" class="logo" src="${ctx}/image/iter_logo.png">
            </a>

            <!--  -->
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav my-navbar-nav">
                <li>
                    <a href="${ctx}/portal/index">
                        首页
                    </a>
                </li>
                <li>
                    <a href="${ctx}/portal/course/category_code=1/status=-1">
                        精品课程
                    </a>
                </li>


                <li>
                    <a href="${ctx}/forum/club/index">
                        社区讨论
                    </a>
                </li>
                <li>

                    <a href="${ctx}/portal/code/list">
                        在线实战
                    </a>
                </li>

            </ul>
            <c:if test="${sessionScope.user != null}">
                <ul class="navbar-right mynav">



                    <%--<img src="${sessionScope.user.photo}" width="50px" height="50px" alt="" class="user-img">--%>
                    <li class="mydropdown">

                        <a href="#" class="mydropdown-name">${sessionScope.user.name}<span class="caret"></span></a>

                        <ul class="dropdown-menu mydropdown-menu">
                            <li class="mydropdown-menu-li">
                                <a href="${ctx}/user/toProfile">
                                        个人中心
                                </a>
                            </li>
                            <li class="mydropdown-menu-li">
                                <a href="${ctx}/forum/user/index?uid=${user.UUID}">
                                    我的论坛
                                </a>
                            </li>
                            <li class="mydropdown-menu-li">
                                <a href="${ctx}/portal/logout">
                                    退出
                                </a>
                            </li>
                        </ul>

                    </li>
                </ul>
            </c:if>
            <c:if test="${sessionScope.user == null}">

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${ctx}/portal/toLogin">登陆</a></li>
                    <li><a href="${ctx}/portal/toRegister">注册</a></li>
                </ul>
            </c:if>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="go-top" data-toggle="tooltip" data-placement="left" title="返回顶部">
    <div class="arrow">
    </div>
    <div class="stick">
    </div>
</div>


<script>
    $(window).scroll(function () {
        if ($(".navbar").offset().top > 50) {
            $(".navbar-fixed-top").addClass("top-nav");
            $('.logo').hide();
        } else {
            $(".navbar-fixed-top").removeClass("top-nav");
            $('.logo').show();

        }
    });

    $(document).ready(function () {
        dropdownOpen();//调用
    });

    /**
     * 鼠标划过就展开子菜单，免得需要点击才能展开
     */
    function dropdownOpen() {

        var $dropdownLi = $('li.mydropdown');

        $dropdownLi.mouseover(function () {
            $(this).addClass('open');
        }).mouseout(function () {
            $(this).removeClass('open');
        });
    }

</script>
<script type="text/javascript">
    $(function () {
        $(window).scroll(function () {
            if ($(window).scrollTop() > 600) $('div.go-top').show();
            else $('div.go-top').hide();
        });
        $('div.go-top').click(function () {
            $('html, body').animate({
                    scrollTop: 0
                },
                600);
        });
    });

</script>


</body>
</html>











