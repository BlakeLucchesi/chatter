// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var Application = { vars: {} }

var running = true;

$(document).ready(function() {
  
  // Setup the window.
  $('input[type=text]', '#chatbox').focus();
  scroll_bottom();
  resize_window();
  
  // Poll for updates.
  if ($('#rooms-show').size() > 0 && running) {
    $.PeriodicalUpdater('/rooms/'+Application.vars.room_id+'/update', {
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
  var hoffset = 120;
  var height = $(window).height() - $('#room-header').height() - $('#chatbox').height() - hoffset;
  $('#messages').css('height', height+'px');
  
  var woffset = 130;
  var width = $(window).width() - $('inpu[type=submit]', '#chatbox').width() - woffset;
  $('input[type=text]', '#chatbox').css('width', width+'px');
}

function get_last_id() {
  return $('.message:last', '#messages').attr('id');
}

function scroll_bottom() {
  $('#messages').animate({scrollTop: $('#messages')[0].scrollHeight+'px'});
}