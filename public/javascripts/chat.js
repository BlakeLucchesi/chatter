var Application = { vars: {} }

var running = true; // Disable polling during debug.

$().ready(function() {

  // Focus on the chat text input.
  $('input[type=text]', '#chatbox').focus();

  // Listen for window resizing.
  resize_window();
  scroll_bottom();
  
  // Poll for updates.
  if ($('#rooms-show').size() > 0 && running) {    
    // Poll for updates
    $.PeriodicalUpdater('/rooms/'+Application.vars.room_id+'/updates', {
        method: 'get',          // method; get or post
          data: {message_id: get_last_id }, // array of values to be passed to the page - e.g. {name: "John", greeting: "hello"}
          minTimeout: 500,     // starting value for the timeout in milliseconds
          maxTimeout: 5000,     // maximum length of time between requests
          multiplier: 1.5,      // if set to 2, timerInterval will double each time the response hasn't changed (up to maxTimeout)
          type: 'html',         // response type - text, xml, json, etc.  See $.ajax config options
        maxCalls: 0,            // maximum number of calls. 0 = no limit.
        autoStop: 0             // automatically stop requests after this many returns of the same data. 0 = disabled.
    }, function(response) {
      if (response) {
        $('#messages').append(response);
        scroll_bottom();        
      }
    });
  }
});

$(window).resize(resize_window);

function resize_window() {
  var sideoffset = 70;
  $('#room-main').width($('#wrapper').width() - $('#room-sidebar').width() - sideoffset+'px');

  var voffset = 165;
  var height = $(window).height() - $('#room-header').height() - $('#chatbox').height() - voffset;
  $('#messages').css('height', height+'px');
  
  var hoffset = 60;
  var width = $('#chatbox').width() - hoffset;
  $('input[type=text]', '#chatbox').css('width', width+'px');
}

function get_last_id() {
  return $('.message:last', '#messages').attr('id');
}

function scroll_bottom() {
  $('#messages').animate({scrollTop: $('#messages')[0].scrollHeight+'px'});
}