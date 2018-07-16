<%@ page language="java" contentType="text/html;charset=utf-8"
		 pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<title>ITer_Club（艾特社区）</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/course.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/css/course-learn.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
	<link rel="stylesheet" href="${ctx}/css/css/ydx-course.css"/>
	<script type="text/javascript" src="${ctx}/js/bvd.js"></script>
	 <link href="${ctx}/css/video-js.css" rel="stylesheet">
	 <script src="${ctx}/js/videojs-ie8.min.js"></script>

</head>
<body>
<%@ include file="top.jsp" %>

	<!-- 主体 -->
	<div class="c-container">
		<!-- 课程内容 -->
		<div class="conta-left-box">
			<!-- 内容主体 -->
			<div class="conta-left-middle">
				<div class="course-name" name="">大学英语&nbsp;&nbsp;(口语)</div>
				<div class="week course-index">
					<dl>
						<dt>Week&nbsp;1 <div class="border-box"></div></dt>
						<dd>
							<div class="bad-video">
								<video class="video-js" controls preload="auto" poster="${ctx}/image/video/06.jpg" data-setup="{}">
									<source src="${ctx}/image/video/01.mp4" type="video/mp4">
								</video>
							</div>
						</dd>
						<div class="clear"></div>
					</dl>
				</div>
			</div>
			<!-- 加载更多 -->
			<div class="conta-left-bottom">
				<span>下一节课程</span>
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
				<button class="course-abandon-btn">放弃课程</button>
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
						<div class="teacher-img"><img src="${ctx}/image/teacher/T-01.png"></div>
						<ul class="f-02">
							<li class="t-name">韩梅梅</li>
							<li class="t-info">国防语言系讲师《小学英语课本》课程负责人</li>
						</ul>
						<div class="clear"></div>
					</dd>
					<dd class="teacher-info-box">
						<div class="teacher-img"><img src="${ctx}/image/teacher/T-01.png"></div>
						<ul class="f-02">
							<li class="t-name">李雷</li>
							<li class="t-info">国防语言系讲师</li>
						</ul>
						<div class="clear"></div>
					</dd>
					<dd class="teacher-info-box">
						<div class="teacher-img"><img src="${ctx}/image/teacher/T-01.png"></div>
						<ul class="f-02">
							<li class="t-name">隔壁老王</li>
							<li class="t-info">国防原谅学讲师《大学原谅课本》课程负责人</li>
						</ul>
						<div class="clear"></div>
					</dd>
				</dl>
				<div class="clear"></div>
			</div>

		</div>
		<div class="clear"></div>
	</div>
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