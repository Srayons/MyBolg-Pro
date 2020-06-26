<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020/4/16
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>程柳香的个人博客</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/head.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/favicon.ico">
</head>
<body>
<%--中间左侧--%>
<div class="layui-row">
    <%--头部--%>
    <div class="header-div">
        <ul>
            <img id="img_logo" src="${pageContext.request.contextPath}/static/img/favicon.ico" alt="LOGO">
            <font id="fonts">${logoName}程柳香的个人博客</font>
            <%@ include file="/WEB-INF/jsps/menu/list.jsp" %>
        </ul>
    </div>
    <div class="layui-col-md9">
        <div class="grid-demo grid-demo-bg1">
            <div id="Art_id">
                <ul>
                    <c:forEach items="${a}" var="as">
                        <li>
                            <a href="/get/art/${as.id}">
                                <p>
                                    <font>文章标题：${as.title}</font>
                                    <font>文章作者：${as.user.username}</font>
                                    <font>所属菜单：${as.menu.name}</font>
                                </p>
                                <p>
                                    文章内容：${fn:substring(as.content,0,15)}
                                </p>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <%--<iframe src=""></iframe>--%>
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
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.0.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer
            , form = layui.form;
        $(function () {
            
        })
    });
</script>
</body>
</html>
