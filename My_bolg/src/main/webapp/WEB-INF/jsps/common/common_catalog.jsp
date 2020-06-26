<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020-5-17
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="Art_Catalog">
    <span>当前页面所在的目录：
        <a id="menu_a" href="${pageContext.request.contextPath}/">首页&nbsp;&nbsp;>></a>
    </span>
    <c:forEach items="${a.list}" var="m_catalog" begin="0" end="0">
        <a href="${pageContext.request.contextPath}/get/menu/${m_catalog.menu.id}.html">
                ${m_catalog.menu.name}
        </a>
    </c:forEach>
    <c:if test="${art.menu.name!=null}">
        <a href="${pageContext.request.contextPath}/get/menu/${art.menu.id}.html">
                ${art.menu.name}
        </a>
        &nbsp;&nbsp;>>
        <a href="${pageContext.request.contextPath}/get/art/${art.id}.html">
                ${art.title}
        </a>
    </c:if>
</div>