<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="../refer.jsp" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>OpenAuth.net官方社区 - 最好用的.net权限工作流框架</title>
        <meta name="Keywords" content="openauth.net,Openauth,权限管理,工作流,workflow">
        <meta name="Description" content="openauth.net,openauth,权限管理，工作流,workflow">
        <link rel="stylesheet" href="${ctx}/resources/layui/css/layui.css">
        <link rel="stylesheet" href="${ctx}/resources/fly/css/global.css">
        <script src="${ctx}/resources/layui/layui.js"></script>
        <script src="${ctx}/resources/jquery.js"></script>

    </head>

    <body>

        <jsp:include page="layoutbbs/header.jsp"></jsp:include>

        <div class="main layui-clear">
            <div class="wrap">
                <div class="content">
                    <div class="fly-tab">
                        <span>
                          <a href="${ctx}/forum/club/index">全部</a>
                          <a href="${ctx}/forum/club/index?type=unresolved">未结帖</a>
                          <a href="${ctx}/forum/club/index?type=resolved">已采纳</a>
                          <a href="${ctx}/forum/club/index?type=wonderful">精帖</a>
                        </span>
                        <form action="http://cn.bing.com/search" class="fly-search">
                            <i class="iconfont icon-sousuo"></i>
                            <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
                        </form>
                        <a href="${ctx}/forum/questions/add" class="layui-btn jie-add">发布问题</a>
                    </div>


                    <ul class="fly-list">
                        <script id="question" type="text/html">
                            <ul>
                                {{# layui.each(d.Result.objects, function(index, item){ }}
                                <li class="fly-list-li">
                                    <a href="${ctx}/forum/userforum/index?uid={{item.userforum.id}}" class="fly-list-avatar">
                                        <img src="${ctx}/resources/fly/images/avatar/{{item.userforum.pic}}" alt="">
                                    </a>
                                    <h2 class="fly-tip">
                                        <a href="${ctx}/forum/questions/detail?id={{ item.id }}">{{ item.title }}</a>
                                        {{ item.stick > 0 ? '<span class="fly-tip-stick">置顶</span>' :'' }}
                                        {{ item.status == 1 ? '<span class="fly-tip-jing">精帖</span>' : ''}}
                                    </h2>
                                    <p>
                                        <span><a href="#">{{ item.userforum.name }}</a></span>
                                        <span>{{item.time}} </span>
                                        <span>OpenAuth.Net框架综合</span>
                                        <span class="fly-list-hint">
                                            <i class="iconfont" title="回答">&#xe60c;</i> {{ item.comment }}
                                            <i class="iconfont" title="人气">&#xe60b;</i> {{ item.hits }}
                                        </span>
                                    </p>
                                </li>
                                {{# }); }} {{# if(d.Result.total === 0){ }} 无数据 {{# } }}
                            </ul>
                        </script>
                        <div id="questions"></div>
                    </ul>

                    <div id="pager"></div>
                </div>
            </div>
            <div class="edge">


                <h3 class="page-title">新注册用户</h3>
                <div class="userforum-looklog leifeng-rank">
                    <span>
                         <script id="userforum" type="text/html">
                            <ul>
                                {{# layui.each(d.Result.objects, function(index, item){ }}
                                 <a href="${ctx}/forum/userforum/index?uid={{item.id}}">
                                <img src="${ctx}/resources/fly/images/avatar/{{ item.pic }}">
                                <cite>{{ item.name }}</cite>
                                <i>{{ item.answercnt }}次回答</i>
                                </a>
                                {{# }); }} {{# if(d.Result.total === 0){ }} 无数据 {{# } }}
                            </ul>
                        </script>
                        <div id="userforums"></div>
                  </span>
                </div>

                <h3 class="page-title">最近热帖</h3>
                <ol class="fly-list-one">
                    <script id="hotquestion" type="text/html">
                        <ul>
                            {{# layui.each(d.Result.objects, function(index, item){ }}
                            <li>
                                <a href="${ctx}/forum/questions/detail?id={{ item.id }}">{{ item.title }}</a>
                                <span><i class="iconfont">&#xe60b;</i> {{ item.hits }}</span>
                            </li>
                            {{# }); }} {{# if(d.Result.total === 0){ }} 无数据 {{# } }}
                        </ul>
                    </script>
                    <div id="hotquestions"></div>


                </ol>


                <div class="fly-link">
                    <span>友情链接：</span>
                    <a href="http://www.layui.com/" target="_blank">Layui</a>
                    <a href="http://www.openauth.me/" target="_blank">openauth.me</a>
                    <a href="http://layer.layui.com/" target="_blank">layer</a>
                </div>


            </div>
        </div>

        <jsp:include page="layoutbbs/footer.jsp"></jsp:include>
        <script src="${ctx}/blljs/queryString.js"></script>
        <script src="${ctx}/blljs/statistics.js"></script>
        <script src="${ctx}/blljs/clubindex.js"></script>
        <script>
            layui.cache.page = '';

            layui.config({
                version: "1.0.0",
                base: '../resources/fly/mods/'
            }).extend({
                fly: 'index'
            }).use('fly');
        </script>

    </body>

    </html>