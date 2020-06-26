layui.use(['layer','laydate'], function () {
    var $ = layui.$;
    var layer = layui.layer;
    var laydate = layui.laydate;

    var ArtTable = {
        ctxPath: window.sessionStorage.getItem("ctxPath"),
        id: "",
        title: $("input[name='title']").val(),
        author_id: $("input[name='author_id']").val(),
        m_createDate: $("input[name='createDate']").val()
    };

    ArtTable.art_edit = function (jq) {
        ArtTable.id = $(jq).parent().parent().find("td:last").html();

        var ii = layer.load(0, {shade: false});
        setTimeout(function () {
            layer.open({
                type: 2,
                title: '修改文章',
                area: ['1000px', '600px'],
                maxmin:true,
                content: ArtTable.ctxPath + "/art/art_edit/" + ArtTable.id + ".html",
                end: function () {
                    location.reload(true);
                }
            });
            layer.close(ii)
        }, 300);
    };

    ArtTable.artDel = function (jq) {
        ArtTable.id = $(jq).parent().parent().find("td:last").html();
        layer.confirm('是否删除此文章？', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            $.ajax({
                type: "Post",
                url: ArtTable.ctxPath + "/art/artDel/" + ArtTable.id + ".html",
                dataType: "json",
                success: function (data) {
                    if (data.code === "200") {
                        layer.msg('删除成功！', {icon: 1, time: 1000});
                    }
                    if (data.code === "501") {
                        layer.msg('删除失败！', {icon: 2, time: 1000});
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


    ArtTable.artAdd = function(){
        var ii = layer.load(0, {shade: false});
        setTimeout(function () {
            layer.open({
                type: 2,
                title: '创作文章',
                area: ['1000px', '600px'],
                maxmin:true,
                content: ArtTable.ctxPath + "/art/add.html",
                end: function () {
                    location.reload(true);
                }
            });
            layer.close(ii)
        }, 300);
    };

    //添加单击事件
    $("a[name='iFrame_add']").click(function () {
       ArtTable.artAdd();
    });

    //修改菜单单击事件
    $(".ArtEdit").click(function () {
        ArtTable.art_edit(this);
    });

    //删除菜单单击事件
    $(".ArtDel").click(function () {
        ArtTable.artDel(this);
    });

    //查看菜单单击事件

    $(function () {
        if (localStorage.getItem("m_pName") != null && localStorage.getItem("m_pName") !== "") {
            $("tr").removeAttr("style");
            window.localStorage.removeItem("m_pName");
        }
    });

    //查询单击事件
    $("input[name='iFrame_select']").click(function () {
        ArtTable.m_pName = $("input[name='m_pid']").val();
        if (ArtTable.m_pName != null && ArtTable.m_pName !== "") {
            window.localStorage.setItem("m_pName", ArtTable.m_pName);
        } else {
            window.localStorage.removeItem("m_pName");
        }
    });

});