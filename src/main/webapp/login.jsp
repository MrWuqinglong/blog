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
<div style="position:relative;width:1366px;margin: 100px auto auto 500px;">
    <fieldset class="layui-elem-field" style="width: 600px;">
        <legend>登录系统</legend>
        <div class="layui-field-box">
            <form action="/user/doLogin.action" method="post" class="layui-form layui-form-pane">
                <div class="layui-form-item" style="width: 500px;">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" required="required" placeholder="请输入用户名" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="width: 500px;">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" required="required" placeholder="请输入密码" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="text-align: center;">
                    <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo">登录</button>
                    <a href="/user/register.action" class="layui-btn">注册</a>
                </div>
            </form>
        </div>
    </fieldset>
</div>
</body>
<script>
    $(function () {
        var form = layui.form();

        form.on('submit(demo)', function (data) {
            var dataVal = data.field;
            var url = "/user/doLogin.action";
            $.post(url, dataVal, function (result) {
               if (result.code === 1) {
                   window.location = "/user/userIndex.action";
               } else {
                   alert(result.message)
               }
            });
            return false;
        });
    });
</script>
</html>
