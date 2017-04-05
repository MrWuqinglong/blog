<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <a><cite>管理友情链接</cite></a>
</span>
    <table class="layui-table">
        <colgroup>
            <col width="100">
            <col width="100">
            <col width="100">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>名称</th>
            <th>目标</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${links}" var="item">
            <tr>
                <td>
                    <a href="${item.target}">${item.title}</a>
                </td>
                <td>${item.target}</td>
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

        $(".layui-btn.layui-btn-small.edit").click(function () {
            var id = $(this).next().next().val();
            var url = "/link/addLink.action";
            var data = {"id": id};
            $.get(url, data, function (result) {
                $("#panel").html(result);
            });
        });

        $(".layui-btn.layui-btn-small.delete").click(function () {
            var $this = $(this);
            var id = $this.next().val();
            var url = "/link/delete.action";
            var data = {"id": id};
            $.post(url, data, function (result) {
                alert(result.message);
                $this.parent().parent().parent().hide();
            });
        });
    });
</script>