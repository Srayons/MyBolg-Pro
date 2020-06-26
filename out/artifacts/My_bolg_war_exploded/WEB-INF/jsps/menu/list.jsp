    <c:forEach items="${m}" var="ms">
        <li id="menu_li">
            <a href="/get/menu/${ms.id}">
                <svg class="icon" aria-hidden="true">
                <use xlink:href="${ms.iconname}"></use>
                </svg>
            ${ms.name}
            </a>
        </li>
    </c:forEach>
