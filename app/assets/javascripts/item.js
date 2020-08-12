$(function() {
  $("#itemSubmit").on('click', function(){
    $("#itemNew").append(
      $('<input type="hidden" name="item[trading_status]">').val('出品中')
    );
    console.log(test);
  });
});