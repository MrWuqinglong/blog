<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <script src="/static/jquery.min.js" charset="UTF-8"></script>
    <script src="/static/layui/lay/dest/layui.all.js" charset="UTF-8"></script>
</head>
<body>
<div id="panel">
<span class="layui-breadcrumb" lay-separator=">">
    <a><cite>首页</cite></a>
    <a><cite>管理博客</cite></a>
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
            <th>标题</th>
            <th>类别</th>
            <th>发表时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${blogList}" var="item">
            <tr>
                <td>
                    <a href="/blog/blogDetail.action?id=${item.id}">${item.title}</a>
                </td>
                <td>${item.category.name}</td>
                <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd"/></td>
                <td>
                    <div class="layui-btn-group">
                        <a class="layui-btn layui-btn-small edit">编辑</a>
                        <a class="layui-btn layui-btn-small delete">删除</a>
                        <input type="hidden" name="id" value="${item.id}">
                    </div>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
</div>
</body>
<script>
    $(function () {

        /* 编辑博文 */
        $(".layui-btn.layui-btn-small.edit").click(function () {
            var blogId = $(this).next().next().val();
            var url = "/blog/write.action";
            var data = {"id": blogId};
            $.get(url, data, function (result) {
                $("#panel").html(result);
            });
        });

        /* 删除博文 */
        $(".layui-btn.layui-btn-small.delete").click(function () {
            var blogId = $(this).next().val();
            var url = "/blog/delete.action";
            var data = {"id": blogId};
            $.post(url, data, function (result) {
                alert(result.message);
            });
        });
    });
</script>