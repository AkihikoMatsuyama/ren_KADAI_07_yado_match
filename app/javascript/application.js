// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require moment
//= require bootstrap-datetimepicker
var data = {'data-date-format': 'YYYY-MM-DD' };
$(function(){
  $('.datepicker').attr(data);
  $('.datepicker').datetimepicker();
});
