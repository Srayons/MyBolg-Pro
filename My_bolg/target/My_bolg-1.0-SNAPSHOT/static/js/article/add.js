layui.use(['form', 'layedit', 'laydate'], function(){
    var form = layui.form
        ,layer = layui.layer
        ,layedit = layui.layedit;

    var AddArt = {
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

    $("#CanCel").click(function () {
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
    });

    //监听提交
    form.on('submit(ArtSubmit)', function(data){
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        $.ajax({
            url:AddArt.ctxPath + "/art/art_add.html",
            type:"post",
            data:data.field,
            dataType:"json",
            success:function (msg) {
                if (msg.code==="200") {
                    layer.msg('添加成功！', {
                        icon: 1,
                        time:1000,
                        end:function () {
                            parent.layer.close(index); //再执行关闭
                        }});
                    return true;
                }else if (msg.code==="501") {
                    layer.msg('添加失败！', {
                        icon: 2,
                        time:1000,
                        end:function () {
                            parent.layer.close(index); //再执行关闭
                        }
                    });
                    return false;
                }
            },
            error:function (msg) {
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
    });
    window.onload = function () {
        ue.ready(function () {
            ue.setHeight(160)
        });
        $(".contents div").attr("style","z-index: 0;overflow: hidden;")
    }
});
