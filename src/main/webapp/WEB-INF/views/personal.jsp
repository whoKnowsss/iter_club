<%@ page language="java" contentType="text/html;charset=utf-8"
		 pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>ITer_Club（艾特社区）</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/course.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/css/personal.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_8h2fgrztz6e9izfr.css">
</head>
<body>
<!-- 顶部 -->
<div class="c-top">
	<!-- logo -->
	<div class="logo">
		<a href="course-index.html"><img src="../image/logo.jpg"></a>
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
		<form class="search-wrap">
			<input class="search-input" type="text" name="search-input" placeholder="搜索教程"></input>
			<input class="search-submit" type="submit" value=""></input>
		</form>
	</div>


	<% Object user = request.getSession().getAttribute("user");%>

	<!-- 用户信息 -->
	<div class="login-box">
		<img src="${user.photo}" width="50px" height="50px" alt="" class="user-img">
		<div class="user-operation">
			<a href="${ctx}/user/toPersonal" class="f-01">个人中心</a>
			<li class="mydropdown-menu-li">
				<a href="${ctx}/forum/user/index?uid=${user.UUID}">
					我的论坛
				</a>
			</li>
			<a href="${ctx}/login/outLogin" class="f-01">退出登录</a>
		</div>
	</div>
</div>
<!-- 主体 -->
<div class="container">
	<!-- 用户信息 -->
	<div class="user-info-box">
		<div class="u-info">
			<div class="u-img"><img src="${user.photo}"></div>
			<ul class="u-info-list f-02">
				<li class="l-1"><span class="u-name">${user.name}</span></li>
				<li class="l-2"><span class="u-type">学生</span>&nbsp;|&nbsp;<span class="u-school">山西农业大学</span></li>
				<li class="l-3">关注<span class="u-focus-num">0</span>人&nbsp;|&nbsp;粉丝<span class="u-fans-num">0</span>人</li>
			</ul>
		</div>
	</div>
	<!-- 学习时间 -->
	<div class="course-schedule-box">
		<div class="learn-time">
			<img class="sj" src="${ctx}/image/bg/sj.png"></img>
			<ul class="l-t f-02">
				<li>学习时间</li>
				<li class="l-time">8小时</li>
			</ul>
		</div>
	</div>

	<!-- 我的课程 -->
	<div class="m-body">
		<div class="my-course">我的课程</div>
		<div class="course-state-list">
			<form action="${ctx}/user/selectByStatus" method="post" name="formStatu" id="formStatu">
				<input type="hidden" name="id" id="formstatus" ></input>
			</form>

			<ul class="course-state-box f-02">
				<li class="course-state "><a href="${ctx}/user/toPersonal" class="f-01 s-all current">全部</a></li>
				<li class="course-state "><a onclick="toStatus(1)" class="f-01 s-ing">正在进行</a></li>
				<li class="course-state "><a onclick="toStatus(0)" class="f-01 s-soon">即将开始</a></li>
				<li class="course-state "><a onclick="toStatus(2)" class="f-01 s-end">已结束</a></li>
			</ul>
		</div>

		<% List user_course = (List) request.getSession().getAttribute("user_course"); %>
		<c:forEach var="course" items="${user_course}">
		<div class="course-list-box">
			<div class="course-box">

				<div class="img-box"><img onclick="toLearn(${course.name})" src="${course.img}" class="pic"/></div>
				<div class="info-box">
					<div class="i-title">
						<a href="" class="f-01 title">${course.name}</a>
						<a href="" class="f-01 tag">大学先修课${course.ID}</a>
					</div>
					<div class="i-des">
						<span><a href="" class="f-01 ">${course.school.name}</a></span>
						<span><a href="" class="f-01 ">${course.teacher.name}</a></span>
					</div>
					<div class="i-state">
						<a href="" class="f-01 join-num"><i class="iconfont mooc-ren"></i><span>12306</span>已参加</a>
						<a href="" class="f-01 curry-time"><i class="iconfont mooc-shijian"></i>进行至第<span>4</span>周</a>
					</div>
					<form action="${ctx}/course/toLearnname" method="post" name="formtolearnname" id="formtolearnname">
						<input type="hidden" name="learnname" id="learnname" />
					</form>
					<button onclick="toLearn('${course.name}')" class="continue f-01">继续学习</button>
				</div>
			</div>
		</div>
		</c:forEach>

	</div>
</div>

<script type="text/javascript">
    function toLearn(learnname) {
        document.getElementById("learnname").value=learnname;
        document.getElementById("formtolearnname").submit();
    }
    function toStatus(status) {
        document.getElementById("formstatus").value=status;
        document.getElementById("formStatu").submit();
    }
</script>

<!-- 底部 -->
<div class="clear"></div>
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
    // img放大特效
    $(function(){
        $w = $('.pic').width();
        $h = $('.pic').height();
        $w2 = $w + 20;
        $h2 = $h + 20;

        $('.course-box').hover(function(){
            $(this).find('.pic').stop().animate({height:$h2,width:$w2,left:"-10px",top:"-10px"},500);
        },function(){
            $(this).find('.pic').stop().animate({height:$h,width:$w,left:"0px",top:"0px"},500);
        });
    });

</script>
</body>
</html>