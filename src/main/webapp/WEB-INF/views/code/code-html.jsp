<%--
  Created by IntelliJ IDEA.
  User: 11655
  Date: 7/16/2018
  Time: 6:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="UTF-8" %>
<%@ include file="../refer.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>ITer_Club（艾特社区）</title>
    <link rel="stylesheet" href="${ctx}/css/materialize.min.css"/>
    <link rel="stylesheet" href="${ctx}/css/codemirror.css"/>
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/materialize.min.js"></script>
    <script src="${ctx}/js/codemirror.js"></script>
    <link>
</head>
<body>
<%@ include file="../top.jsp" %>

<div class="container" style=" margin-top: 30px;">
    <div class="row">

        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <form class="form-inline">
                        <div class="row">
                            <div class="col-xs-3">
                                <button type="button" onclick="resetCode()" class="btn btn-default">重置代码：
                                </button>
                            </div>
                            <div class="col-xs-3" style=" margin-top: 7px;">
                                <input type="checkbox"
                                       id="html" ${type eq "html" ? "checked='checked' disabled='disabled'" :""}/>
                                <label for="html"
                                       onclick="${type ne "html" ? "location.href='/code/method=html'" : ""}">HTML</label>
                            </div>

                            <div class="col-xs-3" style=" margin-top: 7px;">
                                <input type="checkbox"
                                       id="java" ${type eq "java" ? "checked='checked' disabled='disabled'" :""}/>
                                <label for="java"
                                       onclick="${type ne "java" ? "location.href='/code/method=java'" : ""}">JAVA</label>
                            </div>

                            <div class="col-xs-3 text-right">
                                <button type="button" class="btn btn-success" ${type eq "html" ? "onclick='submitTryit()'" : ""}
                                        id="submitBTN">
                                    <span class="glyphicon glyphicon-send"></span> 点击运行
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-body">
			<textarea class="form-control" id="textareaCode" name="textareaCode" style="display: none">
            </textarea>

                </div>
            </div>
        </div>

        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <form class="form-inline">
                        <button type="button" class="btn btn-default">运行结果</button>
                    </form>
                </div>
                <div class="panel-body">
                    <div id="iframewrapper">
                        <iframe frameborder="0" id="iframeResult" style="height:500px;width: 600px"></iframe>
                    </div>
                </div>
            </div>
        </div>

    </div>


