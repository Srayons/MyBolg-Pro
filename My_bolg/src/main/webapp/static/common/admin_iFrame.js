function admin_iFrame(contextpath) {
    $("iframe").attr("src", contextpath + "/user/iFrame_admin.html");
}

//检查菜单项里是否有子项
function check() {
    $("#admin_div ul li dl").each(function () {
        if ($(this).text().trim() === "") {
            $(this).prev().find("svg:first-child").children().attr("xlink:href", "");
            $(this).prev().attr({"disable": "disable", "onclick": ""});
        }
        /*console.log($(this).text().trim());*/
    })
}


//右侧下啦栏
function admin_hover(path) {
    var li_admin = $("#admin_heard_right li:last-child");
    li_admin.hover(function () {
        $(this.lastChild).remove();
        $("<div id='head_div'></div>").appendTo(this);
        $(this.lastChild).animate({"margin-top": "120px"}, 700);
        var p = ['个人中心', '修改密码', '退出'];
        var url = [path + '/user/userInfo.html',
            path + '/user/editPwd.html',
            path + '/user/loginOut.html'];
        for (var i = 0; i < p.length; i++) {
            $("<a href='" + url[i] + "'>" + p[i] + "</a>").appendTo($("#head_div"));
        }
    }, function () {
        $("#head_div").animate({"margin-top": "-120px"}, 700);
    });
}


//取消展开侧栏
function side_column(jq) {
    $(jq).attr({"onclick": "zhankai_side_column(this)"});
    $("#celan").attr({"xlink:href": "#iconcelanzhankai"});

    $("#admin_logo_heard_left").animate({"margin-left": "-168px"}, 500);
    $("#admin_logo_heard_right").animate({"margin-left": "-190px"}, 500);
    $("#admin_logo_heard_left img:last-child").attr("style", "display: inline");

    $("#admin_div").animate({"margin-left": "-190px"}, 500);
    $("#admin_iFrame").animate({"margin-left": "-190px"}, 500);

    $(".span_icon svg:last-child").attr("style", "display: inline;");
    $(".span_icon svg:first-child").attr("style", "display: none");
    $(".span_icon").attr({"disable": "disable", "onclick": ""});
    $(".span_icon").next().attr("style", "display:none;")

}

//展开侧栏
function zhankai_side_column(jq) {
    $(jq).attr({"onclick": "side_column(this)"});
    $("#celan").attr({"xlink:href": "#iconcelanshouqi"});

    $("#admin_logo_heard_left").animate({"margin-left": "0"}, 500);
    $("#admin_logo_heard_right").animate({"margin-left": "0"}, 500);
    $("#admin_logo_heard_left img:last-child").attr("style", "display: none");

    $("#admin_div").animate({"margin-left": "0"}, 500);
    $("#admin_iFrame").animate({"margin-left": "0"}, 500);

    $(".span_icon svg:last-child").attr("style", "display: none");
    $(".span_icon svg:first-child").attr("style", "display: inline");
    $(".span_icon").removeAttr("disable").attr("onclick", "zhankai(this)");
    $(".span_icon svg:first-child").children().attr("xlink:href", "#iconzhankai")
    check();
}

//点击展开
function zhankai(jq) {
    if ($(jq.firstElementChild).children().attr("xlink:href") === "#iconzhankai") {
        $(jq).next().attr("style", "dispaly:inline-black;");
        $(jq.firstElementChild).children().attr("xlink:href", "#iconshouqi")
    } else {
        $(jq).next().attr("style", "display:none;");
        $(jq.firstElementChild).children().attr("xlink:href", "#iconzhankai")
    }
}

//全屏
function full_screen(jq) {
    if ($(jq).attr("onclick") === "full_screen(this)") {
        $(jq).attr("onclick", "exitFullScreen(this)");
        $("#quanping").attr("xlink:href", "#iconquxiaoquanping");
    }
    var de = document.documentElement;
    if (de.requestFullscreen) {
        de.requestFullscreen();
    } else if (de.mozRequestFullScreen) {
        de.mozRequestFullScreen();
    } else if (de.webkitRequestFullScreen) {
        de.webkitRequestFullScreen();
    } else if (de.msRequestFullscreen) {
        de.msRequestFullscreen();
    }
    else {
        alert("当前浏览器不支持全屏！");
    }
}

//退出全屏
function exitFullScreen(jq) {
    if ($(jq).attr("onclick") === "exitFullScreen(this)") {
        $(jq).attr("onclick", "full_screen(this)");
        $("#quanping").attr("xlink:href", "#iconquanping");
    }
    var elem = document;
    if (elem.webkitCancelFullScreen) {
        elem.webkitCancelFullScreen();
    } else if (elem.mozCancelFullScreen) {
        elem.mozCancelFullScreen();
    } else if (elem.cancelFullScreen) {
        elem.cancelFullScreen();
    } else if (elem.exitFullscreen) {
        elem.exitFullscreen();
    } else {
        alert("浏览器不支持全屏API或已被禁用");
    }
}

//刷新
function refresh() {
    document.getElementById('right_iFrame').contentWindow.location.reload(true);
}

//跳到主页
function Home(contextpath) {
    admin_iFrame(contextpath);
    $("#admin_div").find("li").removeAttr("style");
    $("#admin_div").find("dd").removeAttr("style");
    $("#admin_div").find("dl").each(function () {
        if($(this).text().trim()!=""){
            $(this).hide().prev().find("svg:first-child").children().attr("xlink:href","#iconzhankai");
        }
    });
}


//菜单地址
function admin_url(flag, m_url, jq) {
    var disable_val = $(jq).find("span:last").attr("disable");
    if (disable_val != null && disable_val !== undefined) {
        $(jq).attr("style", "background-color:darkgray;").siblings().removeAttr("style");
        /*alert($(jq).siblings("dl").text());*/
        $(jq).siblings().each(function () {
            $(this).find("dd").removeAttr("style");
        });
        $("iframe").attr("src", m_url);
    }

    if (flag === "-1") {
        $(jq).attr("style", "background-color:darkgray").siblings().removeAttr("style");

        $(jq).parent().parent().siblings().each(function () {
            $(this).removeAttr("style");
            $(this).find("dd").removeAttr("style")
        });
        $("iframe").attr("src", m_url);
    }
}






