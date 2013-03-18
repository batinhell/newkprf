// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require ckeditor/init
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
$(document).ready(function(){
  $('#slidorion').slidorion({
    effect: 'slideLeft',
    autoPlay: false,
    speed: 500
  });

  (function(){
        // menu interaction
        var $menuTop = $('ul.menuTop');

        $menuTop.children('li:has(.subMenu)').mouseenter(function(){
           // for( var key in popups )
           //    if( popups[key].visible )
           //       popups[key].block.stop(true).animate({top: 666 }, 333);
           $('.subMenu', this).show("fast");//.animate({top: 266 }, 333);

        }).mouseleave(function(){
           // for( var key in popups )
           //    if( popups[key].visible )
           //       popups[key].block.stop(true).animate({top: 310 }, 333);
            $('.subMenu', this).hide(300);//.animate({top: 130 }, 333);
        });
     })();

});