<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<div style="position:relative;width:1366px;margin:0 auto;">
    <ul class="layui-nav">
        <li class="layui-nav-item"><a href="/user/userIndex.action">网站主页</a></li>
        <li class="layui-nav-item"><a href="/message/message.action">给我留言</a></li>
        <li class="layui-nav-item"><a href="/user/aboutMe.action">关于我</a></li>
        <li class="layui-nav-item" style="float: right;">
            <a href="javascript:void(0);"><cite>${user.name}</cite></a>
        </li>
        <li class="layui-nav-item" style="float: right;">
            <a href="/user/back.action">个人主页</a>
        </li>
        <li class="layui-nav-item" style="float: right;">
            <a href="/user/logout.action">退出</a>
        </li>
    </ul>
</div>
