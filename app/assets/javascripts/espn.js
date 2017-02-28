$(document).ready(function(){
  $('#fetch-espn').on('click', function(){
    if($('#espn').hasClass('hide-container')){
      return $.ajax({
      url: "/espn_call",
      method: 'GET'
    }).done(function(response){
      $('#espn').html(response);
      $('#espn').removeClass('hide-container');
    }).fail(function(error){
      console.log(error);
    });
    } else {
      $('#espn').addClass('hide-container');
    };
  });
});