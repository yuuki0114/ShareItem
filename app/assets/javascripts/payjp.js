$(function() {
  Payjp.setPublicKey('pk_test_c5f9b46a7b4641bb1607c94c');
  
  $("#token_submit").on('click', function(e){
    e.preventDefault();
    var year = $("#exp_year").val()
    var month = $("#exp_month").val()
    exp_year = String(year);
    exp_month= String(month);
    let card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(), 
      exp_month: exp_month,
      exp_year: exp_year
    };
    Payjp.createToken(card, function(status, response){
      if (status === 200) {
        $("#charge-form").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        );
        $('#charge-form').submit();
      } else {
        alert("カード情報が正しくありません。");
      }
    });
  });
});