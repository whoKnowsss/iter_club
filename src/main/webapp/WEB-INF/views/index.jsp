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

<html>
<head>
    <title>ITer_Club（艾特社区）</title>
    <link href="${ctx}/css/css/ydxindex.css" rel="stylesheet"/>
    <style>
        .logotext {
            color: black;
        }

    </style>
</head>

<body>
<%@ include file="top.jsp" %>

<div class="main container-fluid">
    <div class="banner">
        <div class="banner-box">
            <div class="menuleft">
                <ul class="banner-menu">
                    <c:forEach var="category" items="${requestScope.categorys}" varStatus="cg">
                        <li>
                            <a href="${ctx}/portal/course/category_code=${category.ID}/status=-1">${category.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="menuright">
                <div id="carousel-example-generic" class="carousel slide mycarousel" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <c:forEach var="one" items="${requestScope.topFive}" varStatus="cg" end="2">
                            <div class="item ${cg.index eq 0 ? "active":""}">
                                <a href="${ctx}/portal/course/select/id=${one.ID}">
                                    <img src="${one.img}">
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button"
                       data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="false"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button"
                       data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="false"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <!-- 职业路径 -->
                <div class="path-banner">
                    <a href="#"
                       target="_blank" data-track="ljtj-1-1">
                        <i class="i-web"></i>
                        <p class="tit">Web前端攻城狮</p>
                        <p class="desc">互联网时代最火爆的技术</p>
                    </a>
                    <a href="#"
                       target="_blank" data-track="ljtj-1-3">
                        <i class="i-java"></i>
                        <p class="tit">Java攻城狮</p>
                        <p class="desc">健壮、安全、适用广泛</p>
                    </a>
                    <a href="#"
                       target="_blank" data-track="ljtj-1-4">
                        <i class="i-android"></i>
                        <p class="tit">Android攻城狮</p>
                        <p class="desc">移动设备市场份额第一</p>
                    </a>
                    <a href="#"
                       target="_blank" data-track="ljtj-1-2">
                        <i class="i-php"></i>
                        <p class="tit">PHP攻城狮</p>
                        <p class="desc">世界上最好的语言：）</p>
                    </a>
                    <a href="#"
                       target="_blank" data-track="ljtj-1-1">
                        <i class="i-ios"></i>
                        <p class="tit">Web前端攻城狮</p>
                        <p class="desc">互联网时代最火爆的技术</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="main">
    <div class="bgfff">
        <div class="container-types clearfix" >
            <h3 class="types-title"><em>精</em>／<em>品</em>／<em>课</em>／<em>程</em></h3>
            <div class="clearfix types-content" style="display: flex;margin-left: -70;">
                <c:forEach var="one" items="${requestScope.topFive}" varStatus="cg">
                    <div class="index-card-container course-card-container container">
                        <a class="course-card" href="${ctx}/portal/course/select/id=${one.ID}">
                            <div class="course-card-top hashadow">
                                <img class="course-banner" src="${ctx}${one.img}"/>
                                <div class="course-label">
                                    <label>${one.category.name}</label>

                                </div>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">${one.name}</h3>
                                <div class="clearfix course-card-bottom">
                                    <div class="course-card-info">

                                            <%--<span>{{ cours.get_is_easy_display}}</span>--%>
                                        <span>${one.ID+5+one.ID% 3 + 4}人</span>

                                    </div>

                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>


    <!--在线实战模块 -->

    <div class="container-types container-teacher-types clearfix">
        <h3 class="types-title"><span
                class="tit-icon icon-teacher-l tit-icon-l"></span><em>在</em>／<em>线</em>／<em>实</em>／<em>战</em><span
                class="tit-icon icon-teacher-r tit-icon-r"></span> <a href="https://www.imooc.com/lecturer/"
                                                                      class="types-title-more" target="_blank"> </a>
        </h3>
        <div class="lecturer-list clearfix">


            <a href="${ctx}/code/method?java" class="lecturer-item" data-track="jyms-1-1">
                <img class="lecturer-uimg" src="${ctx}/image/course/j1.jpg"/> <span
                    class="lecturer-name">JAVA</span>
                <span class="lecturer-title">在线JAVA编译</span>
                <span class="lecturer-p"
                >你还在为配置JAVA环境而苦恼吗？你还在为手边没有电脑不能code而焦虑吗？艾特社区在线java编译忧您所忧，一键提交，在线编译结果！</span>
            </a>


            <a href="${ctx}/code/methos?html" class="lecturer-item" data-track="jyms-1-1">
                <img class="lecturer-uimg" src="${ctx}/image/course/html.png"/> <span
                    class="lecturer-name">HTML</span>
                <span class="lecturer-title">实时HTML运行</span>
                <span class="lecturer-p"
                >享受风一样的快感，做一个飘逸的coder。任何时候，灵感来了，直接打开我们的在线HTML编辑器，回车即可查看效果，实时编译，妈妈再也不用担心我没有电脑了~</span>
            </a>

        </div>
    </div>
</div>


<%--</div>--%>
<!-- 返回顶部 -->
<div class="go-top" data-toggle="tooltip" data-placement="left" title="返回顶部">
    <div class="arrow"></div>
    <div class="stick"></div>
</div>

</body>
</html>
