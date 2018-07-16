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

<div class="course_container center_main_con clearfix">
    <div class="left_nav">

        <ul class="">
            <li class="select"><a href="${ctx}/user/toProfile">我的设置</a></li>
            <li><a href="${ctx}/user/tocourses/id=-1">我的课程</a></li>

        </ul>
    </div>
    <div class="settings_con_hd" id="j-settings-con-hd">
        <ul class="personal_data" id="j-personal">
            <li class="datas interval_bottom clearfix">
                <h5 class="float_left">头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：</h5>
                <div class="datas_con float_left"><img class="avator" src="${user.photo}"
                                                       width="50" height="50"/>
                </div>
                <a class="datas_con btn pwd_btn float_left" id="change_nickname_btn" data-toggle="modal"
                   data-target="#change_avator">修改</a>
            </li>
            <li class="datas interval_bottom clearfix">
                <h5 class="float_left">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</h5>
                <div class="datas_con float_left">${user.gender}</div>
                <a class="datas_con btn pwd_btn float_left" id="change_xingbie_btn" data-toggle="modal"
                   data-target="#my_iphone">修改</a>
            </li>
            <li class="datas interval_bottom clearfix">
                <h5 class="float_left">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</h5>
                <div class="datas_con datas_box float_left">${user.name}</div>
                <a class="datas_con btn pwd_btn float_left" id="change_phone" data-toggle="modal"
                   data-target="#myModal">修改</a>

            </li>
            <li class="datas interval_bottom clearfix">
                <h5 class="float_left">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</h5>
                <div class="datas_con datas_box float_left">******</div>
                <a href="{% url 'users:forgetcord' %}" class="datas_con btn pwd_btn float_left"
                   id="change_pwd_btn">修改</a>
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
<!-- 修改头像 -->
<div class="modal fade" id="change_avator" tabindex="-1" role="dialog">
    <div class="login_box clearfix" id="nickname_box" style="display: inline-block;">
        <div class="login_title">
            <div class="login_logo"><strong>艾特社区（ITer_Club）</strong></div>
            <span>修改头像</span>
        </div>
        <form class="clearfix" enctype="multipart/form-data" autocomplete="off" method="post"
              action="${ctx}/user/changephoto" target='frameFile'>
            <div class="login_tel">
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
                    })
                </script>


                <label class="changearea" for="avatarUp">
                            <span id="preview" class="pic">
                                <img width="100" height="100" class="js-img-show img-circle" id="avatarShow"
                                     src="${user.photo}"/>
                            </span>

                    <span class="fl upload-inp-box">
                              <p class="chang_btn">选择文件</p>

                              <input type="file" name="file" id="avatarUp" class="js-img-up"/>

                            </span>
                </label>


            </div>
            <input type="submit" id="nickname_btn" value="确定修改" class="input_submit btn_hover"/>


        </form>
        <button type="button" class="close close_btn" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
    </div>
</div>
<!-- 修改性别 -->

<div class="modal fade" id="my_iphone" tabindex="-1" role="dialog">
    <div class="login_box clearfix" id="nickname_box" style="display: inline-block;">
        <div class="login_title">
            <div class="login_logo"><strong>艾特社区（ITer_Club）</strong></div>
            <span>修改</span>
        </div>
        <script type="text/javascript">

            function myphone() {
                var myreg = $("#iphone_number").val()
                if (myreg != "男" && myreg != "女") {
                    alert("请输入正确的性别！")
                    $("#iphone_number").val('${user.gender}')
                    return false;
                }
            }

        </script>
        <form action="${ctx}/user/change/type=gender" method="post" autocomplete="off">
            <div class="login_tel">
                <input value="" name="gender" id="iphone_number" class="account_number account_input"
                       placeholder="男/女" type="sex">
            </div>
            <input type="submit" id="iphone" value="确定修改" class="input_submit btn_hover" onclick="myphone()"/>

            <button type="button" class="close close_btn" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
        </form>
    </div>


</div>
<!-- 修改昵称 -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="login_box clearfix" id="nickname_box" style="display: inline-block;">
        <div class="login_title">
            <div class="login_logo"><strong>艾特社区（ITer_Club）</strong></div>
            <span>修改昵称</span>
        </div>
        <form action="${ctx}/user/change/type=name" method="post" autocomplete="off">
            <div class="login_tel">
                <input value="" name="name" id="change_nickname" class="account_number account_input"
                       placeholder="昵称" autocomplete="off" maxlength="10" type="text">
            </div>
            <input type="submit" id="nickname_btn" value="确定修改" class="input_submit btn_hover"/>

            <div id="nickname_fall" class="login_fall" style="display: none;">填写合法昵称</div>
            <button type="button" class="close close_btn" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
        </form>
    </div>


</div>

<!-- 修改职称 -->
<%--<div class="modal fade" id="change_work" tabindex="-1" role="dialog">--%>
<%--<div class="login_box clearfix" id="nickname_box" style="display: inline-block;">--%>
<%--<div class="login_title">--%>
<%--<div class="login_logo"><strong>艾特社区（ITer_Club）</strong></div>--%>
<%--<span>修改职称</span>--%>
<%--</div>--%>
<%--<form action="{% url 'users:info_workname' %}" method="post" autocomplete="off">--%>
<%--<div class="login_tel">--%>
<%--<select type="text" class="account_number account_input" name='work_name' ,id="position" name="job"--%>
<%--placeholder="您干啥的呢">--%>
<%--<option value="产品汪">产品汪</option>--%>
<%--<option value="运营喵">运营喵</option>--%>
<%--<option value="设计狮">设计狮</option>--%>
<%--<option value="程序猿" selected="">程序猿</option>--%>
<%--<option value="市场鸡">市场鸡</option>--%>
<%--<option value="学生党">学生党</option>--%>
<%--<option value="其它">其它</option>--%>
<%--</select>--%>

<%--</div>--%>
<%--<input type="submit" id="nickname_btn" value="确定修改" class="input_submit btn_hover"/>--%>
<%--{% csrf_token %}--%>
<%--</form>--%>
<%--<button type="button" class="close close_btn" data-dismiss="modal" aria-label="Close"><span--%>
<%--aria-hidden="true">&times;</span></button>--%>
<%--</div>--%>
<%--</div>--%>
<footer style="margin-top: 20px">
    <div class="container">
        <div class="col-sm-8 text-left">© 2018 艾特社区（ITer_Club）</div>
        <div class="col-sm-4 text-right"><i class="fa fa-desktop" aria-hidden="true"></i>互联网虚拟学习社区</div>
    </div>
</footer>