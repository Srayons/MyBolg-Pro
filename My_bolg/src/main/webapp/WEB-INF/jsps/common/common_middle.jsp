<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="Art_id">
    <ul>
    <c:forEach items="${a.list}" var="as">
        <li>
            <a href="${pageContext.request.contextPath}/get/art/${as.id}.html" title="${as.title}">
                <div class="layui-col-md4">
                    <img id="img_Art" src="${pageContext.request.contextPath}/static/img/1.jpg">
                </div>

                <div class="layui-col-md6">
                    <span>
                        文章标题：${as.title}
                    </span><br>
                    <span style="font-size: 14px;float:right;">
                        文章作者：${as.user.username}
                    </span>
                    <span style="font-size: 14px;float:right;padding-right: 20px">
                        所属菜单：${as.menu.name}
                    </span>
                    <span>
                           文章内容：${fn:substring(as.contentTxt,0,20)}
                    </span>
                </div>
            </a>
        </li>
    </c:forEach>
    </ul>
</div>