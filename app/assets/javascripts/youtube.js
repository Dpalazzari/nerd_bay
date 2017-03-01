$(document).ready(function(){
  console.log('js loaded...');
  $('#fetch-youtube').on('click', function(){
    if($('#youtube').hasClass('hide-container')){
      return $.ajax({
      url: "/youtube",
      method: 'GET'
    }).done(function(response){
      $('#youtube').html(response);
      $('#youtube').removeClass('hide-container');
    }).fail(function(error){
      console.log(error);
    });
    } else {
      $('#youtube').addClass('hide-container');
    };
  });
});