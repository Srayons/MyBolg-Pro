layui.use(['layer', 'laydate'], function () {
    var $ = layui.$;
    var layer = layui.layer;
    var laydate = layui.laydate;

    var EditMenu = {
        ctxPath: window.sessionStorage.getItem("ctxPath")
    };


    EditMenu.edit = function () {
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        var data = {};
        var t = $('#EditMenu').serializeArray();
        $.each(t, function() {
            data [this.name] = this.value;
        });
        $.ajax({
            type: "Post",
            url: EditMenu.ctxPath + "/menu/menuEdit.html",
            data:data,
            dataType: "json",
            success: function (data) {
                if (data.code==="200") {
                    layer.msg('修改成功！', {
                        icon: 1,
                        time:1000,
                        end:function () {
                            parent.layer.close(index); //再执行关闭
                        }});
                }else if (data.code==="501") {
                    layer.msg('修改失败！', {
                        icon: 2,
                        time:1000,
                        end:function () {
                            parent.layer.close(index); //再执行关闭
                        }
                    });
                }
            },
            error: function () {
                layer.msg('系统错误！', {
                    icon: 2,
                    end:function () {
                        parent.layer.close(index); //再执行关闭
                    }
                });
            }
        });
    };

    $("#editSubmit").click(function () {
        EditMenu.edit();
    })
});