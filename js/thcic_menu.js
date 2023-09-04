//顶部导航菜单
  $('li.mainlevel').hover(
  function(){
	  $(this).find('a:first').addClass("hover");
	  var current_li=$(this);
	  NavWaitSlide = setTimeout(function() { 
		  if(!$(current_li).children('ul').is(':visible'))
		  {
				$(current_li).find('ul').slideDown(200);
		  }
	  },100)
  },
 function(){
	  clearTimeout(NavWaitSlide);
	  $(this).find('ul').slideUp(100);
	  $(this).find('a:first').removeClass("hover");
  }
);



//新闻图片切换
    $('#pic_up').click(function(){
            $('#pic_List li:first').slideUp('fast',function(){
                $(this).appendTo('#pic_List').show();
            });

    });
	
    $('#pic_down').click(function(){
            var last = $('#pic_List li:last').slideDown('fast',function(){
                $(this).prependTo('#pic_List').show();
            });
    });
    $('#pic_List li').click(function(){
        var url = $(this).find('img').attr('rel');
        $('#pic_canvas img').attr('src',url);
        $('#pic_List li img').css({"opacity":"0.5"});
        $(this).find('img').css({"opacity":"1"});
    });
    $('#pic_List li:first').click();



//首页banner 缩进特效
$('div.notice').hide();
$('div.notice_tab').show();
			
	$('#noticeClose').click(function(){
		var $notice = $('div.notice_left');
		var leftNum = $notice.position().left;

		$notice.animate({'left': '235',"opacity":"0"}, 200,function(){
			$('div.notice').hide();
			$('div.notice_tab').show();
		});
	});
	$('div.notice_tab').click(function(){
		var $notice = $('div.notice_left');
		$('div.notice_tab').hide(0,function(){
			$('div.notice').show();
		});

		$notice.animate({'left': '0',"opacity":"0.9"}, 100,function(){

			$('div.notice_tab').hide();
		});
	});

});