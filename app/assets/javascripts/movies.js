$(document).ready(function(){
  $('#fetch-movies').on('click', function(){
    if($('#movies').hasClass('hide-container')){
      return $.ajax({
      url: "/movies_call",
      method: 'GET'
    }).done(function(response){
      $('#movies').html(response);
      $('#movies').removeClass('hide-container');
    }).fail(function(error){
      console.log(error);
    });
    } else {
      $('#movies').addClass('hide-container');
    };
  });
});