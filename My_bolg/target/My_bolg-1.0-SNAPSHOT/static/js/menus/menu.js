layui.use(['layer', 'laydate'], function () {
    var $ = layui.$;
    var layer = layui.layer;
    var laydate = layui.laydate;

    var menuTable = {
        ctxPath: window.sessionStorage.getItem("ctxPath"),
        m_id: "",
        m_name: $("input[name='m_name']").val(),
        m_pName: $("input[name='m_pid']").val(),
        m_createDate: $("input[name='m_createDate']").val()
    };

    menuTable.menu_edit = function (jq) {
        menuTable.m_id = $(jq).parent().parent().find("td:last").html();
        var li = layer.load(0, {shade: false});
        setTimeout(function () {
            layer.open({
                type: 2,
                title: '修改菜单',
                area: ['800px', '520px'],
                content: menuTable.ctxPath + "/menu/m_edit/" + menuTable.m_id + ".html",
                end: function () {
                    location.reload(true);
                }
            });
            layer.close(li)
        }, 300);
    };

    menuTable.menuDel = function (jq) {
        menuTable.m_id = $(jq).parent().parent().find("td:last").html();
        var data = {};
        layer.confirm('是否删除此菜单？', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            $.ajax({
                type: "Post",
                url: menuTable.ctxPath + "/menu/menuDel/" + menuTable.m_id + ".html",
                data: data,
                dataType: "json",
                success: function (data) {
                    if (data.code === "200") {
                        layer.msg('删除成功！', {icon: 1, time: 1000});
                    }
                    if (data.code === "501") {
                        layer.msg('删除失败！', {icon: 2, time: 1000});
                    }
                    if (data.code==="502"){
                        layer.confirm('查询到此菜单下有子目录，是否继续删除此菜单？', {
                            btn: ['确定', '取消'] //按钮
                        },function () {
                            data = {"str":"503"};
                            $.ajax({
                                type: "Post",
                                url: menuTable.ctxPath + "/menu/menuDel/" + menuTable.m_id + ".html",
                                data: data,
                                dataType: "json",
                                success:function (msg) {
                                    alert(msg.code);
                                    if (msg.code === "200") {
                                        layer.msg('删除成功！', {icon: 1, time: 1000});
                                    }
                                    if (msg.code === "501") {
                                        layer.msg('删除失败！', {icon: 2, time: 1000});
                                    }
                                }
                            })
                        });
                    }
                    location.reload(true);
                },
                error: function () {
                    layer.msg('系统错误！', {icon: 2,time:1000});
                    location.reload(true);
                }
            });
        }, function () {
            //取消操作
        });
    };


    menuTable.menuAdd = function () {
        setTimeout(function () {
            layer.open({
                type: 2,
                title: '添加菜单',
                area: ['800px', '520px'],
                content: menuTable.ctxPath + "/menu/m_add.html",
                end: function () {
                    location.reload(true);
                }
            });
            layer.close(menuTable.index)
        }, 300);
    };

    //添加单击事件
    $("a[name='iFrame_add']").click(function () {
        menuTable.menuAdd();
    });

    //修改菜单单击事件
    $(".menuEdit").click(function () {
        menuTable.menu_edit(this);
    });

    //删除菜单单击事件
    $(".menuDel").click(function () {
        menuTable.menuDel(this);
    });

    $(function () {
        if (localStorage.getItem("m_pName") != null && localStorage.getItem("m_pName") !== "") {
            $("tr").removeAttr("style");
            window.localStorage.removeItem("m_pName");
        }
    });

    //查询单击事件
    $("a[name='iFrame_select']").click(function () {
        menuTable.m_pName = $("input[name='m_pid']").val();
        if (menuTable.m_pName != null && menuTable.m_pName !== "") {
            window.localStorage.setItem("m_pName", menuTable.m_pName);
        } else {
            window.localStorage.removeItem("m_pName");
        }
       $("#m_from").submit()
    });
});