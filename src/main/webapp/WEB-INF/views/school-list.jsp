<%@ page language="java" contentType="text/html;charset=utf-8"
		 pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>ITer_Club（艾特社区）</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/school-list.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
</head>
<body onkeydown="BindEnter(event)">
	<!-- 顶部 -->
	<div class="c-top">
		<!-- logo -->
		<div class="logo">
			<a href="course-index.jsp"><img src="${ctx}/image/logo.jpg"></a>
		</div>
		<!-- top导航 -->
		<div class="topNav-box">
			<ul>
				<li><a href="${ctx}/course/selectAll" class="f-01">课程</a><div class=""></div></li>
				<li><a href="${ctx}/school/selectAll" class="f-01">学校</a><div class=""></div></li>
				<li><a href="" class="f-01">文章</a><div class=""></div></li>
			</ul>
		</div>
		<!-- 搜索框 -->
		<div class="search-box">
			<form class="search-wrap" id="search_course" name="search_course" action="${ctx}/course/search">
				<input class="search-input"  type="text" id="search_input" name="search_input" placeholder="搜索教程"/>
				<input  onclick="search()"  id="enter" name="enter" type="hidden" />
			</form>
		</div>

		<% Object user = request.getSession().getAttribute("user");
			if(user==null ){
		%>
		<!-- 登陆按钮 -->
		<div class="unlogin-box">
			<a href="${ctx}/login/toLogin" class="f-01">登录 &nbsp;&nbsp;</a>|
			<a href="${ctx}/login/toRegister" class="f-01">&nbsp;&nbsp; 注册</a>
		</div>

		<% }else{ %>

		<!-- 用户信息 -->
		<div class="login-box">
			<img src="${user.photo}" width="50px" height="50px" alt="" class="user-img">
			<div class="user-operation">
				<a href="${ctx}/user/toPersonal" class="f-01">个人中心</a>
				<a href="${ctx}/login/outLogin" class="f-01">退出登录</a>
			</div>
		</div>
		<% } %>

	</div>
	<!-- 主体 -->
	<div class="c-container">
		<div class="conta-left-box">
			<div class="conta-left-middle">
				<div class="course-name" name="">全部学校</div>
				<c:forEach var="school" items="${requestScope.schools}" varStatus="sc">
				    <div class="week week-list">
					    <div  onclick="toSchool(${school.ID})"><img src="${school.logo}"></div>
						<div class="clear"></div>
				    </div>
				</c:forEach>
			</div>
		</div>
	</div>

<script type="text/javascript">
	function BindEnter(obj) {
	var button = document.getElementById("enter");
	if(obj.keyCode == 13)
	{
	button.click();
	obj.returnValue = false;
	}
	}
	function search() {
	document.getElementById("search_course").submit();
	}
</script>
	<!-- 底部 -->
	<div class="c-footer">MOOC</div>
	<script src="${ctx}/js/jquery.min.js"></script>
	<script>
		//用户操作框隐藏|显示
		$(function(){
		$('.login-box').hover(function(){
		$(this).css('background-color','#242528');
		$('.user-operation').css('display','block');
		},function(){
		$(this).css('background-color','#2E323E');
		$('.user-operation').css('display','none');
		});
		});
    </script>
</body>
</html>