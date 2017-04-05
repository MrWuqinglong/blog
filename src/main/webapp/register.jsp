<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
        <legend>注册账号</legend>
        <div class="layui-field-box">
            <form action="/user/doRegister.action" method="post" class="layui-form layui-form-pane">
                <div class="layui-form-item" style="width: 500px;">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" lay-verify="required" placeholder="请输入用户名" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="width: 500px;">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" lay-verify="required" placeholder="请输入密码" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="width: 500px;">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="confirmPassword" lay-verify="required" placeholder="请再次输入密码" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="男" title="男" checked>
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
                        <input type="tel" name="mobile" lay-verify="required|phone" placeholder="请输入手机号" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="width: 500px;">
                    <label class="layui-form-label">现居住地</label>
                    <div class="layui-input-block">
                        <input type="text" name="currentTown" lay-verify="required" placeholder="请输入现居住地" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item" style="text-align: center;">
                    <button type="submit" lay-submit="" class="layui-btn" lay-filter="demo">注册</button>
                </div>
            </form>
        </div>
    </fieldset>

</div>
</body>
<script>
    $(function(){
        var laydate = layui.laydate
            ,$ = layui.jquery;
        var form = layui.form();

        form.on('submit(demo)', function (data) {
            var dataVal = data.field;
            var url = "/user/doRegister.action";
            $.post(url, dataVal, function (result) {
                alert(result.message);
                if (result.code === 1) {
                    window.location = "/user/login.action";
                }
            });
            return false;
        });
    });
</script>
</html>