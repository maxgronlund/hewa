// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.Jcrop.min
//= require jquery_nested_form
//  require_tree .
//= require_directory .
//- require tiny_mce/tiny_mce
//= require rails.validations
//= require chosen.jquery.min

$(function() {
	$('form.upload').bind('submit', function() {
		$('form.upload .spinner').show();
		return true;
	});
});

$(document).ready(function() {
	$('.chzn-select').chosen();
});
