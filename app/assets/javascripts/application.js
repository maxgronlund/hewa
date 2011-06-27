// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require rails.validations


//= require jquery.Jcrop.min
$(function() {
  $('#cropbox').Jcrop({
    onChange: update_crop,
    onSelect: update_crop,
    setSelect: [0, 0, 500, 500],
    aspectRatio: 1
  });
});

function update_crop(coords) {
    var rx = 100/coords.w;
    var ry = 100/coords.h;
    var lw = $('#cropbox').width();
    var lh = $('#cropbox').height();
    var ratio = <%= @account.profile_geometry[:width] %> / lw ;

  $('#preview').css({
    width: Math.round(rx * lw) + 'px',
    height: Math.round(ry * lh) + 'px',
    marginLeft: '-' + Math.round(rx * coords.x) + 'px',
    marginTop: '-' + Math.round(ry * coords.y) + 'px'
  });
  $("#crop_x").val(Math.round(coords.x * ratio));
  $("#crop_y").val(Math.round(coords.y * ratio));
  $("#crop_w").val(Math.round(coords.w * ratio));
  $("#crop_h").val(Math.round(coords.h * ratio));
}
