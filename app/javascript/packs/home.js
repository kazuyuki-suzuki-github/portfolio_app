$(function() {
  $(".panel-btn").click(function(){
    console.log('あいうえお')
    var clickPanel = $("+.panel",this);
    clickPanel.toggle();
    return false;
  });
});