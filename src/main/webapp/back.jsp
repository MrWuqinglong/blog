<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
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
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;text-align: center;">
        <legend>个人中心</legend>
    </fieldset>
</div>
<div style="position:relative;width:1366px;margin:20px auto;">
    <div style="width: 20%;float: left;">
        <ul class="layui-nav layui-nav-tree" style="background-color: white;">
            <li class="layui-nav-item"><a href="/blog/write.action" style="color: black;">写博客</a></li><hr>
            <li class="layui-nav-item"><a href="/blog/list.action" style="color: black;">博客管理</a></li><hr>
            <li class="layui-nav-item"><a href="/link/addLink.action" style="color: black;">添加友情链接</a></li><hr>
            <li class="layui-nav-item"><a href="/link/list.action" style="color: black;">友情链接管理</a></li><hr>
            <li class="layui-nav-item"><a href="/message/list.action" style="color: black;">留言管理</a></li><hr>
            <li class="layui-nav-item"><a href="/user/profile.action" style="color: black;">个人资料</a></li><hr>
            <li class="layui-nav-item"><a href="/user/aboutMe.action" style="color: black;">关于我</a></li><hr>
        </ul>
    </div>
    <div id="frame" style="width: 80%;float: left;">
        <div style="font-size: xx-large;margin-top: 100px;margin-left: 300px;">Welcome ${user.name}.</div>
    </div>

</div>
<script>
    $(function () {

        $(".layui-nav-item a").click(function () {
            var target = $(this).attr("href");
            $.get(target, function (data) {
                $("#frame").html(data);
            });
            return false;
        });

    });
</script>
</body>
</html>
