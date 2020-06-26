<%--
  Created by IntelliJ IDEA.
  User: SYX
  Date: 2020-5-17
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/favicon.ico">
</head>
<body>
<%--中间左侧--%>
<div class="layui-row">
    <div class="layui-col-md12">
        <div class="grid-demo grid-demo-bg1">
            <div id="Table_login">
                <table>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <h1>后台登录</h1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3>用户昵称：</h3>
                        </td>
                        <td>
                            <label>
                                <input name="account" class="Table_login_input_text">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3>用户密码：</h3>
                        </td>
                        <td>
                            <label>
                                <input name="password" type="password" class="Table_login_input_text">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <label>
                                <input id="Table_login_input" type="button" value="登  录">
                            </label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/iconfont.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
<script>
    layui.use(['layer'],function () {
        var $ = layui.$;
        var layer = layui.layer;
        function admin_login() {
            var account = $("input[name='account']").val();
            var password = $("input[name='password']").val();
            $.ajax({
                type: "Post",
                url: "${pageContext.request.contextPath}/user/admin_login.html",
                data: {"account": account, "password": password},
                dataType: "json",
                async:false,
                success: function (data) {
                    if (data.code === "200" && data.data != null) {
                        window.location.href = "${pageContext.request.contextPath}/user/index.html";
                    } else if (data.code === "501" && data.data === null) {
                        layer.msg('密码错误！', {icon: 2});
                    }
                },
                error:function (data) {
                    layer.msg('系统错误！', {icon: 2});
                }
            })
        }

        $("#Table_login_input").click(function () {
            admin_login();
        });
    });

    $(function () {
        window.sessionStorage.setItem("ctxPath","${pageContext.request.contextPath}");
        $("body").css({
            "background-image": "url(\"${pageContext.request.contextPath}/static/img/1.jpg\")",
            "background-repeat": "no-repeat"
        });
        /*加载背景图片每10秒切换*/
        setInterval(background_img, 10000);
    });

    /*加载背景图片每10秒切换*/
    function background_img() {
        var local_img = window.localStorage.getItem("i");
        if (local_img === "NaN" || local_img === null) {
            window.localStorage.setItem("i", "2");
        }
        var img_url = "background-image: url(\"${pageContext.request.contextPath}/static/img/" + local_img + ".jpg\"); background-repeat: no-repeat;";
        var body_img = $("body");
        body_img.css({
            "background-image": "url('${pageContext.request.contextPath}/static/img/" + local_img + ".jpg')",
            "background-repeat": "no-repeat"
        });
        var back_img = body_img.attr("style");
        if (back_img === (img_url)) {
            local_img = window.localStorage.getItem("i");
            var i_index = parseInt(local_img) + 1;
            window.localStorage.setItem("i", i_index);
            if (i_index >= 6) {
                window.localStorage.removeItem("i");
                window.localStorage.setItem("i", "1");
            }
            local_img = window.localStorage.getItem("i");
            body_img.css({
                "background-image": "url('${pageContext.request.contextPath}/static/img/" + local_img + ".jpg')",
                "background-repeat": "no-repeat"
            });
        }
    }

</script>
</body>
</html>
