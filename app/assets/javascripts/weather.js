$(document).ready(function(){
  console.log('js loaded...');
  $('#fetch-weather').on('click', function(){
    if($('#weather').hasClass('hide-container')){
      return $.ajax({
      url: "/weather",
      method: 'GET'
    }).done(function(response){
      $('#weather').html(response);
      $('#weather').removeClass('hide-container');
    }).fail(function(error){
      console.log(error);
    });
    } else {
      $('#weather').addClass('hide-container');
    };
  });
});