<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <script src="/static/jquery.min.js" charset="UTF-8"></script>
    <script src="/static/layui/lay/dest/layui.all.js" charset="UTF-8"></script>
</head>
<body>

<%@ include file="header.jsp"%>

<div style="position:relative;width:1366px;margin:0 auto;">

    <div style="text-align: center;font-size: xx-large;margin-top: 20px;">
        关于我
    </div>
    <p style="margin-top: 20px;">
        ${user.about}
    </p>

</div>
</body>
</html>