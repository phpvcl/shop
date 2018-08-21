{__NOLAYOUT__}<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
        <script src="/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
        <title>跳转提示</title>
    </head>
    <body>
        <script type="text/javascript">

            layui.use(['layer'], function () {
                <?php if ($data != 'notice'): ?>
                var index = parent.layer.getFrameIndex(window.name);
                var code = '<?php echo $code?>';
                layer.msg("<?php echo(strip_tags($msg));?> &nbsp;<span id='wait' style='color:red'><?php echo($wait);?></span>", {icon: code, time: '<?php echo($wait*1000);?>'});

                setTimeout(function () {
                    if (index > 0 && code == 1) {
                        parent.refresh();
                    } else {
                        window.location.href = '<?php echo($url);?>';
                    }

                },<?php echo($wait*1000);?>);
                var wait = document.getElementById('wait');
                var interval = setInterval(function () {
                    var time = --wait.innerHTML;
                    if (time <= 0) {
                        clearInterval(interval);
                    }
                }, 1000);
                <?php else: ?>

                layer.open({
                    type: 1
                    , title: false //不显示标题栏
                    , closeBtn: false
                    , area: '300px;'
                    , shade: false
                    , id: 'LAY_layuipro' //设定一个id，防止重复弹出
                  //  , btn: ['知道了']
                    , btnAlign: 'c'
                    , moveType: 1 //拖拽模式，0或者1
                    , content: '<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><?php echo(strip_tags($msg));?></div>'
                    
                });
                <?php endif;?>
            });
        </script>
    </body>
</html>
