$(document).ready(function(){
  $('#fetch-twitches').on('click', function(){
    if($('#twitch').hasClass('hide-container')){
      return $.ajax({
      url: "/twitch_call",
      method: 'GET'
    }).done(function(response){
      $('#twitch').html(response);
      $('#twitch').removeClass('hide-container');
    }).fail(function(error){
      console.log(error);
    });
    } else {
      $('#twitch').addClass('hide-container');
    };
  });
});