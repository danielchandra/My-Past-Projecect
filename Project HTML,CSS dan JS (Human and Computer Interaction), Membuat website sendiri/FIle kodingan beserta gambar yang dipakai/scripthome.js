$(function(){

    $('.next').on('click',function(){
        var currentImg = $('.active');
        var nextImg = currentImg.next();
        var firstImg = currentImg.prevAll().last();

        if(nextImg.length>0){
            currentImg.removeClass('active').css('z-index','-10');
            nextImg.addClass('active').css('z-index','10');
        } else{
            currentImg.removeClass('active').css('z-index','-10')
            firstImg.addClass('active').css('z-index','10');
        }
    });

    $('.prev').on('click',function(){
        var currentImg = $('.active');
        var prevImg = currentImg.prev();
        var firstImg = currentImg.nextAll().last();

        if(prevImg.length>0){
            currentImg.removeClass('active').css('z-index','-10');
            prevImg.addClass('active').css('z-index','10');
        } else{
            currentImg.removeClass('active').css('z-index','-10')
            firstImg.addClass('active').css('z-index','10');
        }
    });
});