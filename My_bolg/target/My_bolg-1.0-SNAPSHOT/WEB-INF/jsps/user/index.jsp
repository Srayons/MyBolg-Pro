<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020-5-17
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理</title>
    <%@include file="/WEB-INF/jsps/common/common_css.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin_index.css">
</head>
<body>
<%--最左侧--%>
<div class="layui-row">
    <div id="admin_heard">
        <div class="layui-col-md2">
            <div id="admin_logo_heard_left">
                <img class="img_logo" src="${pageContext.request.contextPath}/static/img/favicon.ico" alt="LOGO">
                <a>后台管理</a>
                <img class="img_logo" style="display: none"
                     src="${pageContext.request.contextPath}/static/img/favicon.ico" alt="LOGO">
            </div>
        </div>
        <div class="layui-col-md10">
            <div id="admin_logo_heard_right">
                <ul id="admin_heard_left">
                    <li>
                        <a onclick="side_column(this)" title="侧栏">
                            <svg class="icon" aria-hidden="true">
                                <use id="celan" xlink:href="#iconcelanshouqi"></use>
                            </svg>
                        </a>
                        <a onclick="full_screen(this)" title="全屏">
                            <svg class="icon" aria-hidden="true">
                                <use id="quanping" xlink:href="#iconquanping"></use>
                            </svg>
                        </a>
                        <a onclick="refresh()" title="刷新">
                            <svg class="icon" aria-hidden="true">
                                <use id="shuxin" xlink:href="#iconshuaxin"></use>
                            </svg>
                        </a>
                        <a href="javascript:Home('${pageContext.request.contextPath}');" title="主页">
                            <svg class="icon" aria-hidden="true">
                                <use id="主页" xlink:href="#iconzhuye"></use>
                            </svg>
                        </a>
                    </li>
                </ul>

                <ul id="admin_heard_right">
                    <li>
                        <a title="消息">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#iconxiaoxi"></use>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/static/img/1.jpg" width="60px" height="30px">
                        <span>${sessionScope.get("user").username}</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="layui-col-md2">
        <div class="grid-demo grid-demo-bg1">
            <div id="admin_div">
                <ul>
                    <c:forEach items="${sessionScope.get('admin_menu')}" var="menu_one" varStatus="menuStatus">
                        <c:if test="${menu_one.m_pid==-1}">
                            <li onclick="admin_url('1','${pageContext.request.contextPath}${menu_one.m_url}',this)">
                                <span style="display:inline-block;float: left;padding-left: 20px">
                                    <svg class="icon icon_left_div" aria-hidden="true">
                                    <use xlink:href="${menu_one.m_icon}"/>
                                </svg>
                                </span>
                                <a>
                                        ${menu_one.m_name}
                                </a>
                                <span onclick="zhankai(this)" class="span_icon" id="span_icon"
                                      style="display:inline-block;float: right;padding-right: 20px">
                                    <svg class="icon icon_left_div" aria-hidden="true">
                                        <use class="icons" id="icons" xlink:href="#iconzhankai"/>
                                    </svg>
                                    <svg style="display:none;" class="icon" aria-hidden="true">
                                        <use xlink:href="${menu_one.m_icon}"/>
                                    </svg>
                                </span>

                                <dl id="dl_menu" style="display: none">
                                    <c:forEach items="${sessionScope.get('admin_menu')}" var="menu_two">
                                        <c:if test="${menu_one.id==menu_two.m_pid}">
                                            <dd onclick="admin_url('-1','${pageContext.request.contextPath}${menu_two.m_url}',this)">
                                                <span>
                                                    <svg class="icon icon_left_div" aria-hidden="true">
                                                    <use xlink:href="${menu_two.m_icon}"/>
                                                    </svg>
                                                </span>
                                                <a>${menu_two.m_name}</a>
                                                <c:if test="${menu_one.id!=menu_two.m_pid}">
                                                <span>
                                                    <svg class="icon icon_left_div" aria-hidden="true">
                                                    <use xlink:href="#iconzhankai"/>
                                                    </svg>
                                                </span>
                                                </c:if>
                                            </dd>
                                        </c:if>
                                    </c:forEach>
                                </dl>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <%--中间右侧--%>
    <div class="layui-col-md10">
        <div class="grid-demo">
            <div id="admin_iFrame">
                <iframe id="right_iFrame"></iframe>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/iconfont.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/static/common/admin_iFrame.js"></script>
<script>
    $(function () {
        check();
        admin_iFrame("${pageContext.request.contextPath}");
        admin_hover("${pageContext.request.contextPath}")
    });

</script>
</body>
</html>
