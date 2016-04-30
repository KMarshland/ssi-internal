//set the csrf headers with ajax
// beforeSend: fixCSRF
function fixCSRF(xhr) {
    xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
}

function onVisibilityChange(el, callback, opts) {
    var old_visible;
    return function () {
        var visible = elementInViewport(el, opts);
        if (visible != old_visible) {
            old_visible = visible;
            if (typeof callback == 'function') {
                callback(visible);
            }
        }
    }
}

function elementInViewport(el, opts) {
    //special bonus for those using jQuery
    if (typeof jQuery === "function" && el instanceof jQuery) {
        el = el[0];
    }

    opts = opts || {};

    var rect = el.getBoundingClientRect();

    return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= ((window.innerHeight || (window).height()) + opts.preload) &&
        rect.right <= (window.innerWidth || $(window).width())
    );
}