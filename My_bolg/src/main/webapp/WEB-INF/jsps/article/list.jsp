<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020/5/6
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${art.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/head.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/favicon.ico">
</head>
<body>
<%--中间左侧--%>
<div class="layui-row">
    <%--头部_开始--%>
    <%@ include file="/WEB-INF/jsps/common/common_heard.jsp" %>
    <%--头部_结束--%>
    <div class="layui-col-md9">
        <div class="grid-demo grid-demo-bg1">
            <%@include file="/WEB-INF/jsps/common/common_catalog.jsp" %>
            <%--中间展示层--%>
            <div id="Get_Art_id">
                <p>作者：${art.user.username}</p>
                <p>${art.content}</p>
            </div>
            <%--<iframe src="https://music.163.com/#/search/m/?s=%E5%8C%97%E4%BA%AC"></iframe>--%>
        </div>
    </div>
    <%--中间右侧--%>
    <div class="layui-col-md3">
        <div class="grid-demo">

        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/iconfont.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
</body>
</html>
