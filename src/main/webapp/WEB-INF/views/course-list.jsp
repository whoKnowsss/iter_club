<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>课程目录</title>
	<link rel="stylesheet" type="text/css" href="../../../css/course.css">
	<link rel="stylesheet" type="text/css" href="../../../css/reset.css">
</head>
<body>
	<!-- 顶部 -->
	<div class="c-top">
		<!-- logo -->
		<div class="logo">
			<a href="course-index.jsp"><img src="../../../image/logo.jpg"></a>
		</div>
		<!-- top导航 -->
		<div class="topNav-box">
			<ul>
				<li><a href="<%=path%>/course/selectAll.action" class="f-01">课程</a><div class=""></div></li>
				<li><a href="<%=path%>/school/selectAll.action" class="f-01">学校</a><div class=""></div></li>
				<li><a href="" class="f-01">文章</a><div class=""></div></li>
			</ul>
		</div>
		<!-- 搜索框 -->
		<div class="search-box">
			<form class="search-wrap">
				<input class="search-input" type="text" name="search-input" placeholder="搜索教程"></input>
				<input class="search-submit" type="submit" value=""></input>
			</form>
		</div>

		<% Object userforum = request.getSession().getAttribute("userforum");
			if(userforum==null ){
		%>
		<!-- 登陆按钮 -->
		<div class="unlogin-box">
			<a href="<%=path%>/login/toLogin.action" class="f-01">登录 &nbsp;&nbsp;</a>|
			<a href="<%=path%>/login/toRegister.action" class="f-01">&nbsp;&nbsp; 注册</a>
		</div>

		<% }else{ %>

		<!-- 用户信息 -->
		<div class="login-box">
			<img src="${userforum.photo}" width="50px" height="50px" alt="" class="userforum-img">
			<div class="userforum-operation">
				<a href="<%=path%>/userforum/toPersonal.action" class="f-01">个人中心</a>
				<a href="<%=path%>/login/outLogin.action" class="f-01">退出登录</a>
			</div>
		</div>
		<% } %>
	</div>

	<% Object course = request.getAttribute("course");%>
	<!-- 主体 -->
	<div class="c-container">
		<!-- 课程目录 -->
		<div class="conta-left-box">
			<!-- 目录主体 -->
			<div class="conta-left-middle">
				<div class="course-name" name="">${course.name}</div>
				<div class="week week-list">	
					<dl>
						<dt>Week&nbsp;1 <div class="border-box"></div></dt>
						<dd><a href="course-learn.jsp"><img src="../../../image/week/E-w01-01.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-02.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-03.png"></a></dd>
						<div class="clear"></div>
					</dl>
				</div>
				<div class="week week-list">	
					<dl>
						<dt>Week&nbsp;1 <div class="border-box"></div></dt>
						<dd><a href=""><img src="../../../image/week/E-w01-01.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-02.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-03.png"></a></dd>
						<div class="clear"></div>
					</dl>
				</div>
				<div class="week week-list">	
					<dl>
						<dt>Week&nbsp;1 <div class="border-box"></div></dt>
						<dd><a href=""><img src="../../../image/week/E-w01-01.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-02.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-03.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-03.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-03.png"></a></dd>
						<div class="clear"></div>
					</dl>
				</div>
				<div class="week week-list">	
					<dl>
						<dt>Week&nbsp;1 <div class="border-box"></div></dt>
						<dd><a href=""><img src="../../../image/week/E-w01-01.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-02.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-03.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-03.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-03.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-03.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-03.png"></a></dd>
						<dd><a href=""><img src="../../../image/week/E-w01-03.png"></a></dd>
						<div class="clear"></div>
					</dl>
				</div>
			</div>
			<!-- 加载更多 -->
			<div class="conta-left-bottom">
				<span>加载更多Week</span>
			</div>
		<div class="clear"></div>
		</div>
		<!-- 课程信息 -->
		<div class="conta-right-box">
			<!-- 课程进度 -->
			<div class="conta-right-schedule">
				<div class="right-title">课程进度<div class="border-box"></div></div>
				<dl class="right-body">
					<dd class="sc-left"><span>4</span>/13&nbsp;周</dd>
					<dd class="sc-right">
						<ul class="f-02">
							<li class="data-left">开课:&nbsp;&nbsp;<span>2017-6-25</span></li>
							<li class="data-middle"></li>
							<li class="data-right">结课:&nbsp;&nbsp;<span>2017-8-25</span></li>
						</ul>
					</dd>
				</dl>
				<div class="clear"></div>
				<form action="<%=path%>/course/abandon_course.action" method="post" name="formtoabandon" id="formtoabandon">
					<input type="hidden" name="abandon" id="abandon" />
				</form>
				<button class="course-abandon-btn" onclick="abandon_course(${course.ID})">放弃课程</button>
			</div>
			<!-- 详细信息 -->
			<div class="conta-right-info">
				<div class="right-title">课程信息<div class="border-box"></div></div>
				<dl class="right-body">
					<dd>课程时长&nbsp;&nbsp;&nbsp;&nbsp;<span>14周</span></dd>
					<dd>课程负载&nbsp;&nbsp;&nbsp;&nbsp;<span>3-5小时每周</span></dd>
					<dd>内容类型&nbsp;&nbsp;&nbsp;&nbsp;<span>视频&nbsp;文档&nbsp;随堂检测&nbsp;富文本&nbsp;讨论</span></dd>
					<dd>课程分类&nbsp;&nbsp;&nbsp;&nbsp;<a href="" class="f-01">外语</a></dd>
				</dl>
			</div>
			<!-- 授课教师 -->
			<div class="conta-right-teacher">
				<div class="right-title">授课教师<div class="border-box"></div></div>
				<dl class="right-body">
					<dd class="teacher-info-box">
						<div class="teacher-img"><img src="${course.teacher.photo}"></div>
						<ul class="f-02">
							<li class="t-name">${course.teacher.name}</li>
							<li class="t-info">${course.teacher.description}</li>
						</ul>
						<div class="clear"></div>
					</dd>
				</dl>
				<div class="clear"></div>
			</div>

		</div>
		<div class="clear"></div>
	</div>

	<script type="text/javascript">

        function abandon_course(courseid) {
            document.getElementById("abandon").value=courseid;
            document.getElementById("formtoabandon").submit();
        }
	</script>

	<!-- 底部 -->
	<div class="c-footer">MOOC</div>
	<script src="../../../js/jquery.min.js"></script>
	<script>
		//用户操作框隐藏|显示
		$(function(){
		$('.login-box').hover(function(){
		$(this).css('background-color','#242528');
		$('.userforum-operation').css('display','block');
		},function(){
		$(this).css('background-color','#2E323E');
		$('.userforum-operation').css('display','none');
		});
		});
    </script>
</body>
</html>