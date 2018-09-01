layui.config({
    base: '/static/js/module/'
}).extend({
    dialog: 'dialog',
});

layui.use(['form', 'jquery', 'layer', 'dialog', 'element'], function () {
    var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery,
            dialog = layui.dialog;
    //获取当前iframe的name值
    var iframeObj = $(window.frameElement).attr('name');
    //全选
    form.on('checkbox(allChoose)', function (data) {
        var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
        child.each(function (index, item) {
            item.checked = data.elem.checked;
        });
        form.render('checkbox');
    });

    //批量删除
    $('.batchdel-btn').click(function () {
        var checks = $('input[name="id[]"]:checked');
        if (checks.length === 0) {

            layer.msg('请先选择');
            return false;
        }
        dialog.confirm({
            message: "您确定要删除选中项",
            success: function () {
                $('#batchdel-btn').submit();
            },
            cancel: function () {
                //layer.msg('取消了')
            }
        })
        return false;
    })
  
    //列表添加
    $('#table-list').delegate('.add-btn','click',function () {
        var That = $(this);
        var url = That.attr('data-url');
        var height = That.attr('data-height');
        if(height > 50){
            height = height + 'px';
        }else{
            height = '620px';
        }
        //将iframeObj传递给父级窗口
        parent.page("新增", url, iframeObj, w = "700px", h = height);
        return false;
    })
    //编辑栏目
    $('#table-list').delegate('.edit-btn','click',function () {
        var That = $(this);
        var url = That.attr('data-url');
        var height = That.attr('data-height');
        if(height > 50){
            height = height + 'px';
        }else{
            height = '620px';
        }
        //将iframeObj传递给父级窗口
        parent.page('编辑', url, iframeObj, w = "700px", h = height);
        return false;
    })    
    //列表删除
    $('#table-list').delegate('.del-btn','click',function () {
        var url = $(this).attr('data-url');
        var id = $(this).attr('data-id');
        dialog.confirm({
            message: '您确定要进行删除吗？',
            success: function () {
                window.location.href = url;
            }
        })
        return false;
    })
    
    $('#ImgPreview a').delegate('img','click', function () {

        layer.photos({photos:'#ImgPreview'});

    })    
    //列表跳转
    $('.go-btn').on('click',function () {
        var url = $(this).attr('data-url');
        window.location.href = url;
        return false;
    })

});

/**
 * 控制iframe窗口的刷新操作
 */
var iframeObjName;

//父级弹出页面
function page(title, url, obj, w, h) {
    if (title == null || title == '') {
        title = false;
    }
    ;
    if (url == null || url == '') {
        url = "404.html";
    }
    ;
    if (w == null || w == '') {
        w = '700px';
    }
    ;
    if (h == null || h == '') {
        h = '350px';
    }
    ;
    iframeObjName = obj;
    //如果手机端，全屏显示
    if (window.innerWidth <= 768) {
        var index = layer.open({
            type: 2,
            title: title,
            area: [320, h],
            fixed: false, //不固定
            content: url
        });
        layer.full(index);
    } else {
        var index = layer.open({
            type: 2,
            title: title,
            area: [w, h],
            fixed: false, //不固定
            content: url
        });
    }
}

/**
 * 刷新子页,关闭弹窗
 */
function refresh() {
    //根据传递的name值，获取子iframe窗口，执行刷新
    if (window.frames[iframeObjName]) {
        window.frames[iframeObjName].location.reload();

    } else {
        window.location.reload();
    }

    layer.closeAll();
}