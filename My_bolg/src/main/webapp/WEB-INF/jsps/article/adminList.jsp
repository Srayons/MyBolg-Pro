<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020-5-26
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/jsps/common/common_css.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/table.css"/>
</head>
<body>
<div class="layui-row">
    <div id="admin_iFrame_div">
        <form id="m_from" action="${pageContext.request.contextPath}/menu/m_list.html" method="post">
            <label>文章标题</label>
            <label>
                <input name="title" type="text"/>
            </label>
            <label>文章作者</label>
            <label>
                <input name="author_id" type="text"/>
            </label>
            <label>文章时间</label>
            <label>
                <input name="createDate" type="text"/>
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
                <td>文章标题</td>
                <td>文章内容</td>
                <td>文章作者</td>
                <td>文章目录</td>
                <td>创建菜单时间</td>
                <td colspan="3">操作</td>
            </tr>
            <c:forEach items="${a.list}" var="art_info">
                    <tr>
                        <td>${art_info.title}</td>
                        <td>${fn:substring(art_info.contentTxt,0,10)}</td>
                        <td>${art_info.user.username}</td>
                        <td>${art_info.menu.name}</td>
                        <td>
                            <frm:formatDate value="${art_info.createDate}" pattern="yyyy-MM-dd" var="a_createDate"/>
                                ${a_createDate}
                        </td>
                        <td>
                            <a class="ArtSelect" title="查看">
                                <svg class="icon icon_left_div" aria-hidden="true">
                                    <use xlink:href="#iconchakan"/>
                                </svg>
                            </a>
                        </td>
                        <td>
                            <a class="ArtEdit" title="修改">
                                <svg class="icon icon_left_div" aria-hidden="true">
                                    <use xlink:href="#iconxiugai"/>
                                </svg>
                            </a>
                        </td>
                        <td>
                            <a class="ArtDel" title="删除">
                                <svg class="icon icon_left_div" aria-hidden="true">
                                    <use xlink:href="#iconshanchu"/>
                                </svg>
                            </a>
                        </td>
                        <td hidden>${art_info.id}</td>
                    </tr>
            </c:forEach>
            <c:if test="${a.list.size()==0}">
                <tr>
                    <td colspan="8">
                        没有查到数据
                    </td>
                </tr>
            </c:if>
        </table>
        <%--尾部--分页--%>
        <%@include file="/WEB-INF/jsps/common/common_pageInfo.jsp" %>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/iconfont.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/static/js/article/art.js"></script>
<script src="${pageContext.request.contextPath}/static/common/common_pageInfo.js"></script>
</body>
</html>
