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
    <a><cite>关于我</cite></a>
</span>
<div style="margin-top: 10px;">
    <form action="" method="post" class="layui-form layui-form-pane">
        <input type="hidden" value="${user.id}">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">编写自我介绍</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="demo">
                    ${user.about}
                </textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <button type="button" class="layui-btn">保存</button>
        </div>
    </form>
</div>
<script>
    $(function () {

        var layedit = layui.layedit;

        //构建一个默认的编辑器
        var index = layedit.build('demo', {
            tool: ['strong' ,'italic' ,'underline' ,'del' ,'|', 'left', 'center', 'right']
            ,height: 500
        });

        $("button[type='button']").click(function () {
            var id = $("input[type='hidden']").val();
            var about = layedit.getContent(index);
            var url = "/user/updateAbout.action";
            var dataVal = {"id":id, "about":about};
            $.post(url, dataVal, function (result) {
                alert(result.message);
                window.location.reload();
            });
            return false;
        });

    });
</script>
</body>
</html>