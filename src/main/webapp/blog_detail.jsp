<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <input id="blogId" type="hidden" name="id" value="${blog.id}" />

    <div style="text-align: center;font-size: xx-large;margin-top: 20px;">
        ${blog.title}
    </div>
    <div style="margin-top: 20px;text-align: center;">
        ${blog.user.name}&nbsp;&nbsp;
        发表于&nbsp;<fmt:formatDate value="${blog.createTime}" pattern="yyyy-MM-dd" />&nbsp;&nbsp;
        类别:&nbsp;${blog.category.name}
    </div>
    <p style="margin-top: 20px;">
        ${blog.content}
    </p>

    <!-- 评论区 -->
    <div style="font-size: large;margin-top: 30px;">
        ${blog.comments.size()}个评论
        <hr>
    </div>
    <div>
        <c:forEach items="${blog.comments}" var="item">
            <fieldset class="layui-elem-field">
                <legend>
                    ${item.user.name}&nbsp;&nbsp;
                    发表于&nbsp;<fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd" />
                </legend>
                <div class="layui-field-box">
                    ${item.content}
                </div>
            </fieldset>
        </c:forEach>
    </div>

    <!-- 发表评论区 -->
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>发表评论</legend>
    </fieldset>
    <textarea class="layui-textarea" id="LAY_demo1" style="display: none">
    </textarea>
    <button class="layui-btn" id="addComment" style="margin-top: 5px;">发表评论</button>

</div>
<script>
   $(function(){

        var layedit = layui.layedit,$ = layui.jquery;

        //构建一个默认的编辑器
        layedit.build('LAY_demo1', {
            tool: ['strong' ,'italic' ,'underline' ,'del' ,'|', 'left', 'center', 'right']
            ,height: 100
        });

        //编辑器外部操作
        var active = {
            content: function(){
                alert(layedit.getContent(index)); //获取编辑器内容
            }
            ,text: function(){
                alert(layedit.getText(index)); //获取编辑器纯文本内容
            }
            ,selection: function(){
                alert(layedit.getSelection(index));
            }
        };

        $("#addComment").click(function () {
            alert("该功能暂时没有实现");
            return false;

            var blogId = $("blogId").val();
            var content = active.content();
            var url = "/comment/addComment.action";
            var data = {"blog.id":blogId, "content": content};
            $.post(url, data, function (result) {

            });
        });


    });
</script>

</body>
</html>