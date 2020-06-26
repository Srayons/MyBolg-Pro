<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020/5/6
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分类详情</title>
</head>
<body>
    <c:forEach items="${mas}" var="m">
        <li>
            <a href="/get/art/${m.id}">
                <p>
                    <font>文章标题：${m.title}</font>
                    <font>文章作者：${m.user.username}</font>
                    <font>所属菜单：${m.menu.name}</font>
                </p>
                <p>
                    文章内容：${m.content}
                </p>
            </a>
        </li>
    </c:forEach>
</body>
</html>
