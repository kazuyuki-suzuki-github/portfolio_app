$(function() {
  $(".panel-btn").click(function(){
    var clickPanel = $("+.panel",this);
    clickPanel.toggle();
    return false;
  });

  // 画像のスライドショー
  var slideWidth = $('.slide').outerWidth();
  var slideNum = $('.slide').length;
  console.log(slideNum)
  var slideSetWidth = slideWidth * slideNum;
  $('.slideSet').css('width', slideSetWidth);
  var slideCurrent = 0;
  var sliding = function(){
    console.log(slideCurrent)
    if( slideCurrent < 0 ){
      slideCurrent = slideNum - 1;
    }else if( slideCurrent > slideNum - 1){
      slideCurrent = 0;
    }

    $('.slideSet').animate({
      left: slideCurrent * -slideWidth
    });
  }

  // 前へボタンが押されたとき
  $('.slider-prev').click(function(){
    slideCurrent--;
    sliding();
  });

  // 次へボタンが押されたとき
  $('.slider-next').click(function(){
    slideCurrent++;
    sliding();
  });
});