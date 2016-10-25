// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require ckeditor/init
//= require_tree .

$(document).ready(function() {
  $('.dropdown-toggle').dropdown();
});

$('#notificationLink').click(function() {
  $('#notificationContainer').fadeToggle(300);
  $('#notification_count').fadeOut("slow");
  return false;
});

$(document).click(function() {
  $('#notificationContainer').hide();
});

var currentImage;
var currentIndex = -1;
var interval;
function showImage(index){
  if(index < $('#bigPic img').length){
    var indexImage = $('#bigPic img')[index]
      if(currentImage){
        if(currentImage != indexImage ){
          $(currentImage).css('z-index',2);
          clearTimeout(myTimer);
          $(currentImage).fadeOut(250, function() {
            myTimer = setTimeout("showNext()", 3000);
            $(this).css({'display':'none','z-index':1})
          });
        }
      }
    $(indexImage).css({'display':'block', 'opacity':1});
    currentImage = indexImage;
    currentIndex = index;
    $('#thumbs li').removeClass('active');
    $($('#thumbs li')[index]).addClass('active');
  }
}

function showNext(){
  var len = $('#bigPic img').length;
  var next = currentIndex < (len-1) ? currentIndex + 1 : 0;
  showImage(next);
}

var myTimer;
function times_out() {
  myTimer = setTimeout('showNext()', 3000);
  showNext();
}
times_out();


