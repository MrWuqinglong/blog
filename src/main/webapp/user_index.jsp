<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <script src="/static/jquery.min.js" charset="UTF-8"></script>
    <script src="/static/layui/lay/dest/layui.all.js" charset="UTF-8"></script>
</head>
<body>

<%@ include file="header.jsp"%>

<div style="position:relative;width:1366px;margin:20px auto;">
    <div style="width: 80%;float: left;">

        <c:forEach items="${blogs}" var="item">
            <div style="font-size: xx-large;text-align: center;">${item.title}</div>
            <div style="font-size: xx-small;text-align: center;margin-top: 5px;">
                ${item.user.name}&nbsp;&nbsp;
                发表于&nbsp;&nbsp;
                <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
                类别:&nbsp;${item.category.name}
            </div>
            <p style="margin-top: 10px;">
                ${fn:substring(item.content, 0, 200)}
            </p>
            <div style="text-align: center;margin-top: 10px;">
                <a href="/blog/blogDetail.action?id=${item.id}" class="layui-btn layui-btn-radius">继续阅读</a>
            </div>
            <hr>
        </c:forEach>

    </div>
    <div style="width: 20%;float: left;">
        <div style="text-align: center;font-size: large;">
            热门评论
        </div>
        <hr>
        <ul>
            <c:forEach items="${commentsBlog}" var="item">
                <li><a href="/blog/blogDetail.action?id=${item.id}">${item.title}</a></li>
            </c:forEach>
        </ul>

        <div style="text-align: center;font-size: large;margin-top: 20px;">
            友情链接
        </div>
        <hr>
        <ul>
            <c:forEach items="${links}" var="item">
                <li><a href="${item.target}">${item.title}</a></li>
            </c:forEach>
        </ul>
    </div>

</div>

</body>
</html>
