<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020-5-24
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/jsps/common/common_css.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/table.css">
</head>
<body>
<div class="layui-row">
    <div id="admin_iFrame_div">
        <form id="m_from" action="${pageContext.request.contextPath}/menu/m_list.html" method="post">
            <label>菜单名称</label>
            <label>
                <input name="m_name" type="text"/>
            </label>
            <label>菜单上级</label>
            <label>
                <input name="m_pid" type="text"/>
            </label>
            <label>菜单创建时间</label>
            <label>
                <input name="m_createDate" type="text"/>
            </label>
            <label>
                <a name="iFrame_select" class="iFrame_submit">
                    <svg class="icon icon_left_div" aria-hidden="true">
                        <use xlink:href="#iconchaxun"/>
                    </svg>
                </a>
            </label>
            <label>
                <a name="iFrame_add" class="iFrame_submit">
                    <svg class="icon icon_left_div" aria-hidden="true">
                        <use xlink:href="#icontianjia"/>
                    </svg>
                </a>
            </label>
        </form>
    </div>
    <div id="admin_iFrame_table">
        <table id="menuTable">
            <tr>
                <td>菜单名称</td>
                <td>菜单地址</td>
                <td>菜单上级</td>
                <td>菜单图标</td>
                <td>菜单序号</td>
                <td>创建菜单时间</td>
                <td colspan="3">操作</td>
            </tr>
            <c:forEach items="${a}" var="a_m_one">
                <c:if test="${a_m_one.m_pid=='-1'}">
                    <tr>
                        <td>${a_m_one.m_name}</td>
                        <td>${a_m_one.m_url}</td>
                        <td>
                            <c:if test="${a_m_one.m_pid=='-1'}">
                                顶级目录
                            </c:if>
                        </td>
                        <td>
                            <svg class="icon icon_left_div" aria-hidden="true">
                                <use xlink:href="${a_m_one.m_icon}"/>
                            </svg>
                        </td>
                        <td>${a_m_one.m_sort}</td>
                        <td>
                            <frm:formatDate value="${a_m_one.m_createDate}" pattern="yyyy-MM-dd" var="m_createDate"/>
                                ${m_createDate}
                        </td>
                        <td>
                            <a class="menuEdit" title="修改">
                                <input type="hidden" value="${a_m_one.id}"/>
                                <svg class="icon icon_left_div" aria-hidden="true">
                                    <use xlink:href="#iconxiugai"/>
                                </svg>
                            </a>
                        </td>
                        <td>
                            <a class="menuDel" title="删除">
                                <svg class="icon icon_left_div" aria-hidden="true">
                                    <use xlink:href="#iconshanchu"/>
                                </svg>
                            </a>
                        </td>
                        <td hidden>${a_m_one.id}</td>
                    </tr>
                    <c:forEach items="${a}" var="a_m_two">
                        <c:if test="${a_m_one.id==a_m_two.m_pid}">
                        <tr>
                            <td>${a_m_two.m_name}</td>
                            <td>${a_m_two.m_url}</td>
                            <td>${a_m_one.m_name}</td>
                            <td>
                                <svg class="icon icon_left_div" aria-hidden="true">
                                    <use xlink:href="${a_m_two.m_icon}"/>
                                </svg>
                            </td>
                            <td>${a_m_two.m_sort}</td>
                            <td>
                                <frm:formatDate value="${a_m_two.m_createDate}" pattern="yyyy-MM-dd" var="m_createDate"/>
                                    ${m_createDate}
                            </td>
                            <td>
                                <a class="menuEdit" title="修改">
                                    <svg class="icon icon_left_div" aria-hidden="true">
                                        <use xlink:href="#iconxiugai"/>
                                    </svg>
                                </a>
                            </td>
                            <td>
                                <a class="menuDel" title="删除">
                                    <svg class="icon icon_left_div" aria-hidden="true">
                                        <use xlink:href="#iconshanchu"/>
                                    </svg>
                                </a>
                            </td>
                            <td hidden>${a_m_two.id}</td>
                        </tr>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${a_m_one.m_pid!='-1'}">
                    <tr class="iFrame_menu_pid" style="display: none">
                        <td>${a_m_one.m_name}</td>
                        <td>${a_m_one.m_url}</td>
                        <td>
                            <c:if test="${a_m_one.m_pid=='-1'}">
                                顶级目录
                            </c:if>
                        </td>
                        <td>
                            <svg class="icon icon_left_div" aria-hidden="true">
                                <use xlink:href="${a_m_one.m_icon}"/>
                            </svg>
                        </td>
                        <td>${a_m_one.m_sort}</td>
                        <td>
                            <frm:formatDate value="${a_m_one.m_createDate}" pattern="yyyy-MM-dd" var="m_createDate"/>
                                ${m_createDate}
                        </td>
                        <td>
                            <a class="menuEdit" title="修改">
                                <svg class="icon icon_left_div" aria-hidden="true">
                                    <use xlink:href="#iconxiugai"/>
                                </svg>
                            </a>
                        </td>
                        <td>
                            <a class="menuDel" title="删除">
                                <svg class="icon icon_left_div" aria-hidden="true">
                                    <use xlink:href="#iconshanchu"/>
                                </svg>
                            </a>
                        </td>
                        <td hidden>${a_m_one.id}</td>
                    </tr>
                </c:if>
            </c:forEach>
            <c:if test="${a.size()==0}">
                <tr>
                    <td colspan="8">
                        没有查到数据
                    </td>
                </tr>
            </c:if>
        </table>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/iconfont.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/static/js/menus/menu.js"></script>
</body>
</html>
