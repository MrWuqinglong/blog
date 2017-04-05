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
    <a><cite>添加友情链接</cite></a>
</span>
<div style="margin-top: 10px;">
    <form action="" method="post" class="layui-form layui-form-pane">
        <input type="hidden" name="id" value="${link.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-block">
                <input type="text" name="title" lay-verify="required" placeholder="请输入标题"
                       class="layui-input" value="${link.title}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-block">
                <input type="url" name="target" lay-verify="required|url" placeholder="请输入标题"
                       class="layui-input" value="${link.target}">
            </div>
        </div>

        <div class="layui-form-item">
            <button type="button" class="layui-btn">保存</button>
        </div>
    </form>
</div>
</body>
<script>

    $(function () {

        $("button[type='button']").click(function () {
            var id = $("input[name='id']").val();
            var title = $("input[name='title']").val();
            var target = $("input[name='target']").val();
            var url = "/link/saveOrUpdateLink.action";
            var dataVal = {"id":id, "title":title, "target":target};
            $.post(url, dataVal, function(result) {
                alert(result.message);
                if (result.code === 1) {
                    window.location.reload();
                }
            });
            return false;
        });

    });

</script>
</html>