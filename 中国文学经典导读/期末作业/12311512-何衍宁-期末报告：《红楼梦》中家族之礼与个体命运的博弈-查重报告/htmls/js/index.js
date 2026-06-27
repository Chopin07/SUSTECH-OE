
(function(System, $) {
    'use strict';
    var tab = System.Paper.tab();
    var run = System.Paper.setMainIframeHeight();
    $(function() {
        try {
            if ("undefined" === typeof localStorage || "undefined" === typeof JSON) {
                /*$('body').append('<div class="alert-warning"><p>您当前的浏览器不支持段落修改功能，如需使用此功能请<b>更换其它浏览器</b>！</p></div>');*/
            }
        } catch (e) {
            /*$('body').append('<div class="alert-warning"><p>您当前的浏览器不支持段落修改功能，如需使用此功能请<b>更换其它浏览器</b>！</p></div>');*/
        }

        $(window).resize(function() {
            run();
        }).trigger('resize');
    });


})(Report, jQuery);

$(function() {
    $(".nav-show-button").click(function(event) {
        /* Act on the event */
        $(".in-nav-right").toggle();
        if($(this).hasClass("glyphicon-align-justify")){
            $(this).removeClass("glyphicon-align-justify").addClass('glyphicon-remove');

        }else{
             $(this).addClass("glyphicon-align-justify").removeClass('glyphicon-remove');
        }


    });

    $(".in-nav-right").find('li').click(function(event) {
        /* Act on the event */
        $(this).addClass('active').siblings().removeClass('active');

    });


})

/*报告相似库nav导航*/
$(function(){
	$('#nav-ul-paper').find('li').each(function(){

	});
	$('#nav-ul-paper').find('li').click(function(){
		$('#nav-ul-paper').find('li').removeClass('active-nav');
		$('#nav-ul-paper').find('li').css('color', '#c0c0c0');
		$(this).addClass('active-nav');
		$(this).css('color', '#50BE81');
	});
});
/*报告顶部分类导航*/
$(function(){
	$('#all-class-lib').click(function(){
		$('.intelnet-show').show();
		$('.local-show').show();
		$('.private-show').show();
		var sentence_num = parseInt($('.local-show').length)+parseInt($('.intelnet-show').length);
		$('.list-tip').find('p').html('共找出相似内容：'+sentence_num+'个');
		var num_index = 0;
		$('.hits-index-num').each(function(){
			if($(this).parent().parent().css('display') == 'block') {
				++num_index;
				$(this).html('相似片断'+num_index+'：');
			}
		});
	});
	$('#local-class-lib').click(function(){
		$('.local-show').show();
		$('.intelnet-show').hide();
		$('.private-show').hide();
		$('.list-tip').find('p').html('共找出相似内容：'+$('.local-show').length+'个');
		var num_index = 0;
		$('.hits-index-num').each(function(){
			if($(this).parent().parent().css('display') == 'block') {
				++num_index;
				$(this).html('相似片断'+num_index+'：');
			}
		});
	});
	$('#intelnet-class-lib').click(function(){
		$('.intelnet-show').show();
		$('.local-show').hide();
		$('.private-show').hide();
		$('.list-tip').find('p').html('共找出相似内容：'+$('.intelnet-show').length+'个');
		var num_index = 0;
		$('.hits-index-num').each(function(){
			if($(this).parent().parent().css('display') == 'block') {
				++num_index;
				$(this).html('相似片断'+num_index+'：');
			}
		});
	});
	$('#private-class-lib').click(function(){
		$('.private-show').show();
		$('.local-show').hide();
		$('.intelnet-show').hide();
		$('.list-tip').find('p').html('共找出相似内容：'+$('.private-show').length+'个');
		var num_index = 0;
		$('.hits-index-num').each(function(){
			if($(this).parent().parent().css('display') == 'block') {
				++num_index;
				$(this).html('相似片断'+num_index+'：');
			}
		});
	});
});
/*报告sentence。html*/
$(function(){
	$('.issue_journal_time').each(function(){
		var page = $(this).next().next().html();
		var time = $(this).html();
		if(page == '' || page.split('_').length==1) {
			$(this).next().next().css('display','none');
		}else{
			var page_position = 'P'+page.split('_')[1];
			$(this).next().next().html(page_position);
		}
		var publish_issue_num = page.split('_')[0];
		var publish_issue_time = time+'年'+publish_issue_num+'期';
		$(this).html(publish_issue_time);
	});
	/*相似语句综合栏目中，本地库的相似语句，相似度大小排前二的两条置顶*/
	var sentence_percent = new Array();
	if($('#all-class-lib').hasClass('active-nav') && $('.local-show').length>0) {
		var prepend_num = 0;
		$('.local-show').each(function(){
    		++prepend_num;
    		if(prepend_num==1) {
    			$('.list-xs-position').first().after($(this));
    		}
    		if(prepend_num==2) {
    			$('.list-xs-position').first().next().after($(this));
    		}
    	});
    	$('.list-xs-position').each(function(){
    		if($(this).index() != 0){
    			$(this).find('h4').find('em').html('相似片断'+$(this).index()+'：');
    		}
    	});
	}
});

