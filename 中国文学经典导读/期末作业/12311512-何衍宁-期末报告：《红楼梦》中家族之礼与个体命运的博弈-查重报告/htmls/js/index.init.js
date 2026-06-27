/************************************* 返回顶部 **************************************************/
//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
  scrollFunction()
};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
/************************************* 返回顶部 **************************************************/

// 切换为简洁报告
$('.main10').click(function () {
  $('.main10').css('background', 'url(./htmls/images/background-active.png) 100% no-repeat');
  $('.main11').css('background', 'url(./htmls/images/background-normal.png) 100% no-repeat');

  $('.word15').css('color', '#ffffff');
  $('.txt4').css('color', '#0099F9');

  $('.icon4').attr('src', './htmls/images/icon-lock-active.png');
  $('.label2').attr('src', './htmls/images/icon-lock-unlock.png');

  $('.section23').hide();

  $('.word1').text('简洁版-查重报告');
})
// 切换为全文对照报告
$('.main11').click(function () {
  $('.main10').css('background', 'url(./htmls/images/background-normal.png) 100% no-repeat');
  $('.main11').css('background', 'url(./htmls/images/background-active.png) 100% no-repeat');

  $('.word15').css('color', 'rgba(0, 153, 249, 1)');
  $('.txt4').css('color', '#ffffff');

  $('.icon4').attr('src', './htmls/images/icon-lock-unlock.png');
  $('.label2').attr('src', './htmls/images/icon-lock-active.png');

  $('.section23').show();

  $('.word1').text('全文对照版-查重报告');
})

// 全文展开
$('.main24').click(function () {
  $('#suspender').show(); // 显示全文折叠
  $('#suspender').attr('class', 'main14');
  $('.main24').hide(); // 隐藏全文展开
  $('.papers-more').show();
})
// 全文折叠
$('.main14').click(function () {
  $('#suspender').hide();
  $('.main24').show();
  $('.papers-more').hide();
})

// 切换分类
$('.menulist>span').click(function () {
  $('.menu-active').removeClass("menu-active");
  $(this).addClass("menu-active");
})

$(function () {
  var $elm = $('#suspender');
  var startPos = $elm.offset().top;
  $(window).scroll(function () {
    var domHeight = $('.outer4').height();
    var topDistance = $('.outer4').offset().top;
    var p = $(window).scrollTop();
    $elm.attr('class', '');
    if (p < topDistance) {
      $elm.attr('class', 'main14');
      $elm.css('top', '180px');
    } else if (p > topDistance && p < domHeight) {
      $elm.attr('class', 'main14-fixed');
      $elm.css('top', '312px');
    } else if (p > domHeight) {
      $elm.attr('class', 'main14-end-fixed');
      $elm.css('top', (domHeight-500)+'px');
    }
  });
})