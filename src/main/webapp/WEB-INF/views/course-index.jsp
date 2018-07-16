<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ITer_Club（艾特社区）</title>
    <link rel="stylesheet" href="${ctx}/css/css/ydx-courselist.css">
    <style>
        .page {
            margin: 25px 0 auto;
            overflow: hidden;
            clear: both;
            text-align: center;
        }

        .page span, .page-disabled {
            height: 32px;
            color: #c8cdd2;
        }

        .page a {
            padding: 0 4px;
            min-width: 24px;
            line-height: 32px;
            font-size: 18px;
            display: inline-block;
            text-align: center;
        }


    </style>
</head>
<body>
<%@ include file="top.jsp" %>
<div id="main">
    <div class="wrap ">
        <div class="top">
            <div class="course-content">
                <div class="course-nav-box">
                    <div class="course-nav-row clearfix">
                        <span class="hd l"> 分类： </span>
                        <div class="bd">
                            <script>
                                $(function () {
                                    $(".fx>li").click(function () {
                                        $(this).addClass("on").siblings('li').removeClass("on");
                                    });
                                });
                            </script>
                            <ul class="fx">


                                <c:forEach var="category" items="${categorys}" varStatus="cg">

                                    <li class="course-nav-item ${category_code == category.ID ? "on" : ""}">
                                        <a class="" href="${ctx}/portal/course/category_code=${category.ID}/status=-1"
                                           data-ct="fe"> ${category.name} </a></li>


                                </c:forEach>


                            </ul>
                        </div>
                    </div>
                    <div class="course-nav-row clearfix">
                        <span class="hd l"> 情况： </span>
                        <div class="bd">
                            <ul class="">
                                <li class="course-nav-item ${status eq -1 ? "on" : ""}"><a
                                        href="${ctx}/portal/course/category_code=${category_code}/status=-1"> 全部 </a>
                                </li>
                                <li class="course-nav-item ${status eq 0 ? "on" : ""}"><a
                                        href="${ctx}/portal/course/category_code=${category_code}/status=0"> 即将开始 </a>
                                </li>
                                <li class="course-nav-item ${status eq 1 ? "on" : ""}"><a
                                        href="${ctx}/portal/course/category_code=${category_code}/status=1"> 正在进行 </a>
                                </li>
                                <li class="course-nav-item ${status eq 2 ? "on" : ""}"><a
                                        href="${ctx}/portal/course/category_code=${category_code}/status=2"> 已经结束 </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="container">

        <div class="course-list" style="height: 400px;">
            <div class="moco-course-list">
                <ul class="clearfix">


                    <c:forEach var="one" items="${courses}" varStatus="cg">
                        <div class="course-card-container">

                            <a target="_blank" href="${ctx}/portal/course/select/id=${one.ID}" class="course-card">
                                <div class="course-card-top">
                                    <img class="course-banner lazy"
                                         data-original="http://img.mukewang.com/5991489e00019f5c06000338-240-135.jpg"
                                         src="${ctx}${one.img}" style="display: inline;"/>
                                    <div class="course-label">
                                        <label> ${one.category.name} </label>
                                    </div>
                                </div>
                                <div class="course-card-content">
                                    <h3 class="course-card-name">
                                        <c:if test="${fn:length(one.name)>11 }">${ fn:substring(one.name ,0,11)} ...</c:if>
                                        <c:if test="${fn:length(one.name)<=11 }">${ one.name }</c:if>
                                            <%--${one.name} --%>
                                    </h3>
                                    <div class="clearfix course-card-bottom">
                                        <div class="course-card-info">
                                            <span> ${one.ID+5+one.ID% 3 + 4}人 </span>
                                            <span>
                                                <c:if test="${one.ID % 3 eq 0}">初级</c:if>
                                                <c:if test="${one.ID % 3 eq 1}">中级</c:if>
                                                <c:if test="${one.ID % 3 eq 2}">高级</c:if>
                                            </span>
                                        </div>
                                        <p class="course-card-desc"> ${one.description} </p>
                                    </div>
                                </div>
                            </a>

                        </div>
                    </c:forEach>


                </ul>

            </div>

        </div>

    </div>
    <!-- 返回顶部 -->

</div>
</body>
</html>