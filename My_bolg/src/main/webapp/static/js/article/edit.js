layui.use(['laydate','form', 'layedit'], function () {
    var $ = layui.$;
    var form = layui.form,
        layer = layui.layer,
        layedit = layui.layedit;

    var EditArt = {
        ctxPath: window.sessionStorage.getItem("ctxPath")
    };


    //创建一个编辑器
    var ue = UE.getEditor('container');

    //自定义验证规则
    form.verify({
        title: function(value){
            if(value.length < 5){
                return '标题至少得5个字符！';
            }
        },
        author: function (value) {
            var msg="必填项不能为空";
            value= $.trim(value);
            var isEmpty=!value || value.length<1;
            if(isEmpty){
                return msg;
            }
        },
        menu:function (value,item) {
            var msg="必填项不能为空";
            value= $.trim(value);
            var isEmpty=!value || value.length<1;
            if(isEmpty){
                return msg;
            }
        },
        content: function(value){
            if (!value.trim(value)||value.length<1){
                return "文章内容不能为空！"
            }
            ue.sync();
        }
    });


    EditArt.edit = function (data) {
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        var data = {};
        var t = $('#EditArt').serializeArray();
        $.each(t, function() {
            data [this.name] = this.value;
        });
        $("#ContentTxt").html(ue.getContentTxt());
        data ["contentTxt"] = $("#ContentTxt").html();

        alert(ue.getContentTxt());
        alert($("#ContentTxt").html());
        alert(JSON.stringify(data));
        $.ajax({
            type: "Post",
            url: EditArt.ctxPath + "/art/edit.html",
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
                    return true;
                }else if (data.code==="501") {
                    layer.msg('修改失败！', {
                        icon: 2,
                        time:1000,
                        end:function () {
                            parent.layer.close(index); //再执行关闭
                        }
                    });
                    return false;
                }
            },
            error: function () {
                layer.msg('系统错误,请联系管理员！', {
                    icon: 2,
                    end:function () {
                        parent.layer.close(index); //再执行关闭
                    }
                });
                return false;
            }
        });
        return false;
    };

/*    $("#editSubmit").click(function () {
        EditArt.edit();
    })*/

    $("#CanCel").click(function () {
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
    });


    //表单提交
    form.on('submit(editSubmit)', function(data){
        if (!EditArt.edit(data))  return false;
    });


    window.onload = function () {
        ue.ready(function () {
            ue.setHeight(160)
        });
        $(".contents div").attr("style","z-index: 0;overflow: hidden;")
    }
});