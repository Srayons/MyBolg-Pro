<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="Art_Form">
    <input id="pageNum" type="hidden" name="pageNum" value="${a.pageNum}">
    <input id="pageSize" type="hidden" name="pageSize" value="${a.pageSize}">
</form>
<div id="Page_div">
    <input type="hidden" id="pages" value="${a.pages}">
    <input type="hidden" id="isFirstPage" value="${a.isFirstPage}">
    <input type="hidden" id="isLastPage" value="${a.isLastPage}">
    <input type="hidden" id="hasPreviousPage" value="${a.hasPreviousPage}">
    <input type="hidden" id="hasNextPage" value="${a.hasNextPage}">
    <button id="firstPage" onclick="firstPage()">首页</button>
    <button id="PreviousPage" onclick="PreviousPage()">上一页</button>
    <c:forEach items="">

    </c:forEach>
    <button id="NextPage" onclick="NextPage()">下一页</button>
    <button id="LastPage" onclick="LastPage()">尾页</button>
        每页行数：
        <select id="select_PageSize">
            <option <c:if test="${a.pageSize==2}">selected</c:if> value="2">2</option>
            <option <c:if test="${a.pageSize==5}">selected</c:if> value="5">5</option>
            <option <c:if test="${a.pageSize==20}">selected</c:if> value="20">20</option>
        </select>
    <button readonly="readonly">共${a.pages}页，共${a.total}条记录</button>
</div>