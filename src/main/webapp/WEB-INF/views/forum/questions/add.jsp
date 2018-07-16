<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="../../refer.jsp" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>ITer_Club（艾特社区）</title>

        <link rel="stylesheet" href="${ctx}/resources/layui/css/layui.css">
        <link rel="stylesheet" href="${ctx}/resources/fly/css/global.css">
        <script src="${ctx}/resources/layui/layui.js"></script>
    </head>

    <body>

        <jsp:include page="../layoutbbs/header.jsp"></jsp:include>

        <div class="main layui-clear">
            <h2 class="page-title">发表问题</h2>

            <!-- <div class="fly-none">并无权限</div> -->

            <div class="layui-form layui-form-pane">
                <form action="${ctx}/forum/questions/add" method="post">
                    <div class="layui-form-item ">
                        <label for="L_title " class="layui-form-label ">标题</label>
                        <div class="layui-input-block ">
                            <input type="text " id="L_title " name="title" required lay-verify="required" autocomplete="off " class="layui-input ">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text ">
                        <div class="layui-input-block ">
                            <textarea id="L_content " name="content" required lay-verify="required" placeholder="请输入内容 " class="layui-textarea fly-editor " style="height: 260px; "></textarea>
                        </div>
                        <label for="L_content " class="layui-form-label " style="top: -2px; ">描述</label>
                    </div>
                    <div class="layui-form-item ">
                        <div class="layui-inline ">
                            <label class="layui-form-label ">悬赏金额</label>
                            <div class="layui-input-block ">
                                <select name="experience">
                                <option value="5 " selected>5</option>
                                <option value="20 ">20</option>
                                <option value="50 ">50</option>
                                <option value="100 ">100</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item ">
                        <button class="layui-btn" lay-filter="*" lay-submit>立即发布</button>
                    </div>
                </form>
            </div>
        </div>


        <jsp:include page="../layoutbbs/footer.jsp"></jsp:include>
        <script>
            layui.cache.page = 'jie';

            layui.config({
                version: "1.0.0 ",
                base: '../resources/fly/mods/'
            }).extend({
                fly: 'index'
            }).use('fly',function(){
                var fly = layui.fly;
                fly.layEditor({elem: '.fly-editor'});
            });
        </script>

    </body>

    </html>