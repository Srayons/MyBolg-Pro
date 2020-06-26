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
    <title>文章详情</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/update/" method="post">
        <label>
            <input type="text" name="id" value="${art.id}">
        </label>
        <label>
            <input type="text" name="title" value="${art.title}">
        </label>
        <label>
            <input type="text" name="content" value="${art.content}">
        </label>
            <input type="submit" value="提交">
    </form>
</body>
</html>
