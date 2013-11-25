/**
 * Created with IntelliJ IDEA.
 * User: twer
 * Date: 11/25/13
 * Time: 2:22 PM
 * To change this template use File | Settings | File Templates.
 */

(function ($) {
    $.fn.animateNumbers = function (stop, commas, duration, ease) {
        return this.each(function () {
            var $this = $(this);
            var start = parseInt($this.text().replace(/,/g, ""));
            commas = (commas === undefined) ? true : commas;
            $({value: start}).animate({value: stop}, {
                duration: duration == undefined ? 1000 : duration,
                easing: ease == undefined ? "swing" : ease,
                step: function () {
                    $this.text(Math.floor(this.value));
                    if (commas) {
                        $this.text($this.text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                    }
                },
                complete: function () {
                    if (parseInt($this.text()) !== stop) {
                        $this.text(stop);
                        if (commas) {
                            $this.text($this.text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                        }
                    }
                }
            });
        });
    };
})(jQuery);