</div>
<script type="text/javascript">
    <c:if test="${type eq 'html'}">

    var mixedMode = {
        name: "htmlmixed",
        scriptTypes: [{
            matches: /\/x-handlebars-template|\/x-mustache/i,
            mode: null
        },
            {
                matches: /(text|application)\/(x-)?vb(a|script)/i,
                mode: "vbscript"
            }]
    };
    var editor = CodeMirror.fromTextArea(document.getElementById("textareaCode"), {
        mode: mixedMode,
        selectionPointer: true,
        lineNumbers: false,
        matchBrackets: true,
        indentUnit: 4,
        indentWithTabs: true
    });

    window.addEventListener("resize", autodivheight);

    var x = 0;

    function autodivheight() {
        var winHeight = 0;
        if (window.innerHeight) {
            winHeight = window.innerHeight;
        } else if ((document.body) && (document.body.clientHeight)) {
            winHeight = document.body.clientHeight;
        }
        //通过深入Document内部对body进行检测，获取浏览器窗口高度
        if (document.documentElement && document.documentElement.clientHeight) {
            winHeight = document.documentElement.clientHeight;
        }
        height = winHeight * 0.68
        editor.setSize('100%', height);
        document.getElementById("iframeResult").style.height = height + "px";
    }

    function resetCode() {
        var initCode = "<h3>Hello World !</h3>"
        editor.getDoc().setValue(initCode);
        submitTryit();
    }

    function submitTryit() {
        var text = editor.getValue();
        var patternHtml = /<html[^>]*>((.|[\n\r])*)<\/html>/im
        var patternHead = /<head[^>]*>((.|[\n\r])*)<\/head>/im
        var array_matches_head = patternHead.exec(text);
        var patternBody = /<body[^>]*>((.|[\n\r])*)<\/body>/im;

        var array_matches_body = patternBody.exec(text);
        var basepath_flag = 1;
        var basepath = '';
        if (basepath_flag) {
            basepath = '';
        }
        if (array_matches_head) {
            text = text.replace('<head>', '<head>' + basepath);
        } else if (patternHtml) {
            text = text.replace('<html>', '<head>' + basepath + '</head>');
        } else if (array_matches_body) {
            text = text.replace('<body>', '<body>' + basepath);
        } else {
            text = basepath + text;
        }
        var ifr = document.createElement("iframe");
        ifr.setAttribute("frameborder", "0");
        ifr.setAttribute("width", "500px");
        ifr.setAttribute("id", "iframeResult");
        document.getElementById("iframewrapper").innerHTML = "";
        document.getElementById("iframewrapper").appendChild(ifr);

        var ifrw = (ifr.contentWindow) ? ifr.contentWindow : (ifr.contentDocument.document) ? ifr.contentDocument.document : ifr.contentDocument;
        ifrw.document.open();
        ifrw.document.write(text);
        ifrw.document.close();
        autodivheight();
    }

    submitTryit();
    autodivheight();

    </c:if>
    <c:if test="${type eq 'java'}">

    var editor = CodeMirror.fromTextArea(document.getElementById("textareaCode"), {
        lineNumbers: false,
        matchBrackets: true,
        mode: "text/x-java",
        indentUnit: 4,
        indentWithTabs: true
    });

    var ifr = document.createElement("iframe");
    ifr.setAttribute("frameborder", "0");
    ifr.setAttribute("id", "iframeResult");
    ifr.setAttribute("width", "500px");
    document.getElementById("iframewrapper").innerHTML = "";
    document.getElementById("iframewrapper").appendChild(ifr);
    var ifrw = (ifr.contentWindow) ? ifr.contentWindow : (ifr.contentDocument.document) ? ifr.contentDocument.document : ifr.contentDocument;
    ifrw.document.open();
    ifrw.document.write("");
    ifrw.document.close();
    btn = $("#submitBTN");
    editor.on("change", function (editor, change) {
        btn.prop('disabled', false);
    });
    btn.click(function () {
        btn.prop('disabled', true);
        code = editor.getValue();
        loadingdata = '<img src="${ctx}/image/loading.gif">';
        ifrw.document.open();
        ifrw.document.write(loadingdata);
        ifrw.document.close();
        $.post("${ctx}/code/java/compile", {code: code}, function (data) {
            // text = data.output.replace(/\r\n|\r|\n/g, "<br />") + data.errors;
            debugger
            test=data.result
            ifrw.document.open();
            ifrw.document.write('<h5>' + test + '</h5>');
            ifrw.document.close();
        });
        setTimeout(function () {
            btn.prop('disabled', false);
        }, 10 * 1000);
        autodivheight();
    })
    autodivheight();
    window.addEventListener("resize", autodivheight);

    function autodivheight() {
        var winHeight = 0;
        if (window.innerHeight) {
            winHeight = window.innerHeight;
        } else if ((document.body) && (document.body.clientHeight)) {
            winHeight = document.body.clientHeight;
        }
        //通过深入Document内部对body进行检测，获取浏览器窗口高度
        if (document.documentElement && document.documentElement.clientHeight) {
            winHeight = document.documentElement.clientHeight;
        }
        height = winHeight * 0.68
        editor.setSize('100%', height);
        document.getElementById("iframeResult").style.height = height + "px";
    }

    function resetCode() {
        var initCode = "public class HelloWorld {\n" +
            "    public static void main(String []args) {\n" +
            "       System.out.println(\"Hello World\");\n" +
            "\t\t\n" +
            "    }\n" +
            "}\n"
        editor.getDoc().setValue(initCode);
        submitTryit();
    }
    function submitTryit() {
        $("#submitBTN").click()
    }
    </c:if>
    resetCode()

</script>
<script>

</script>
</body>
</html>
