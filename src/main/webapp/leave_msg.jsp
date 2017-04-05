<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <div style="text-align: center;font-size: xx-large;margin-top: 20px;">
        给我留言
    </div>
    <div style="margin-top: 50px;">
        <form action="" method="post" class="layui-form layui-form-pane">
            <div class="layui-form-item" style="width: 500px;">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required="required" placeholder="请输入姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="width: 500px;">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input type="email" name="email" required="required" placeholder="请输入姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text" style="width: 500px;">
                <label class="layui-form-label">留言内容</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" name="content" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo">提交</button>
            </div>
        </form>
    </div>

</div>
</body>
<script>
    $(function(){
        var $ = layui.jquery;
        var form = layui.form();

        form.on('submit(demo)', function (data) {
            var dataVal = data.field;
            var url = "/message/addMessage.action";
            $.post(url, dataVal, function (result) {
                alert(result.message);
                window.location = "/user/userIndex.action";
            });
            return false;
        });
    });
</script>
</html>
