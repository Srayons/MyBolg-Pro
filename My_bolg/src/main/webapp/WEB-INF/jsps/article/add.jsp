<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020-5-25
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/jsps/common/common_css.jsp" %>
    <script src="${pageContext.request.contextPath}/static/js/iconfont.js"></script>
    <!-- 配置文件 -->
    <script src="${pageContext.request.contextPath}/static/uedit/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script src="${pageContext.request.contextPath}/static/uedit/ueditor.all.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/article/add.js"></script>
</head>
<style>
    label{
        display: block;
    }
</style>
<body>
<form id="ArtFrom" class="layui-form" lay-filter="ArtFrom">
    <div class="layui-form-item">
        <label class="layui-form-label">文章标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">作者</label>
        <div class="layui-input-block">
            <select name="author_id" autocomplete="off" lay-filter="author" lay-verify="author">
                <option value=""></option>
                <c:forEach items="${users}" var="user">
                    <option value="${user.id}">${user.username}</option>
                </c:forEach>
            </select>


        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">菜单分类</label>
        <div class="layui-input-block">
            <select name="menu_id" autocomplete="off" lay-filter="menu" lay-verify="menu">
                <option value=""></option>
                <c:forEach items="${m}" var="menu">
                    <option value="${menu.id}">${menu.name}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">文章内容</label>
        <div class="layui-input-block">
            <!-- 加载编辑器的容器 -->
            <textarea id="container" placeholder="请输入内容" class="contents" name="content" lay-verify="content">${article.content}</textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <textarea id="ContentTxt" placeholder="获取文本内容" hidden="hidden" name="contentTxt"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="ArtSubmit">发布文章</button>
            <button type="button" class="layui-btn layui-btn-normal" id="CanCel">取消操作</button>
        </div>
    </div>
</form>
</body>
</html>
