$(document).ready(function() {
  //Главный слайдер
  var loadLarge = function(){
    $('#mainslider .slideitems img[img]').each(function(){
      $(this).attr('src', $(this).attr('img')).removeAttr('img');
    });
  };
  loadLarge ();

  $('#mainslider .slider_nav li').hover(function(){
    var id = $(this).attr('id');
    var elmClass = $(this).attr('class');
    if (elmClass != 'border show') {
      var number = parseInt((/mainslidernav-(\d)/.exec(id))[1]);
      $('#mainslider .slideitems').stop().animate ({ top: String((number - 1) * -220) + 'px' }, 200);

      $('#mainslider .slider_nav .show').removeAttr('style').removeClass('show');    
      $(this).addClass('show');
      $(this).stop().animate ({ left: '-28px' }, 0);
    }
  },function(){});

  var randomnumber = Math.floor((Math.random() * 3) + 1);
  $('#kprftvbutton_' + randomnumber).addClass('show');
  $('#dkprftvbutton_' + randomnumber).addClass('show');
  
} );