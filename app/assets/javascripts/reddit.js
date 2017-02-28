$(document).ready(function(){
  $('#fetch-reddit').on('click', function(){
    if($('#reddit').hasClass('hide-container')){
      return $.ajax({
      url: "/reddit_call",
      method: 'GET'
    }).done(function(response){
      $('#reddit').html(response);
      $('#reddit').removeClass('hide-container');
    }).fail(function(error){
      console.log(error);
    });
    } else {
      $('#reddit').addClass('hide-container');
    };
  });
});