$(document).ready(function(){
  $('#fetch-hackers').on('click', function(){
    if($('#hackers').hasClass('hide-container')){
      return $.ajax({
      url: "/hacker_call",
      method: 'GET'
    }).done(function(response){
      $('#hackers').html(response);
      $('#hackers').removeClass('hide-container');
    }).fail(function(error){
      console.log(error);
    });
    } else {
      $('#hackers').addClass('hide-container');
    };
  });
});