$(document).ready(function () {
    var $elem = $('#Slideshow');
    var total = $elem.find('.slides').children().length;
    var current = 1;

    //okay first we hide everything
    $('.slides > li').children().hide();
    $('.slides img:eq(0)').fadeIn(1000);
    $('.phrases').children().hide();
    $('.phrases li:eq(0)').fadeIn(1000);
    $('.textblock').children().hide();
    $('.textblock li:eq(0)').fadeIn(1000);

    var index = 0;
    setInterval(function () {
        var $curSlide = $('.slides img:eq(' + index + ')');
        var $curPhr = $('.phrases li:eq(' + index + ')');
        var $curTxt = $('.textblock li:eq(' + index + ')');

        var $nextSlide = $('.slides img:eq(' + (index + 1) + ')');
        var $nextPhr = $('.phrases li:eq(' + (index + 1) + ')');
        var $nextTxt = $('.textblock li:eq(' + (index + 1) + ')');

        var ulHeight = $('.textblock').innerHeight();
        var liHeight = $('.textblock > li').innerHeight();
        var spanHeight = $('.textblock > li .text').innerHeight();
        var top = (ulHeight - spanHeight) / 2;
        //alert('ulHeight = ' + ulHeight + '\n li Height=' + liHeight + '\n spanHeight=' + spanHeight);

        //hide the current slide.
        $curSlide.animate({ 'opacity': '0' }, 1500, 'easeOutSine');
        $curPhr.animate({ 'opacity': '0' }, 1500, 'easeOutSine');
        $curTxt.animate({ 'opacity': '0' }, 1500, 'easeOutSine');

        //display the next slide.
        $nextSlide.css({ 'opacity': '0' }).fadeIn().animate({ 'opacity': '1' }, 1500, 'easeInSine');
        $nextPhr.css('opacity', '0').fadeIn().animate({ 'opacity': '1' }, 1500, 'easeInSine');
        $nextTxt.css({ 'opacity': '0' }).fadeIn().animate({ 'opacity': '1' }, 1500, 'easeInSine');

        if ((index + 1) < $('.slides').children().length) {
            index++;
        }
        else {
            index = 0;
            $('.slides img:eq(' + index + ')').css({ 'opacity': '0'}).show().animate({'opacity': '1' }, 1500, 'easeInSine');
            $('.phrases li:eq(' + index + ')').css('opacity', '0').show().animate({ 'opacity': '1' }, 1500, 'easeInSine');
            $('.textblock li:eq(' + index + ')').css('opacity', '0').show().animate({ 'opacity': '1' }, 1500, 'easeInSine');
        }
    }, 8000);

});