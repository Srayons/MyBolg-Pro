var pageNum = $("#pageNum").val();
var select_PageSize = $("#select_PageSize");
var pages = $("#pages").val();
var isFirstPage = $("#isFirstPage").val();
var isLastPage = $("#isLastPage").val();
var hasPreviousPage = $("#hasPreviousPage").val();
var hasNextPage = $("#hasNextPage").val();

select_PageSize.change(function () {
    var s_pageSize = select_PageSize.val();
    $("#pageNum").val(1);
    $("#pageSize").val(s_pageSize);
    select_PageSize.attr("selected","selected");
    var url = window.location.href;
    var url_sub = url.substring(0,url.indexOf('?'));
    console.log(url_sub);
    $("#Art_Form").attr("action",url_sub).submit();
});

function firstPage() {
    if(isFirstPage==="false"){
        $("#pageNum").val(1);
        $("#Art_Form").attr("action",window.location.href).submit();
    }else {
        $("#PreviousPage").attr("disabled","disabled");
        $("#firstPage").attr("disabled","disabled");
    }
}
function PreviousPage() {
    if(hasPreviousPage==="true"){
        $("#pageNum").val(parseInt(pageNum)-1);

        $("#Art_Form").attr("action",window.location.href).submit();
    }else {
        $("#PreviousPage").attr("disabled","disabled");
        $("#firstPage").attr("disabled","disabled");
    }
}
function NextPage() {
    if(hasNextPage==="true"){
        $("#pageNum").val(parseInt(pageNum)+1);
        $("#Art_Form").attr("action",window.location.href).submit();
    }else {
        $("#NextPage").attr("disabled","disabled");
        $("#LastPage").attr("disabled","disabled");
    }
}
function LastPage() {
    if(isLastPage==="false"){
        $("#pageNum").val(pages);
        $("#Art_Form").attr("action",window.location.href).submit();
    }else {
        $("#LastPage").attr("disabled","disabled");
        $("#NextPage").attr("disabled","disabled");
    }
}