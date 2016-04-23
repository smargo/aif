!function(){

    /*延迟加载*/
    (function(){
        var animateDiv = $('.piaoju .process-con');
        animateEle();
        $(window).scroll(function(){
            animateEle()
        });
        function animateEle(){
            var playRange = {top: $(window).scrollTop(), bottom: $(window).scrollTop() + $(window).height()};
            animateDiv.each(function(){
                if(playRange.top <= $(this).offset().top && playRange.bottom >= $(this).offset().top && !$(this).data('bPlay')){
                    $(this).data('bPlay', true);
                    var nPercent = $(this).parent().find('.process-num').text().replace(/\%/, '');
                    $(this).svgCircle({
                        parent : $(this)[0],
                        w : 132,
                        R : 22,
                        sW : 6,
                        color : ["#5cdc6a","#5cdc6a", "#5cdc6a"],
                        perent: [100, nPercent],
                        speed: 150,
                        delay: 400
                    });
                }
            });
        }
    })();

    /*开抢倒计时*/
    $('.piao-countdown').each(function(){
        var $this = $(this);
        var $spanWrap = $this.find('span');
        var startMs = $this.next().val();
        var nowMs = $this.next().next().val();
        if (nowMs < startMs) {
            var times = (startMs - nowMs) / 1000.0;
            times = times.toFixed(0);
            new CountDown({$hour: $spanWrap.eq(0), $min: $spanWrap.eq(1), $second: $spanWrap.eq(2), totalSecond: times, endFn: function(){$this.replaceWith(getBuyBtn());}});
        } else {
            $this.replaceWith(getBuyBtn());
        }
    });
    function getBuyBtn() {
        return '<a class="btn-comm btn-buy" href="javascript:;">我要购买</a>';
    }
    var showChance = function(){
        var html = '<div class="tankuang_1"><h1><p>温馨提示</p><span class="close"></span></h1><p class="one">有用户订单还没有付款，您还有机会！</p>  <p class="two"><input  id="pagebtn" type="button" value="确定"/></p></div>';
        var w = $.layer({
            type: 1,
            title: false,
            area: ['auto', 'auto'],
            border:[0],
            closeBtn:[0,false],
            page: {html: html}
        });
        $('#pagebtn,.tankuang_1 h1 .close').on('click',function(){
            layer.close(w);
        });
    };
    var init  = function(){
        console.log("init");
    };
    window["bill"] = {
        init:init,
        showChance:showChance
    };
}();

$(function(){
    bill.init();
});
