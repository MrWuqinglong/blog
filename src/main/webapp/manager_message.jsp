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
    <a><cite>管理留言</cite></a>
</span>
<table class="layui-table">
    <colgroup>
        <col width="300">
        <col width="100">
        <col width="100">
        <col width="100">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>内容</th>
        <th>姓名</th>
        <th>邮箱</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${message}" var="item">
        <tr>
            <td>${item.content}</td>
            <td>${item.name}</td>
            <td>${item.email}</td>
            <td>
                <div class="layui-btn-group">
                    <button class="layui-btn layui-btn-small delete">删除</button>
                    <input type="hidden" value="${item.id}">
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<script>

    $(function () {

        $(".layui-btn.layui-btn-small.delete").click(function () {
            var $this = $(this);
            var id = $this.next().val();
            var url = "/message/delete.action";
            var data = {"id":id};
            $.post(url, data, function (result) {
                alert(result.message);
                $this.parent().parent().parent().hide();
            });
            return false;
        });

    });

</script>
</html>