$('.chosen-wrapper').html("<%= j render :partial => 'victims/choose' %>");
(function(){
    $('.chosen-wrapper').css({
                          'z-index' : '5',
                          'opacity' : '1'
    });
    $('.footer').css({
                          'opacity' : '0'
    });

  })();
