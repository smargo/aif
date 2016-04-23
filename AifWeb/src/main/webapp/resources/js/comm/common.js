/*
 * JavaScript - Common
 * Version: 1.0
 */

// 添加Cookie
function addCookie(name, value, options) {
    if (arguments.length > 1 && name != null) {
	if (options == null) {
	    options = {};
	}
	if (value == null) {
	    options.expires = -1;
	}
	if (typeof options.expires == "number") {
	    var time = options.expires;
	    var expires = options.expires = new Date();
	    expires.setTime(expires.getTime() + time * 1000);
	}
	document.cookie = encodeURIComponent(String(name)) + "=" + encodeURIComponent(String(value)) + (options.expires ? "; expires=" + options.expires.toUTCString() : "") + (options.path ? "; path=" + options.path : "") + (options.domain ? "; domain=" + options.domain : ""), (options.secure ? "; secure" : "");
    }
}

// 获取Cookie
function getCookie(name) {
    if (name != null) {
	var value = new RegExp("(?:^|; )" + encodeURIComponent(String(name)) + "=([^;]*)").exec(document.cookie);
	return value ? decodeURIComponent(value[1]) : null;
    }
}

// 移除Cookie
function removeCookie(name, options) {
    addCookie(name, null, options);
}



(function($) {

    // 令牌
    $(document).ajaxSend(function(event, request, settings) {
	if (!settings.crossDomain && settings.type != null && settings.type.toLowerCase() == "post") {
	    var token = getCookie("token");
	    if (token != null) {
		request.setRequestHeader("token", token);
	    }
	}
    });

    $(document).ajaxComplete(function(event, request, settings) {
	var loginStatus = request.getResponseHeader("loginStatus");
	var tokenStatus = request.getResponseHeader("tokenStatus");

	if (loginStatus == "accessDenied") {
	    $.redirectLogin(location.href, "请登录后再进行操作");
	} else if (tokenStatus == "accessDenied") {
	    var token = getCookie("token");
	    if (token != null) {
		$.extend(settings, {
		    global: false,
		    headers: {token: token}
		});
		$.ajax(settings);
	    }
	}
    });

})(jQuery);

// 令牌
$().ready(function() {

    $("form").submit(function() {
	var $this = $(this);
	if ($this.attr("method") != null && $this.attr("method").toLowerCase() == "post" && $this.find("input[name='token']").size() == 0) {
	    var token = getCookie("token");
	    if (token != null) {
		$this.append('<input type="hidden" name="token" value="' + token + '" \/>');
	    }
	}
    });

});
