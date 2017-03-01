$(document).ready(function(){
  console.log('js loaded...');
  $('#fetch-top').on('click', function(){
    if($('#top-twitch').hasClass('hide-container')){
      return $.ajax({
      url: "/top_twitch",
      method: 'GET'
    }).done(function(response){
      $('#top-twitch').html(response);
      $('#top-twitch').removeClass('hide-container');
    }).fail(function(error){
      console.log(error);
    });
    } else {
      $('#top-twitch').addClass('hide-container');
    };
  });
});