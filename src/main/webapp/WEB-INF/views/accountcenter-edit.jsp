<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>
<%@ include file="accountcenter-base.jsp" %>
<style>
    #preview img {
        width: 100px;
        height: 100px;
    }

    .input_submit {
        border: none;
        width: 100%;
        height: 40px;
        background: #eee;
        color: #64647c;
        margin: 10px 0 14px;
        text-align: center;
        line-height: 40px;
        display: inline-block;
        transition: all .4s ease;
        cursor: pointer;
    }
</style>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/ajaxfileupload.js"></script>
<div class="course_container center_main_con clearfix">
    <div class="left_nav">

        <ul class="">
            <li><a href="${ctx}/user/toProfile">我的设置</a></li>
            <li><a href="${ctx}/user/tocourses/id=-1">我的课程</a></li>
            <li class="select"><a href="${ctx}/user/tomyopen">我要开课</a></li>

        </ul>
    </div>
    <div class="settings_con_hd" id="j-settings-con-hd">

        <ul id="j-mycourselist-data-con" class="mycourse_ul clearfix">
            <li>
                <ul class="nav nav-pills" style="background: #fff;margin-bottom: 20px;">
                    <li role="presentation" class="course-nav-item "><a
                            href="${ctx}/user/tomyopen"> 我的列表 </a></li>
                    <li role="presentation" class="course-nav-item active">
                        <c:choose>
                            <c:when test="${type eq '0'}">
                                <a href="${ctx}/user/course/edit/course=${course.ID}"> 编辑课程 </a>
                            </c:when>
                            <c:otherwise>
                                <a href="${ctx}/user/toopennew"> 新建课程 </a>
                            </c:otherwise>
                        </c:choose>

                    </li>
                </ul>
            </li>
        </ul>


        <ul class="personal_data" id="j-personal">
            <li class="datas interval_bottom clearfix">
                <h5 class="float_left">课程名称：</h5>
                <div class="datas_con float_left">${course.name}</div>
                <a class="datas_con btn pwd_btn float_left" id="change_xingbie_btn" data-toggle="modal"
                   data-target="#my_iphone">修改</a>
            </li>


            <li class="datas interval_bottom clearfix">
                <h5 class="float_left">缩略图：</h5>
                <div class="datas_con float_left"><img class="avator" src="${course.img}"
                                                       width="50" height="50"/>
                </div>
                <a class="datas_con btn pwd_btn float_left" id="change_nickname_btn" data-toggle="modal"
                   data-target="#change_avator">修改</a>
            </li>


            <li class="datas interval_bottom clearfix" style="height: auto">
                <h5 class="float_left">课程描述：</h5>
                <div class="datas_con datas_box " style="height: auto">${course.description}</div>
                <a class="datas_con btn pwd_btn float_left" id="change_phone" data-toggle="modal"
                   data-target="#myModal">修改</a>
            </li>


            <li class="datas interval_bottom clearfix">
                <h5 class="float_left">分类：</h5>
                <div class="datas_con datas_box float_left">${course.category.name}</div>
                <a data-toggle="modal" data-target="#change_pwd_btn" class="datas_con btn pwd_btn float_left"
                   id="change_phone">修改</a>
            </li>
            <li class="datas interval_bottom clearfix">
                <h5 class="float_left">状态：</h5>
                <div class="datas_con datas_box float_left">
                    ${course.status eq 0 ? '即将开始':course.status eq 1 ? "正在进行" : "已经结束"}
                </div>
                <a data-toggle="modal" data-target="#status_pwd_btn" class="datas_con btn pwd_btn float_left"
                   id="change_phone">修改</a>
            </li>
            <%--<li class="datas interval_bottom clearfix">--%>
            <%--<h5 class="float_left">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</h5>--%>

            <%--<div class="datas_con datas_box float_left">{{ user.work_name }}</div>--%>
            <%--<a class="datas_con btn pwd_btn float_left" id="change_nickname_btn" data-toggle="modal"--%>
            <%--data-target="#change_work">修改</a>--%>
            <%--</li>--%>
        </ul>
    </div>
</div>
<!-- 内容结束-->
<!-- 修改缩略图 -->
<div class="modal fade" id="change_avator" tabindex="-1" role="dialog">
    <div class="login_box clearfix" id="nickname_box" style="display: inline-block;">
        <div class="login_title">
            <div class="login_logo"><strong>艾特社区（ITer_Club）</strong></div>
            <span>修改缩略图</span>
        </div>
        <div class="clearfix">
            <div class="login_tel">


                <form id="img_upload" autocomplete="off" method="post"
                      action="${ctx}/user/course/change/type=image/course=${course.ID}">
                    <input type="hidden" name="image" value="${course.img}" id="i-img">
                </form>


                <script type="text/javascript">
                    function preview1(file) {
                        var img = new Image(), url = img.src = URL.createObjectURL(file)
                        var $img = $(img)
                        img.onload = function () {
                            URL.revokeObjectURL(url)
                            $('#preview').empty().append($img)
                        }
                    }

                    function preview2(file) {
                        var reader = new FileReader()
                        reader.onload = function (e) {
                            var $img = $('<img>').attr("src", e.target.result)
                            $('#preview').empty().append($img)
                        }
                        reader.readAsDataURL(file)
                    }

                    $(function () {
                        $('[type=file]').change(function (e) {
                            var file = e.target.files[0]
                            preview1(file)
                        })
                        $('#img_change_input').click(function () {
                            var filename = $("#file").val();
                            //执行上传文件操作的函数
                            $.ajaxFileUpload({
                                //处理文件上传操作的服务器端地址
                                url: '${ctx}/user/changephotonew',
                                enctype: "multipart/form-data",
                                secureuri: false,                       //是否启用安全提交,默认为false
                                fileElementId: 'file',                        //文件选择框的id属性
                                dataType: "json",                       //服务器返回的格式,可以是json或xml等
                                data: {
                                    filename: filename
                                },
                                success: function (data) {
                                    debugger
                                    if (data.status == 1) {
                                        console.log('文件上传成功，地址是' + data.url)
                                        $('#i-img').val(data.url)
                                        $('#img_upload').submit()
                                    } else
                                        console.log(data.info);

                                },
                                error: function (msg) {
                                    console.log(msg.responseText);
                                }
                            });
                        })
                        <%--${ctx}/user/changephotonew--%>
                    })
                </script>


                <label class="changearea" for="file">
                            <span id="preview" class="pic">
                                <img width="100" height="100" class="js-img-show img-circle" id="avatarShow"
                                     src="${course.img}"/>
                            </span>

                    <span class="fl upload-inp-box">
                              <p class="chang_btn">选择文件</p>

                              <input type=
                                             "file" name="file" id="file" class="js-img-up"/>

                            </span>
                </label>


            </div>
            <input type="submit" id="img_change_input" value="确定修改" class="input_submit btn_hover"/>


        </div>
        <button type="button" class="close close_btn" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
    </div>
