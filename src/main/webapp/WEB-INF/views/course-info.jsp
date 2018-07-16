<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.iter_club.portal.entity.Course" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ITer_Club（艾特社区）</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/course.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/course-info.css">
    <link rel="stylesheet" href="${ctx}/css/css/ydx-course.css"/>
    <link rel="stylesheet" href="${ctx}/css/css/ydx-courselist.css">
</head>
<body onkeydown="BindEnter(event)">
<%@ include file="top.jsp" %>
<div id="main">
    <div class="course-infos">
        <div class="w pr">
            <div class="path">
                <a href="${ctx}/portal/course/category_code=1/status=-1">课程</a>
                <i class="path-split">\</i>
                <a href="${ctx}/portal/course/category_code=${course.category.ID}/status=-1">${course.category.name}</a>
                <i class="path-split">\</i>
                <a href="#">
                    <c:if test="${course.ID % 3 eq 0}">初级</c:if>
                    <c:if test="${course.ID % 3 eq 1}">中级</c:if>
                    <c:if test="${course.ID % 3 eq 2}">高级</c:if>
                </a>
                <i class="path-split">\</i>
                <a href="#"><span>${course.name}</span></a>
            </div>
            <div class="hd clearfix">
                <h2 class="l">${course.name}</h2>
            </div>
            <div class="statics clearfix">
                <div class="moco-btn l learn-btn green-btn red-btn">

                    <c:choose>
                        <c:when test="${sessionScope.user ne null}">
                            <c:if test="${leanred eq 1}">
                                <a href="#" class="J-learn-course">
                                    继续学习
                                </a><em></em>
                            </c:if>
                            <c:if test="${leanred ne 1}">
                                <a href="${ctx}/portal/course/toLearn/course=${course.ID}" class="J-learn-course">
                                    开始学习
                                </a><em></em>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <a href="${ctx}/portal/toLogin" class="J-learn-course">
                                开始学习
                            </a><em></em>
                        </c:otherwise>
                    </c:choose>

                    ${leanred eq 1 ? "点赞" : "收藏"}
                </div>
                <c:if test="${leanred eq 1}">
                    <div class="static-item l">
                        <span class="meta">上次学到</span>
                        <span class="meta-value">第4周</span>
                    </div>
                </c:if>


                <div class="static-item l">
                    <span class="meta">学习人数</span>

                    <span class="meta-value js-learn-num">${course.ID+5+course.ID% 3 + 4}人</span>

                </div>
                <div class="static-item l">
                    <span class="meta">难度级别</span>
                    <span class="meta-value">
						<c:if test="${course.ID % 3 eq 0}">初级</c:if>
						<c:if test="${course.ID % 3 eq 1}">中级</c:if>
						<c:if test="${course.ID % 3 eq 2}">高级</c:if>
					</span>
                    <em></em>
                </div>
                <div class="static-item l">
                    <span class="meta">课程时长</span>
                    <span class="meta-value">${course.ID*200+(course.ID%3 )*2}分钟</span>
                    <em></em>
                </div>
                <div class="course-card-container" style="margin-left: 1px;width: 0px; height: 0px;left: 300px; bottom: 100px;">
                    <a target="_blank" href="${ctx}/portal/course/select/id=${course.ID}" class="course-card">
                        <div class="course-card-top">
                            <img class="course-banner lazy"
                                 data-original="http://img.mukewang.com/5991489e00019f5c06000338-240-135.jpg"
                                 src="${ctx}${course.img}" style="display: inline;"/>
                            <div class="course-label">
                                <label> ${course.category.name} </label>
                            </div>
                        </div>
                    </a>
                </div>

            </div>





        </div>





    </div>


    <%--<div class="course-info-main clearfix w">--%>
    <%--<div class="content-wrap">--%>
    <%--<div class="content">--%>
    <%--<!-- 课程简介 -->--%>
    <%--<div class="course-brief">--%>
    <%--<p class="auto-wrap">{{ course.desc }}</p>--%>
    <%--</div>--%>
    <%--<!-- 课程简介 end -->--%>
    <%--<div class="mod-tab-menu ">--%>
    <%--<ul class="course-menu clearfix">--%>
    <%--<li><a class="ui-tabs-active active" id="learnOn" href="#"><span>章节</span></a></li>--%>
    <%--<li><a id="commentOn" class="" href="{% url 'courses:comments' course.id %}"><span>评论</span></a>--%>
    <%--</li>--%>

    <%--</ul>--%>
    <%--</div>--%>

    <%--<!-- 课程面板 -->--%>

    <%--<div class="mod-chapters">--%>
    <%--{% for lesson in lessons %}--%>
    <%--<div class="chapter  chapter-active">--%>
    <%--<!-- 章节标题 -->--%>
    <%--<h3><strong> {{ lesson.name }}</strong></h3>--%>
    <%--<!-- 章节标题 end -->--%>
    <%--<!-- 章节小节 -->--%>
    <%--<ul class="video">--%>
    <%--{% for video in lesson.get_lesson_video %}--%>
    <%--<li data-media-id="15609">--%>
    <%--<a href="{% url 'courses:video' video.id %}" class="J-media-item">--%>
    <%--{{ video.name }} {{ video.learn_times |floatformat:0 }}秒--%>
    <%--{% if request.user.is_authenticated %}--%>
    <%--{% for progess in progesses %}--%>
    <%--{% ifequal video progess.video %}--%>
    <%--{% if progess.is_finish %}--%>
    <%--<i style="float: right;margin-top: 13px;margin-right: 10px;"--%>
    <%--class="glyphicon glyphicon-ok-circle"></i>--%>
    <%--{% else %}--%>
    <%--<i style="float: right;margin-top: 13px;margin-right: 10px;"--%>
    <%--class="glyphicon glyphicon-adjust"></i>--%>
    <%--{% endif %}--%>
    <%--{% endifequal %}--%>
    <%--{% endfor %}--%>
    <%--{% endif %}--%>
    <%--</a></li>--%>

    <%--{% endfor %}--%>
    <%--</ul>--%>
    <%--</div>--%>
    <%--{% endfor %}--%>


    <%--</div>--%>
    <%--<!-- 课程章节 end -->--%>
    <%--</div>--%>
    <%--<!--content end-->--%>
    <%--<div class="aside r">--%>
    <%--<div class="bd">--%>
    <%--<div class="box mb40 js-usercard-box">--%>

    <%--<h4><a>讲师提示</a></h4>--%>
    <%--<div class="teacher-info">--%>
    <%--<a href="{% url 'teachers:teacher_detail' course.teacher.id %}" target="_blank"> <img--%>
    <%--data-userid="497216" class="js-usercard-dialog"--%>
    <%--src="{{ MEDIA_URL }}{{ course.teacher.image }}" width="80" height="80"/> </a>--%>
    <%--<span class="tit"> <a href="{% url 'teachers:teacher_detail' course.teacher.id %}"--%>
    <%--target="_blank">{{ course.teacher.name }}</a><i--%>
    <%--class="icon-imooc"></i> </span>--%>
    <%--<span class="job">{{ course.teacher.work_position }}</span>--%>
    <%--</div>--%>
    <%--<div class="course-info-tip">--%>
    <%--<dl class="first">--%>
    <%--<dt>--%>
    <%--课程须知--%>
    <%--</dt>--%>
    <%--<dd class="autowrap">--%>
    <%--{% autoescape off %}--%>
    <%--{{ course.youneed_konw }}--%>
    <%--{% endautoescape %}--%>

    <%--</dd>--%>
    <%--</dl>--%>
    <%--<dl>--%>
    <%--<dt>--%>
    <%--老师告诉你能学到什么？--%>
    <%--</dt>--%>
    <%--<dd class="autowrap">--%>
    <%--{% autoescape off %}--%>
    <%--{{ course.teacher_tell }}--%>
    <%--{% endautoescape %}--%>
    <%--</dd>--%>
    <%--</dl>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--{% if all_resources %}--%>
    <%--<div class="box mb40">--%>
    <%--<h4>资料下载</h4>--%>
    <%--{# 资料下载 #}--%>
    <%--<ul class="list-group" style="margin-top: 15px">--%>
    <%--{% for course_resource in all_resources %}--%>
    <%--<li class="list-group-item">--%>
    <%--<span><i class="aui-iconfont aui-icon-file"></i>{{ course_resource.name }}</span>--%>
    <%--<a style="float: right" href="{{ MEDIA_URL }}{{ course_resource.download }}"--%>
    <%--class="downcode" download="{{ course_resource.name }}">下载</a>--%>
    <%--</li>--%>
    <%--{% endfor %}--%>
    <%--</ul>--%>
    <%--</div>--%>
    <%--{% endif %}--%>
    <%--<div class="js-recom-box">--%>
    <%--<div class="box mb40 all-attention-box">--%>
    <%--<h4>大家都关注</h4>--%>
    <%--<div class="js-all-attention all-attention">--%>

    <%--{% for learn_course in all_learn_course %}--%>

    <%--<a href="{% url 'courses:course_detail' learn_course.id %}" target="_blank"--%>
    <%--data-id="20"--%>
    <%--class="orange fs16 bold">{{ learn_course.name }}</a>--%>
    <%--{% endfor %}--%>

    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="box mb40 recom-course-list-box">--%>
    <%--<h4>推荐课程</h4>--%>
    <%--{% for relate_cours in relate_courses %}--%>
    <%--<ul class="js-recom-course recom-course-list clearfix">--%>
    <%--<li class="clearfix"><a href="{% url 'courses:course_detail' relate_cours.id %}"--%>
    <%--class="clearfix" target="_blank">--%>
    <%--<div class="l course-img">--%>
    <%--<div class="cart-color purple"--%>
    <%--style="background-image: url({{ MEDIA_URL }}{{ relate_cours.image }});">--%>

    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="l content-box">--%>
    <%--<p class="smalle-title">{{ relate_cours.name }}</p>--%>

    <%--<div class="clearfix learn-detail">--%>
    <%--{{ relate_cours.get_is_easy_display }}--%>
    <%--<span>&middot;</span>{{ relate_cours.students }}人在学--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</a></li>--%>
    <%--{% endfor %}--%>


    <%--</ul>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="clear"></div>--%>
    <%--</div>--%>

    <div class="c-container">
        <!-- 课程详情 -->
        <div class="conta-left-box" style="margin-left: 130px;">
            <% String course = request.getParameter("course"); %>
            <!-- 内容主体 -->
            <div class="conta-left-middle">
                <%--<div class="course-name" name="">${course.name}</div>--%>
                <ul class="f-02 course-info-box">
                    <li class="week course-info">
                        <dl>
                            <dt class="info-name">课程概述
                                <div class="border-box"></div>
                            </dt>
                            <dd class="info-value">
                                <p></p>
                                <p>${course.description}</p>
                            </dd>
                        </dl>
                    </li>
                    <li class="week course-info">
                        <dl>
                            <dt class="info-name">预备知识
                                <div class="border-box"></div>
                            </dt>
                            <dd class="info-value">
                                <p>系统学习过初中、高中英语基础课程，具有基本的英语词汇、语法基础知识以及语言能力。了解英语语音知识，能基本应对生活场景的英语会话。</p>
                            </dd>
                        </dl>
                    </li>
                    <li class="week course-info">
                        <dl>
                            <dt class="info-name">课程大纲
                                <div class="border-box"></div>
                            </dt>
                            <dd class="info-value">

                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <!-- 课程信息 -->
        <div class="conta-right-box">

            <!-- 课程进度 -->
            <div class="conta-right-schedule" style="height: 150px;">
                <div class="right-title">课程进度
                    <div class="border-box"></div>
                </div>
                <dl class="right-body">
                    <dd class="sc-left" style="width: 100px;"><span>4</span>/13&nbsp;周&nbsp;&nbsp;</dd>
                    <dd class="sc-right">
                        <ul class="f-02">
                            <li class="data-left">开课:&nbsp;&nbsp;<span>2017-6-25</span></li>
                            <li class="data-middle"></li>
                            <li class="data-right">结课:&nbsp;&nbsp;<span>2017-8-25</span></li>
                        </ul>
                    </dd>
                </dl>
                <div class="clear"></div>


                <%--<c:choose>--%>

                <%--<c:when test="${course.status ==2 }">--%>
                <%--<button class="course-abandon-btn">课程已结束</button>--%>
                <%--</c:when>--%>

                <%--<c:when test="${empty user}">--%>
                <%--<%	session.setAttribute("before_page","course-info");%>--%>
                <%--<form action="${ctx}/login/toLogin" method="post" name="formtologin" id="formtologin">--%>
                <%--<input type="hidden" name="id" id="courseid" ></input>--%>
                <%--</form>--%>
                <%--<button  class="course-abandon-btn" onclick="toLogin(${course.ID})">参加课程</button>--%>
                <%--</c:when>--%>

                <%--<c:when test="${not empty user_course}">--%>
                <%--<c:set var="flag" value="false" />--%>
                <%--<c:forEach var="item" items="${user_course}">--%>
                <%--<c:if test="${item.name == course.name}">--%>
                <%--<c:set var="flag" value="true" />--%>
                <%--</c:if>--%>
                <%--</c:forEach>--%>
                <%--<c:if test="${flag == true}">--%>
                <%--<form action="${ctx}/course/toLearn" method="post" name="formtolearn" id="formtolearn">--%>
                <%--<input type="hidden" name="learnid" id="learnid" ></input>--%>
                <%--</form>--%>
                <%--<button onclick="toLearn(${course.ID})" class="course-abandon-btn">已参加，进入学习</button>--%>
                <%--</c:if>--%>

                <%--<c:if test="${flag == false}">--%>
                <%--<form action="${ctx}/course/toLearn" method="post" name="formtoJoin" id="formtoJion">--%>
                <%--<input type="hidden" name="userid" id="userid" ></input>--%>
                <%--<input type="hidden" name="joinid" id="joinid" ></input>--%>
                <%--</form>--%>
                <%--<button onclick="toJoin(${user.ID},${course.ID})" class="course-abandon-btn">参加课程1</button>--%>
                <%--</c:if>--%>
                <%--</c:when>--%>

                <%--<c:otherwise >--%>
                <%--<button class="course-abandon-btn">无其他情况</button>--%>
                <%--</c:otherwise>--%>

                <%--</c:choose>--%>

            </div>
            <!-- 详细信息 -->
            <div class="conta-right-info">
                <div class="right-title">课程信息
                    <div class="border-box"></div>
                </div>
                <dl class="right-body">
                    <dd>课程时长&nbsp;&nbsp;&nbsp;&nbsp;<span>14周</span></dd>
                    <dd>课程负载&nbsp;&nbsp;&nbsp;&nbsp;<span>3-5小时每周</span></dd>
                    <dd>内容类型&nbsp;&nbsp;&nbsp;&nbsp;<span>视频&nbsp;文档&nbsp;随堂检测&nbsp;富文本&nbsp;讨论</span></dd>
                    <dd>课程分类&nbsp;&nbsp;&nbsp;&nbsp;<a href="" class="f-01"></a></dd>
                </dl>
            </div>
            <!-- 授课教师 -->
            <div class="conta-right-teacher">
                <div class="right-title">授课教师
                    <div class="border-box"></div>
                </div>
                <dl class="right-body">
                    <dd class="teacher-info-box">
                        <div class="teacher-img"><img src="${course.teacher.photo}"></div>
                        <ul class="f-02">
                            <li class="t-name">${course.teacher.name}</li>
                            <li class="t-info">${course.teacher.school.name}</li>
                            <li class="t-info" style="width: 150px;">${course.teacher.description}</li>
                        </ul>
                        <div class="clear"></div>
                    </dd>

                </dl>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
        <%--</c:forEach>--%>
        <footer>
            <div class="container">
                <div class="col-sm-8 text-left">© 2018 艾特社区（ITer_Club）</div>
                <div class="col-sm-4 text-right"><i class="fa fa-desktop" aria-hidden="true"></i>互联网虚拟学习社区</div>
            </div>
        </footer>
    </div>


</div>
<!-- 底部 -->


<script type="text/javascript">
    function toLogin(courseid) {
        document.getElementById("courseid").value = courseid;
        document.getElementById("formtologin").submit();
    }

    function toLearn(learnid) {
        document.getElementById("learnid").value = learnid;
        document.getElementById("formtolearn").submit();
    }

    function toJoin(userid, joinid) {
        document.getElementById("userid").value = userid;
        document.getElementById("joinid").value = joinid;
        document.getElementById("formtoJion").submit();
    }

    function BindEnter(obj) {
        var button = document.getElementById("enter");
        if (obj.keyCode == 13) {
            button.click();
            obj.returnValue = false;
        }
    }

    function search() {
        document.getElementById("search_course").submit();
    }
</script>

<!-- 底部 -->
<%--<div class="c-footer">MOOC</div>--%>
<script src="${ctx}/js/jquery.min.js"></script>
<script>
    //用户操作框隐藏|显示
    $(function () {
        $('.login-box').hover(function () {
            $(this).css('background-color', '#242528');
            $('.user-operation').css('display', 'block');
        }, function () {
            $(this).css('background-color', '#2E323E');
            $('.user-operation').css('display', 'none');
        });
    });
</script>

</body>
</html>