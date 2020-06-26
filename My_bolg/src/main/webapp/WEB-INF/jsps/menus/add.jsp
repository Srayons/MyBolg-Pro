<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020-5-25
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/jsps/common/common_css.jsp" %>
    <script src="${pageContext.request.contextPath}/static/js/iconfont.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/menus/add.js"></script>
</head>
<style>
    label{
        display: block;
    }
</style>
<body>
<form id="AddMenu">
    <label>
        <input type="text" name="m_name" value="">
    </label>
    <label>
        <select name="m_pid">
            <option value="-1">顶级目录</option>
            <c:forEach items="${sessionScope.get('admin_menu')}" var="a_one">
                <c:if test="${a_one.m_pid=='-1'}">
                    <option value="${a_one.id}">${a_one.m_name}</option>
                </c:if>
            </c:forEach>
        </select>
    </label>
    <label>
        <input type="text" name="m_url" value="">
    </label>
    <label>
        <input type="text" name="m_icon" value="">
    </label>
    <label>
        <input type="text" name="m_sort" value="">
    </label>
    <label>
        <input id="addSubmit" type="button" value="添加">
        <input type="button" value="取消">
    </label>
</form>
</body>
</html>
