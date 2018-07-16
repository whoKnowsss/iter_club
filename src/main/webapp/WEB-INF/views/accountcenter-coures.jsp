<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>
<%@ include file="accountcenter-base.jsp" %>
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


<div style="min-height: 550px" class="course_container center_main_con clearfix">
    <div class="left_nav">

        <ul class="">

            <ul class="">
                <li><a href="${ctx}/user/toProfile">我的设置</a></li>
                <li class="select"><a href="${ctx}/user/tocourses/id=-1">我的课程</a></li>

            </ul>
        </ul>
    </div>
    <div class="settings_con_hd" id="j-settings-con-hd">


        <ul id="j-mycourselist-data-con" class="mycourse_ul clearfix">
            <li>
                <ul class="nav nav-pills" style="background: #fff;margin-bottom: 20px;">
                    <li role="presentation" class="course-nav-item ${status eq -1 ? "active" : ""}"><a
                            href="${ctx}/user/tocourses/id=-1"> 全部 </a></li>
                    <li role="presentation" class="course-nav-item ${status eq 0 ? "active" : ""}"><a
                            href="${ctx}/user/tocourses/id=0"> 即将开始 </a></li>
                    <li role="presentation" class="course-nav-item ${status eq 1 ? "active" : ""}"><a
                            href="${ctx}/user/tocourses/id=1"> 正在进行 </a></li>
                    <li role="presentation" class="course-nav-item ${status eq 2 ? "active" : ""}"><a
                            href="${ctx}/user/tocourses/id=2"> 已经结束 </a></li>
                </ul>
            </li>
            <c:forEach var="one" items="${user_course}" varStatus="cg">

            <li class="tb">
                <a style="display: block" href="${ctx}/portal/course/select/id=${one.ID}">
                    <div class="tb_link">
                        <div class="mycourse_block_hd clearfix">

                            <div class="lessonpic_hd">
                                <img src="${ctx}${one.img}" width="200"
                                     height="116">
                            </div>

                            <div class="mycourse_info_hd">
                                <div class="myccourse_title">${one.name}</div>
                                <div class="mycourse_le_info_hd">
                                    <span class="myccourse_class_num">
                                            ${one.ID+5+one.ID% 3 + 4}人
                                    </span>
                                    <span class="myccourse_class_time">
                                                <c:if test="${one.ID % 3 eq 0}">初级</c:if>
                                                <c:if test="${one.ID % 3 eq 1}">中级</c:if>
                                                <c:if test="${one.ID % 3 eq 2}">高级</c:if>

                                    </span>
                                    <span onclick="window.open('/live/30412.html'); return false;"
                                          class="myccourse_info_title">

    </span>

                                </div>

                                <div>
                                    <c:if test="${fn:length(one.description)>100 }">${ fn:substring(one.description ,0,100)} ...</c:if>
                                    <c:if test="${fn:length(one.description)<=100 }">${ one.description }</c:if>

                                        <%--${one.description}--%>
                                </div>

                            </div>

                            <div class="more_hd">
                                <div class="more_icon j-more">
                                </div>
                                <div class="more_list_hd">
                                    <div class="remove_btn" id='remove_btn' style="z-index: 10000"><a
                                            href="${ctx}/portal/course/delete/user=${sessionScope.user.ID}/course=${one.ID}">删除课程</a>
                                    </div>
<%--${one}--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </li>

            </c:forEach>


    </div>
</div>


<!-- 内容开始 -->


<footer style=" margin-bottom: 50px;">
    <hr>
    <div class="container">
        <div class="col-sm-8 text-left"><hr>© 2018 艾特社区（ITer_Club）</div>
        <div class="col-sm-4 text-right"><i class="fa fa-desktop" aria-hidden="true"></i>互联网虚拟学习社区</div>
    </div>
</footer>
