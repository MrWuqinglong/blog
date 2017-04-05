<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <script src="/static/jquery.min.js" charset="UTF-8"></script>
    <script src="/static/layui/lay/dest/layui.all.js" charset="UTF-8"></script>
</head>
<body>
<span class="layui-breadcrumb" lay-separator=">">
    <a><cite>首页</cite></a>
    <a><cite>个人资料</cite></a>
</span>
<div style="margin-top: 10px;">
    <form action="" method="post" class="layui-form layui-form-pane">
        <input type="hidden" value="${user.id}">
        <div class="layui-form-item" style="width: 500px;">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="required" value="${user.name}"
                       placeholder="请输入用户名" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男">
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item" style="width: 500px;">
            <label class="layui-form-label">出生日期</label>
            <div class="layui-input-block">
                <input class="layui-input" lay-verify="required" placeholder="请选择出生日期" name="birthDay"
                       onclick="layui.laydate({elem: this, format: 'YYYY-MM-DD'})">
            </div>
        </div>
        <div class="layui-form-item" style="width: 500px;">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <input type="tel" name="mobile" lay-verify="required|phone" value="${user.mobile}"
                       placeholder="请输入手机号" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="width: 500px;">
            <label class="layui-form-label">现居住地</label>
            <div class="layui-input-block">
                <input type="text" name="currentTown" lay-verify="required" value="${user.currentTown}"
                       placeholder="请输入现居住地" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center;">
            <button type="button" lay-submit="" class="layui-btn" lay-filter="demo">保存</button>
        </div>
    </form>
</div>
</body>
<script>

    $(function () {

        $("button[type='button']").click(function () {
            alert("该功能暂未实现");
            return false;
        });

    });

</script>
</html>