</div>


<div class="modal fade" id="my_iphone" tabindex="-1" role="dialog">
    <div class="login_box clearfix" id="nickname_box" style="display: inline-block;">
        <div class="login_title">
            <div class="login_logo"><strong>艾特社区（ITer_Club）</strong></div>
            <span>修改课程名称</span>
        </div>
        <form action="${ctx}/user/course/change/type=name/course=${course.ID}" method="post" autocomplete="off">
            <div class="login_tel">
                <input value="" name="name" id="iphone_number" class="account_number account_input"
                       placeholder="${course.name}" type="text">
            </div>
            <input type="submit" id="iphone" value="确定修改" class="input_submit btn_hover"/>

            <button type="button" class="close close_btn" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
        </form>
    </div>


</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="login_box clearfix" id="nickname_box" style="display: inline-block;">
        <div class="login_title">
            <div class="login_logo"><strong>艾特社区（ITer_Club）</strong></div>
            <span>修改课程描述</span>
        </div>
        <form action="${ctx}/user/course/change/type=description/course=${course.ID}" method="post" autocomplete="off">
            <div class="login_tel">
                <textarea name="description" id="change_nickname" cols="30" placeholder="${course.description}"
                          rows="20" class="account_input"></textarea>
            </div>
            <input type="submit" id="nickname_btn" value="确定修改" class="input_submit btn_hover"/>

            <div id="nickname_fall" class="login_fall" style="display: none;">填写合法数据</div>
            <button type="button" class="close close_btn" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
        </form>
    </div>


</div>

<div class="modal fade" id="change_pwd_btn" tabindex="-1" role="dialog">
    <div class="login_box clearfix" id="nickname_box" style="display: inline-block;">
        <div class="login_title">
            <div class="login_logo"><strong>艾特社区（ITer_Club）</strong></div>
            <span>修改分类</span>
        </div>
        <form action="${ctx}/user/course/change/type=category/course=${course.ID}" method="post" autocomplete="off">
            <div class="login_tel">
                <c:forEach var="one" items="${categorys}" begin="1">
                    <input value="${one.ID}" name="category" id="c-${one.ID}" class="account_input"
                           type="radio" ${one.ID eq course.category.ID ? "checked" : ""}><label
                        for="c-${one.ID}">${one.name}</label>
                </c:forEach>
            </div>
            <input type="submit" id="nickname_btn" value="确定修改" class="input_submit btn_hover"/>
            <div id="nickname_fall" class="login_fall" style="display: none;">填写合法数据</div>
            <button type="button" class="close close_btn" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
        </form>
    </div>


</div>


<div class="modal fade" id="status_pwd_btn" tabindex="-1" role="dialog">
    <div class="login_box clearfix" id="nickname_box" style="display: inline-block;">
        <div class="login_title">
            <div class="login_logo"><strong>艾特社区（ITer_Club）</strong></div>
            <span>修改状态</span>
        </div>
        <form action="${ctx}/user/course/change/type=status/course=${course.ID}" method="post" autocomplete="off">
            <div class="login_tel">


                <input value="0" name="status" id="s-0" class="account_input"
                       type="radio" ${"0" eq course.status ? "checked" : ""}><label for="s-0"> 即将开始 </label>
                <input value="1" name="status" id="s-1" class="account_input"
                       type="radio" ${"1" eq course.status ? "checked" : ""}><label for="s-1"> 正在进行 </label>
                <input value="2" name="status" id="s-2" class="account_input"
                       type="radio" ${"2" eq course.status ? "checked" : ""}><label for="s-2"> 已经结束 </label>
            </div>
            <input type="submit" id="nickname_btn" value="确定修改" class="input_submit btn_hover"/>
            <div id="nickname_fall" class="login_fall" style="display: none;">填写合法数据</div>
            <button type="button" class="close close_btn" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
        </form>
    </div>


</div>
<footer style="margin-top: 20px">
    <hr>
    <div class="container">
        <div class="col-sm-8 text-left">© 2018 艾特社区（ITer_Club）</div>
        <div class="col-sm-4 text-right"><i class="fa fa-desktop" aria-hidden="true"></i>互联网虚拟学习社区</div>
    </div>
</footer>

