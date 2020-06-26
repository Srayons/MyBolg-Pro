<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020-5-20
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台内嵌主页</title>
</head>
<body>
<h2>主页</h2>
<p>登录信息</p>
<p>${sessionScope.get("user").username}</p>
</body>
</html>
