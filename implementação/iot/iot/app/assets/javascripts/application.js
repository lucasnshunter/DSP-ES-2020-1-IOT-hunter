// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
crossorigin="anonymous"
$(document).ready(function(){
	$.get( "http://apidev.accuweather.com/currentconditions/v1/36728.json?language=pt&apikey=hoArfRosT1215", function(data) {
	$('#temperatura').html(data[0].Temperature.Metric.Value);
	$('#clima').html(data[0].WeatherText);
	$('#icone').attr('src','https://vortex.accuweather.com/adc2010/images/slate/icons/' + data[0].WeatherIcon + '.svg');
	});
});
