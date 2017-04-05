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
    <a><cite>写博客</cite></a>
</span>
<div style="margin-top: 10px;">
    <form action="" method="post" class="layui-form layui-form-pane">
        <input type="hidden" name="id" value="${blog.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" lay-verify="required" placeholder="请输入标题"
                       class="layui-input" value="${blog.title}">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">编写博客内容</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="content" id="demo">
                    ${blog.content}
                </textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">选择分类</label>
            <div class="layui-input-inline" style="width: 200px;">
                <select name="category">
                    <option value="">请选择分类</option>
                    <c:forEach items="${categories}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
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
        var layedit = layui.layedit;
        var form = layui.form();

        //构建一个默认的编辑器
        var index = layedit.build('demo', {
            tool: ['strong' ,'italic' ,'underline' ,'del' ,'|', 'left', 'center', 'right']
            ,height: 500
        });

        $("button[type='button']").click(function () {
            var id = $("input[name='id']").val();
            var title = $("input[name='title']").val();
            var content = layedit.getContent(index);
            var category = $("select[name='category'] option:selected").val();
            var url = "/blog/saveOrUpdateBlog.action";
            var dataVal = {"id":id, "title":title, "content":content, "category.id": category};
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