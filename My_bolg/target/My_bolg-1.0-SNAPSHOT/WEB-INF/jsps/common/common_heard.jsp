<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%--头部--%>
<div class="header-div">
    <ul>
        <img id="img_logo" src="${pageContext.request.contextPath}/static/img/favicon.ico" alt="LOGO">
        <a id="fonts" href="${pageContext.request.contextPath}/">${logoName}程柳香的个人博客</a>
        <a href="${pageContext.request.contextPath}/user/login.html">...</a>
        <c:forEach items="${m}" var="ms">
            <li id="menu_li">
                <a href="${pageContext.request.contextPath}/get/menu/${ms.id}.html">
                    <svg class="icon" aria-hidden="true">
                    <use xlink:href="${ms.iconname}"></use>
                    </svg>
                ${ms.name}
                </a>
            </li>
        </c:forEach>
    </ul>
</div>
