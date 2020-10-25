$(function() {
  $(".panel-btn").click(function(){
    var clickPanel = $("+.panel",this);
    clickPanel.toggle();
    return false;
  });
});