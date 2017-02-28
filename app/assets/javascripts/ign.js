$(document).ready(function(){
  $('#fetch-ign').on('click', function(){
    if($('#ign').hasClass('hide-container')){
      return $.ajax({
      url: "/ign_call",
      method: 'GET'
    }).done(function(response){
      $('#ign').html(response);
      $('#ign').removeClass('hide-container');
    }).fail(function(error){
      console.log(error);
    });
    } else {
      $('#ign').addClass('hide-container');
    };
  });
});