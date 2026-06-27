/**
 * 页面响应式调整
 */
 function get_device_agent(){
  var ua = navigator.userAgent,
  isWindowsPhone = /(?:Windows Phone)/.test(ua),
  isSymbian = /(?:SymbianOS)/.test(ua) || isWindowsPhone,
  isAndroid = /(?:Android)/.test(ua),
  isFireFox = /(?:Firefox)/.test(ua),
  isChrome = /(?:Chrome|CriOS)/.test(ua),
  isTablet = /(?:iPad|PlayBook)/.test(ua) || (isAndroid && !/(?:Mobile)/.test(ua)) || (isFireFox && /(?:Tablet)/.test(ua)),
  isPhone = /(?:iPhone)/.test(ua) && !isTablet,
  isPc = !isPhone && !isAndroid && !isSymbian;
  return {
      isTablet: isTablet,
      isPhone: isPhone,
      isAndroid: isAndroid,
      isPc: isPc
  };
}
if(get_device_agent().isPc) {
  // title 竖线
  $('.vertical-line').show();
  // 分页交替显示
  $('.out-iframge-page').show();
  $('.in-iframge-page').hide();
  $('.line-left, .line-right').show();
}else{
  $('#cont_right_body').css('margin-left', '0px');
  $('.vertical-line').hide();
  $('.out-iframge-page').hide();
  $('.in-iframge-page').show();
  $('.line-left, .line-right').hide();
}