<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="../../refer.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title id="title"> {{title }} - OpenAuth.net官方社区</title>

    <link rel="stylesheet" href="${ctx}/resources/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/resources/fly/css/global.css">
    <script src="${ctx}/resources/jquery.js"></script>
    <script src="${ctx}/resources/layui/layui.js"></script>
    <script src="${ctx}/blljs/queryString.js"></script>
</head>

<body>
<%@ include file="../layoutbbs/header.jsp" %>


<script id="detail" type="text/html">
    {{#
    var rows = d.Result;
    }}

    {{#
    var userforum =layui.cache;
    }}

    {{# if(rows){
    var myself = rows.userforum.id == userforum.uid;
    }}
    <div class="main layui-clear">
        <div class="wrap">
            <div class="content detail">
                <h1>{{=rows.title}}</h1>
                <div class="fly-tip fly-detail-hint" data-id="{{rows.id}}">

                    {{ rows.stick > 0 ? '<span class="fly-tip-stick">置顶帖</span>' :'' }}
                    {{ rows.status == 1 ? '<span class="fly-tip-jing">精帖</span>' : ''}}
                    {{# if(rows.accept == undefined){ }}
                    <span>未结贴</span>
                    {{# } else{ }}
                    <span class="fly-tip-jie">已采纳</span>
                    {{# } }}

                    {{# if(userforum.auth == 1){ }}
                    <span class="jie-admin" type="del" style="margin-left: 20px;">删除</span>
                    {{# } }}

                    {{# if(userforum.auth == 1 || userforum.auth == 2){ }}
                    {{# if(rows.stick > 0){ }}
                    <span class="jie-admin" type="set" field="stick" rank="0" style="background-color:#ccc;">取消置顶</span>
                    {{# } else { }}
                    <span class="jie-admin" type="set" field="stick" rank="1">置顶</span>
                    {{# };
                    if(rows.status == 1){ }}
                    <span class="jie-admin" type="set" field="status" rank="0"
                          style="background-color:#ccc;">取消加精</span>
                    {{# } else { }}
                    <span class="jie-admin" type="set" field="status" rank="1">加精</span>
                    {{# };
                    } }}

                    <div class="fly-list-hint">
                        <i class="iconfont" title="回答">&#xe60c;</i> {{rows.comment}}
                        <i class="iconfont" title="人气">&#xe60b;</i> {{rows.hits}}
                    </div>
                </div>
                <div class="detail-about">
                    <a class="jie-user" href="${ctx}/forum/user/index?uid={{rows.userforum.id}}">
                        <img src="${ctx}{{rows.userforum.pic}}"
                             alt="{{rows.userforum.name}}">
                        <cite>
                            {{rows.userforum.name}}
                            {{# if(rows.userforum.rmb){ }}
                            <em style="padding:0 5px; color: #FF7200;">VIP{{rows.userforum.rmb}}</em>
                            {{# } }}
                            <em>发布于{{rows.time}}</em>
                            {{# }}
                        </cite>
                    </a>
                    <div class="detail-hits" data-id="{{rows.id}}">

                        <span style="color:#FF7200">悬赏：{{rows.experience}}飞吻</span>

                        {{# if((userforum && myself && rows.accept == undefined) || userforum.auth == 1){ }}
                        <span class="jie-admin" type="edit"><a
                                href="${ctx}/forum/questions/edit?id={{rows.id}}">编辑此贴</a></span>
                        {{# } }}

                    </div>
                </div>

                <div class="detail-body photos" style="margin-bottom: 20px;">
                    {{ rows.content }}
                </div>

                {{# var jieda = rows.answers; }}

                <a name="comment"></a>
                <h2 class="page-title">热忱回答<span>{{rows.comment > 0 ? ('（<em id="jiedaCount">'+rows.comment+'</em>）') : ''}}</span>
                </h2>

                <ul class="jieda photos" id="jieda">
                    {{# layui.each(jieda, function(index, item){
                    var myda = item.userforum.id == userforum.uid;
                    }}
                    <li data-id="{{item.id}}" {{item.id== rows.accept ?
                    'class="jieda-daan"' : '' }}>
                    <a name="item-{{item.time}}"></a>
                    <div class="detail-about detail-about-reply">
                        <a class="jie-user" href="${ctx}/forum/user/index?uid={{item.userforum.id}}">
                            <img src="${ctx}{{item.userforum.pic}}"
                                 alt="{{item.userforum.name}}">
                            <cite>
                                <i>{{item.userforum.name}}</i>
                                {{# if(item.userforum.rmb) { }}
                                <em style="padding:0 ; color: #FF7200;">VIP{{ item.userforum.rmb }}</em>
                                {{# } }}
                                {{# if(item.userforum.id == rows.userforum.id){ }}
                                <em>(楼主)</em>
                                {{# } else if(item.userforum.auth == 1) { }}
                                <em style="color:#5FB878">(管理员)</em>
                                {{# } else if(item.userforum.auth == 2) { }}
                                <em style="color:#FF9E3F">（活雷锋）</em>
                                {{# } else if(item.userforum.auth == -1) { }}
                                <em style="color:#999">（该号已被封）</em>
                                {{# } }}
                            </cite>
                        </a>
                        <div class="detail-hits">
                            <span>{{item.time}}</span>
                        </div>
                        {{# if(item.id == rows.accept){ }}
                        <i class="iconfont icon-caina" title="最佳答案"></i>
                        {{# } }}
                    </div>
                    <div class="detail-body jieda-body">
                        {{ item.content }}
                    </div>
                    <div class="jieda-reply">
                        <span type="reply"><i class="iconfont icon-svgmoban53"></i>回复</span>
                        {{# if(userforum.auth == 1 || userforum.auth == 2 || (userforum.uid && myself && !myda)){ }}
                        <div class="jieda-admin">
                            {{# if(userforum.auth == 1 || (userforum.auth == 2 && item.accept != 1)){ }}
                            <span type="edit">编辑</span>
                            <span type="del">删除</span>
                            {{# if(rows.accept == undefined){ }}
                            <span class="jieda-accept" type="accept">采纳 </span>
                            {{# } }}
                            {{# } }}
                            {{# if(rows.accept == undefined && !myda){ }}
                            <span class="jieda-accept" type="accept">采纳</span>
                            {{# } }}
                        </div>
                        {{# } }}
                    </div>
                    </li>
                    {{# }); if(jieda.length === 0){ }}
                    <li class="fly-none">没有任何回答</li>
                    {{# } }}
                </ul>


                <div class="layui-form layui-form-pane">
                    <form action="${ctx}/forum/questions/addAnswer" method="post">
                        <div class="layui-form-item layui-form-text">
                            <div class="layui-input-block">
                                <textarea id="L_content" name="content" required lay-verify="required"
                                          placeholder="我要{{myself ? '自问自答' : '回答'}}" class="layui-textarea fly-editor"
                                          style="height: 150px;">{{d.edit ? d.edit.content : ''}}</textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <input type="hidden" name="jid" value="{{rows.id}}">
                            <button class="layui-btn" lay-filter="*" lay-submit onclick="location.href=location.href">提交回答</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>

        <div class="edge">
            <h3 class="page-title">最近热帖</h3>
            <ol class="fly-list-one">
                无数据

            </ol>
        </div>
    </div>
    {{# } else { }}
    <h2 class="page-title">404</h2>
    <div class="fly-none">该问题并不存在，肯能已被删除</div>
    {{# } }}

</script>
<div id="details"></div>

<jsp:include page="../layoutbbs/footer.jsp"></jsp:include>
<script>
    layui.cache.page = 'jie';

    $.get("/forum/questions/getone", { //问题详情
        id: QueryString['id']
    }, function (data) {
        var obj = JSON.parse(data);

        layui.config({
            version: "1.0.0",
            base: '../resources/fly/mods/'
        }).extend({
            fly: 'index'
        }).use(['fly', 'jquery', 'vue', 'laytpl', 'form'], function () {
            var fly = layui.fly;
            var $ = layui.jquery;
            var laytpl = layui.laytpl;
            var form = layui.form();
            var vm = new Vue({
                el: "#title"
                , data: {
                    title: obj.Result.title
                }
            });

            var getTpl = $("#detail").html();
            laytpl(getTpl).render(obj, function (html) {
                $("#details").html(html);

                $('.detail-body').each(function () {
                    var othis = $(this),
                        html = othis.html();
                    othis.html(fly.content(html));
                });

                fly.layEditor({elem: '.fly-editor'});
            });
        });


//         $.get("/forum/questions/get", { //热贴
//             index: 1,
//             size: 8
//         }, function(data) {
//             var obj = JSON.parse(data);
//             var getTpl = $("#hotquestion").html();
//             laytpl(getTpl).render(obj, function(html) {
//                 $("#hotquestions").html(html);
//             });
//         });
    });
</script>

</body>

</html>