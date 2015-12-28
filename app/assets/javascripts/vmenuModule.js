
(function($) {
	$.fn.vmenuModule = function(option) {
		var obj,
			item;
		var options = $.extend({
				Speed: 220,
				autostart: true,
				autohide: 1
			},
			option);
		obj = $(this);

		item = obj.find("ul").parent("li").children("div[class*='parent']").children("div.setting");
		
		item.attr("data-option", "off");
		item.unbind('click').on("click", function() {
			var a = $(this);
			var myDivParent = a.parent("div[class*='parent']");
			if (options.autohide) {
				//alert("Hi");
				//a.parent().parent().find("a[data-option='on']").parent("li").children("ul").slideUp(options.Speed / 1.2,
				myDivParent.parent().parent().find("div[data-option='on']").parent("div[class*='parent']").parent("li").children("ul").slideUp(options.Speed / 1.2,
					function() {
						
						//$(this).parent("li").children("div.setting").attr("data-option", "off");
						$(this).parent("li").children("div[class*='parent']").children("div.setting").attr("data-option", "off");
					})
			}
			if (a.attr("data-option") == "off") {
				myDivParent.parent("li").children("ul").slideDown(options.Speed,
					function() {
						a.attr("data-option", "on");
					});
			}
			if (a.attr("data-option") == "on") {
				a.attr("data-option", "off");
				myDivParent.parent("li").children("ul").slideUp(options.Speed)
			}
		});
		if (options.autostart) {
			//obj.find("a").each(function() {
			obj.find("div.setting").each(function() {
				myDivParent.parent("li").parent("ul").slideDown(options.Speed,
					function() {
						myDivParent.parent("li").children("div.setting").attr("data-option", "on");
					})
			})
		}

	}
})(window.jQuery || window.Zepto);