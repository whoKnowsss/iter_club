<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="refer.jsp" %>
<!doctype  html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>ITer_Club（艾特社区）</title>
</head>
<body onload="getAll()">

<script>
    function getAll() {
        location.href="${ctx}/course/selectAll";
    }
    getAll();
</script>
</body>
</html>
