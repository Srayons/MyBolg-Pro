<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020/4/16
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>程柳香的个人博客</title>
    <%@include file="/WEB-INF/jsps/common/common_css.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/head.css">
</head>
<body>
<%--中间左侧--%>
<div class="layui-row">
    <%--头部_开始--%>
    <%@ include file="/WEB-INF/jsps/common/common_heard.jsp" %>
    <%--头部_结束--%>
    <div class="layui-col-md8">
        <div class="grid-demo grid-demo-bg1">
            <%@include file="/WEB-INF/jsps/common/common_catalog.jsp"%>
            <%--中间展示层--%>
            <%@include file="/WEB-INF/jsps/common/common_middle.jsp" %>
            <%--尾部--分页--%>
            <%@include file="/WEB-INF/jsps/common/common_pageInfo.jsp" %>
            <%--<iframe src="https://music.163.com/#/search/m/?s=%E5%8C%97%E4%BA%AC"></iframe>--%>
        </div>
    </div>
    <%--中间右侧--%>
    <div class="layui-col-md4">
        <div class="grid-demo">

        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/iconfont.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/static/common/common_pageInfo.js"></script>
<script src="${pageContext.request.contextPath}/static/common/present_catalog.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer
            , form = layui.form;
    });
</script>
</body>
</html>
