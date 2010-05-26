// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$().ready(function() {
  
  $('#room_password').hide();
  $('#password_label').hide().val('Enter password').focus(function() {
    $(this).hide();
    $('#room_password').show().focus();
  });
  $('#room_private').change(function() {
    if (this.checked) {
      $('#password_label').show();
      $('#room_password').hide();
    }
    else {
      $('#password_label').hide();
      $('#room_password').hide();
    }
  }).val(false); // Always reset to unchecked for when we fail validation.
  
});

