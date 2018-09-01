layui.use(['layer', 'form', 'element', 'jquery'], function() {
	var element = layui.element;
	var $ = layui.jquery;
	var hideBtn = $('#hideBtn');
	var mainLayout = $('#main-layout');
	var mainMask = $('.main-mask');
	//监听导航点击
	$('.tab-show-item a').click(function() {
		var navA = $(this);
		var id = navA.attr('data-id');
		var url = navA.attr('data-url');
		var text = navA.attr('data-text');
		if(!url || !id){
			return;
		}
		var isActive = $('.main-layout-tab .layui-tab-title').find("li[lay-id=" + id + "]");
               
		if(isActive.length > 0) {
                   
			//切换到选项卡
			element.tabChange('tab', id);
		} else {
			element.tabAdd('tab', {
				title: text,
				content: '<iframe src="' + url + '" name="iframe' + id + '" class="iframe" framborder="0" data-id="' + id + '" scrolling="auto" width="100%"  height="100%"></iframe>',
				id: id
			});
			element.tabChange('tab', id);
			
		}
		mainLayout.removeClass('hide-side');
	});
	$('.tab-son-show-item a').click(function() {
                var parentElement = parent.layui.element;
		var navA = $(this);
		var id = navA.attr('data-id');
		var url = navA.attr('data-url');
		var text = navA.attr('data-text');  
		if(!url || !id){
			return;
		}
		var isActive = $('.main-layout-tab .layui-tab-title', parent.document).find("li[lay-id=" + id + "]");
		if(isActive.length > 0) {
                   
			//切换到选项卡
			parentElement.tabChange('tab', id);
		} else {
			parentElement.tabAdd('tab', {
				title: text,
				content: '<iframe src="' + url + '" name="iframe' + id + '" class="iframe" framborder="0" data-id="' + id + '" scrolling="auto" width="100%"  height="100%"></iframe>',
				id: id
			});
			parentElement.tabChange('tab', id);
			
		}
		mainLayout.removeClass('hide-side');
	});        
        
	
	//菜单隐藏显示
	hideBtn.on('click', function() {
		if(!mainLayout.hasClass('hide-side')) {
			mainLayout.addClass('hide-side');
		} else {
			mainLayout.removeClass('hide-side');
		}
	});
	//遮罩点击隐藏
	mainMask.on('click', function() {
		mainLayout.removeClass('hide-side');
	})

});
