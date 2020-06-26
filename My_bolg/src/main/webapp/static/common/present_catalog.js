$(function () {
    var reg =/^(http:\/\/(([a-z0-9]+:[0-9]+)|([a-zA-Z0-9]+.[a-zA-Z0-9]+.[a-zA-Z0-9]+))\/([?]?[A-Za-z]+=[0-9]+?&[?]?[A-Za-z]+=[0-9]+)?)$/;
    var localCatalog = window.location.href;
    if (reg.test(localCatalog)) {
        $("#Art_Catalog a").html("");
        $("#menu_a").html("首页&nbsp;&nbsp;>>");
    }


});

/*function input_reg() {
    var reg =/^http:\/\/([a-z0-9]+:[0-9]+)\/([?]?[A-Za-z]+=[0-9]+?&[?]?[A-Za-z]+=[0-9]+)?$/;
    var input_reg = $("#Art_Catalog input").val();
    if (reg.test(input_reg)){
        alert("true");
    }
}*/
