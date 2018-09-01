/*
 * @Author: 94468
 * @Date:   2018-03-16 18:24:47
 * @Last Modified by:   94468
 * @Last Modified time: 2018-07-26 09:17:14
 */
// 节点树
layui.define(['jquery', 'form'], function (exports) {
    $ = layui.jquery;
    form = layui.form;

    obj = {
        config: {
            inputName: 'menuids[]',
            layfilter: 'lay-check-auth',
            openall: false,
            element: '#auth_tree',
            url: '',
            Checked: []
        },
        /**
         * 渲染DOM并绑定事件
         * @param  {[type]} inputname [上传表单名]
         * @param  {[type]} layfilter [lay-filter的值]
         * @param  {[type]} openall [默认展开全部]
         * @return {[type]}           [description]
         */
        render: function (opt) {

            this.config.inputname = opt.inputname ? opt.inputname : 'menuids[]';
            this.config.layfilter = opt.layfilter ? opt.layfilter : 'lay-check-auth';
            this.config.openall = opt.openall ? opt.openall : false;
            this.config.element = opt.element;
            this.config.checked = opt.checked;
            var element = this.config.element;
            $.getJSON(opt.url, function (res) {
                if (res.code === 0) {
                    $(element).html(obj.renderAuth(res.data, 0));
                    form.render();
                }else{
                    $(element).html('<div class="layui-form-mid">暂无数据</div>');
                }
            });
            form.on('checkbox(' + this.config.layfilter + ')', function (data) {
                // 	/*属下所有权限状态跟随，如果选中，往上走全部选中*/
                var childs = $(data.elem).parent().next().find('input[type="checkbox"]').prop('checked', data.elem.checked);
                if (data.elem.checked) {
                    /*查找child的前边一个元素，并将里边的checkbox选中状态改为true。*/
                    $(data.elem).parents('.auth-child').prev().find('input[type="checkbox"]').prop('checked', true);
                }
                // 	/*console.log(childs);*/
                form.render('checkbox');
            });

            /*动态绑定展开事件*/
            $(element).on('click', '.auth-icon', function () {

                var origin = $(this);
                var child = origin.parent().parent().find('.auth-child:first');
                if (origin.is('.active')) {
                    /*收起*/
                    origin.removeClass('active').html('&#xe623;');
                    child.slideUp('fast');
                } else {
                    /*展开*/
                    origin.addClass('active').html('&#xe625;');
                    child.slideDown('fast');
                }
                return false;
            })
        },
        // 递归创建格式
        renderAuth: function (tree, dept) {

            var inputname = this.config.inputname;
            var checked = this.config.checked;
            var layfilter = this.config.layfilter;
            var openall = this.config.openall;
            var str = '<div class="auth-single">';
            var active = '';
            var icon = '&#xe623;';
            var chidren = '';

            var isShow = 'display:none;';
            var chidrenIcon = '<i class="layui-icon auth-leaf" style="opacity:0;">&#xe623;</i>';
            layui.each(tree, function (index, item) {
                if (checked && checked.indexOf(item.name) > -1)
                {
                    item.checked = 'checked';
                }

                var hasChild = item.children ? 1 : 0;
                if (hasChild)
                {
                    if (openall) {
                        active = 'active';
                        icon = '&#xe625;';
                        isShow = '';
                    }
                    chidrenIcon = '<i class="layui-icon auth-icon ' + active + '" style="cursor:pointer;">' + icon + '</i>'
                    chidren = ' <div class="auth-child" style="'
                            + isShow
                            + 'padding-left:40px;"> ' + obj.renderAuth(item.children, dept + 1)
                            + '</div>';
                }
                str += '<div><div class="auth-status"> '
                        + chidrenIcon +
                        (dept ? '<span>├─ </span>' : '')
                        + '<input type="checkbox" name="' + inputname + '" title="' + item.name + '" value="' + item.id
                        + '" lay-skin="primary" lay-filter="' + layfilter + '" '
                        + (item.checked ? 'checked="checked"' : '')
                        + '> </div>' + chidren + '</div>';
            });
            str += '</div>';
            return str;
        },
        // 获取选中叶子结点
        getLeaf: function () {
            var leafs = $(this.config.element).find('.auth-leaf').parent().find('input[type="checkbox"]:checked');
            var data = [];
            leafs.each(function (index, item) {
                //   console.log(item);
                data.push(item.value);
            });
            // console.log(data);
            return data;
        },
        // 获取所有选中的数据
        getAll: function () {
            var inputs = $(this.config.element).find('input[type="checkbox"]');
            var data = [];
            inputs.each(function (index, item) {
                data.push(item.value);
            });
            // console.log(data);
            return data;
        },
        // 获取所有选中的数据
        getChecked: function () {
            var inputs = $(this.config.element).find('input[type="checkbox"]:checked');
            var data = [];
            inputs.each(function (index, item) {
                data.push(item.value);
            });
            // console.log(data);
            return data;
        },
        // 获取未选中数据
        getNotChecked: function () {
            var inputs = $(this.config.element).find('input[type="checkbox"]:not(:checked)');
            var data = [];
            inputs.each(function (index, item) {
                data.push(item.value);
            });
            // console.log(data);
            return data;
        }
    }
    exports('authtree', obj);
});