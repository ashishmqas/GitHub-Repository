//* jQuery.browser.mobile (http://detectmobilebrowser.com/)
//* jQuery.browser.mobile will be true if the browser is a mobile device
;
(function (a) {
	jQuery.browser.mobile = /android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))
})(navigator.userAgent || navigator.vendor || window.opera);

//* jQuery detect touch devices
is_touch_device = ('ontouchstart' in document.documentElement);

//if (!jQuery.browser.mobile) {
//	//** Smooth Navigational Menu- By Dynamic Drive DHTML code library: http://www.dynamicdrive.com
//	//** Script Download/ instructions page: http://www.dynamicdrive.com/dynamicindex1/ddlevelsmenu/
//	var ddsmoothmenu = {
//		arrowimages : {
//			down : ["downarrowclass", "../img/blank.gif", 23],
//			right : ["rightarrowclass", "../img/blank.gif"]
//		},
//		transition : {
//			overtime : 150,
//			outtime : 150
//		},
//		shadow : {
//			enable : !1,
//			offsetx : 5,
//			offsety : 5
//		},
//		showhidedelay : {
//			showdelay : 100,
//			hidedelay : 100
//		},
//		detectwebkit : -1 != navigator.userAgent.toLowerCase().indexOf("applewebkit"),
//		detectie6 : document.all && !window.XMLHttpRequest,
//		css3support : window.msPerformance || !document.all && document.querySelector,
//		getajaxmenu : function (a, d) {
//			var b = a("#" + d.contentsource[0]);
//			b.html("Loading Menu...");
//			a.ajax({
//				url : d.contentsource[1],
//				async : !0,
//				error : function (a) {
//					b.html("Error fetching content. Server Response: " + a.responseText)
//				},
//				success : function (e) {
//					b.html(e);
//					ddsmoothmenu.buildmenu(a, d)
//				}
//			})
//		},
//		buildmenu : function (a, d) {
//			var b = ddsmoothmenu,
//			e = a("#" + d.mainmenuid + ">ul");
//			e.parent().get(0).className = d.classname || "ddsmoothmenu";
//			var h = e.find("ul").parent();
//			h.hover(function () {
//				a(this).children("a:eq(0)").addClass("selected")
//			}, function () {
//				a(this).children("a:eq(0)").removeClass("selected")
//			});
//			h.each(function (e) {
//				var g = a(this).css({
//						zIndex : 100 - e
//					}),
//				f = a(this).find("ul:eq(0)").css({
//						display : "block"
//					});
//				f.data("timers", {});
//				this._dimensions = {
//					w : this.offsetWidth,
//					h : this.offsetHeight,
//					subulw : f.outerWidth(),
//					subulh : f.outerHeight()
//				};
//				this.istopheader = 1 == g.parents("ul").length ? !0 : !1;
//				f.css({
//					top : this.istopheader && "v" != d.orientation ? this._dimensions.h + "px" : 0
//				});
//				g.children("a:eq(0)").css(this.istopheader ? {
//					paddingRight : b.arrowimages.down[2]
//				}
//					 : {}).append('<img src="' + (this.istopheader && "v" != d.orientation ? b.arrowimages.down[1] : b.arrowimages.right[1]) + '" class="' + (this.istopheader && "v" != d.orientation ? b.arrowimages.down[0] : b.arrowimages.right[0]) + '" style="border:0;" />');
//				b.shadow.enable && !b.css3support && (this._shadowoffset = {
//						x : this.istopheader ? f.offset().left + b.shadow.offsetx : this._dimensions.w,
//						y : this.istopheader ? f.offset().top + b.shadow.offsety : g.position().top
//					}, $parentshadow = this.istopheader ? a(document.body) : g.parents("li:eq(0)").get(0).$shadow, this.$shadow = a('<div class="ddshadow' + (this.istopheader ? " toplevelshadow" : "") + '"></div>').prependTo($parentshadow).css({
//							left : this._shadowoffset.x + "px",
//							top : this._shadowoffset.y + "px"
//						}));
//				g.hover(function () {
//					var c = g.get(0);
//					clearTimeout(f.data("timers").hidetimer);
//					f.data("timers").showtimer = setTimeout(function () {
//							c._offsets = {
//								left : g.offset().left,
//								top : g.offset().top
//							};
//							var e = c.istopheader && d.orientation != "v" ? 0 : c._dimensions.w,
//							e = c._offsets.left + e + c._dimensions.subulw > a(window).width() ? c.istopheader && d.orientation != "v" ? -c._dimensions.subulw + c._dimensions.w : -c._dimensions.w : e;
//							if (f.queue().length <= 1) {
//								f.css({
//									left : e + "px",
//									width : c._dimensions.subulw + "px"
//								}).animate({
//									height : "show",
//									opacity : "show"
//								}, ddsmoothmenu.transition.overtime);
//								if (b.shadow.enable && !b.css3support) {
//									var e = c.istopheader ? f.offset().left + ddsmoothmenu.shadow.offsetx : e,
//									h = c.istopheader ? f.offset().top + b.shadow.offsety : c._shadowoffset.y;
//									!c.istopheader && ddsmoothmenu.detectwebkit && c.$shadow.css({
//										opacity : 1
//									});
//									c.$shadow.css({
//										overflow : "",
//										width : c._dimensions.subulw + "px",
//										left : e + "px",
//										top : h + "px"
//									}).animate({
//										height : c._dimensions.subulh + "px"
//									}, ddsmoothmenu.transition.overtime)
//								}
//							}
//						}, ddsmoothmenu.showhidedelay.showdelay)
//				}, function () {
//					var a = g.get(0);
//					clearTimeout(f.data("timers").showtimer);
//					f.data("timers").hidetimer = setTimeout(function () {
//							f.animate({
//								height : "hide",
//								opacity : "hide"
//							}, ddsmoothmenu.transition.outtime);
//							if (b.shadow.enable && !b.css3support) {
//								ddsmoothmenu.detectwebkit && a.$shadow.children("div:eq(0)").css({
//									opacity : 0
//								});
//								a.$shadow.css({
//									overflow : "hidden"
//								}).animate({
//									height : 0
//								}, ddsmoothmenu.transition.outtime)
//							}
//						}, ddsmoothmenu.showhidedelay.hidedelay)
//				})
//			});
//			if (b.shadow.enable && b.css3support)
//				for (var h = a("#" + d.mainmenuid + " ul li ul"), k = parseInt(b.shadow.offsetx) + "px " + parseInt(b.shadow.offsety) + "px 5px #aaa", j = ["boxShadow", "MozBoxShadow", "WebkitBoxShadow", "MsBoxShadow"], i = 0; i < j.length; i++)
//					h.css(j[i], k);
//			e.find("ul").css({
//				display : "none",
//				visibility : "visible"
//			})
//		},
//		init : function (a) {
//			if ("object" == typeof a.customtheme && 2 == a.customtheme.length) {
//				var d = "#" + a.mainmenuid;
//				document.write('<style type="text/css">\n' + ("v" == a.orientation ? d : d + ", " + d) + " ul li a {background:" + a.customtheme[0] + ";}\n" + d + " ul li a:hover {background:" + a.customtheme[1] + ";}\n</style>")
//			}
//			this.shadow.enable = document.all && !window.XMLHttpRequest ? !1 : this.shadow.enable;
//			jQuery(document).ready(function (b) {
//				"object" == typeof a.contentsource ? ddsmoothmenu.getajaxmenu(b, a) : ddsmoothmenu.buildmenu(b, a)
//			})
//		}
//	};
//};

/*! http://tinynav.viljamis.com v1.03 by @viljamis */
(function (a, i, g) {
	a.fn.tinyNav = function (j) {
		var c = a.extend({
				active : "selected",
				header : !1
			}, j);
		return this.each(function () {
			g++;
			var h = a(this),
			d = "tinynav" + g,
			e = ".l_" + d,
			b = a("<select/>").addClass("tinynav " + d);
			if (h.is("ul,ol")) {
				c.header && b.append(a("<option/>").text("-- Navigation --"));
				var f = "";
				h.addClass("l_" + d).find("a").each(function () {
					f += '<option value="' + a(this).attr("href") + '">' + a(this).text() + "</option>"
				});
				b.append(f);
				c.header || b.find(":eq(" + a(e + " li").index(a(e + " li." + c.active)) + ")").attr("selected", !0);
				b.change(function () {
					i.location.href = a(this).val()
				});
				a(e).after(b)
			}
		})
	}
})(jQuery, this, 0);

// Autosize 1.6 - jQuery plugin for textareas
// (c) 2011 Jack Moore - jacklmoore.com
// license: www.opensource.org/licenses/mit-license.php
;
(function (a) {
	var h = "hidden",
	i = "fontFamily,fontSize,fontWeight,fontStyle,letterSpacing,textTransform,wordSpacing".split(","),
	g = a('<textarea style="position:absolute; top:-9999px; left:-9999px; right:auto; bottom:auto; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden">')[0];
	g.setAttribute("oninput", "return");
	a.fn.autosize = a.isFunction(g.oninput) || "onpropertychange" in g ? function (g) {
		return this.each(function () {
			function c() {
				var a,
				c;
				j || (j = !0, d.value = b.value, d.style.overflowY = b.style.overflowY, d.style.width = e.css("width"), d.scrollTop = 0, d.scrollTop = 9E4, a = d.scrollTop, c = h, a > f ? (a = f, c = "scroll") : a < l && (a = l), b.style.overflowY = c, b.style.height = b.style.minHeight = b.style.maxHeight = a + 12 + "px", setTimeout(function () {
						j = !1
					}, 1))
			}
			var b = this,
			e = a(b).css({
					overflow : h,
					overflowY : h,
					wordWrap : "break-word"
				}),
			d = a('<textarea style="position:absolute; top:-9999px; left:-9999px; right:auto; bottom:auto; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden">').addClass(g || "autosizejs")[0],
			l = e.height(),
			f = parseInt(e.css("maxHeight"), 10),
			j,
			k = i.length;
			for (f = f && 0 < f ? f : 9E4; k--; )
				d.style[i[k]] = e.css(i[k]);
			a("body").append(d);
			"onpropertychange" in b ? "oninput" in b ? b.oninput = b.onkeyup = c : b.onpropertychange = c : b.oninput = c;
			a(window).resize(c);
			e.bind("autosize", c);
			c()
		})
	}
	 : function () {
		return this
	}
})(jQuery);

//* jQuery.counter.js (jQuery Character and Word Counter plugin)
//* v2.1 (c) Wilkins Fernandez
//* MIT License
;
(function (a) {
	a.fn.extend({
		counter : function (b) {
			var c = {
				type : "char",
				count : "down",
				goal : 140,
				text : true,
				msg : ""
			},
			d = "",
			e = "",
			f = false,
			b = a.extend({}, c, b),
			g = {
				init : function (b) {
					var c = b.attr("id"),
					e = c + "_count";
					g.isLimitless();
					a("<div/>").attr("id", c + "_counter").html('<span id=' + e + ' class="lbl info_bg"/> ' + g.setMsg()).insertAfter(b);
					d = a("#" + e);
					g.bind(b)
				},
				bind : function (a) {
					a.bind("keypress.counter keydown.counter keyup.counter blur.counter focus.counter change.counter paste.counter", g.updateCounter);
					a.bind("keydown.counter", g.doStopTyping);
					a.trigger("keydown")
				},
				isLimitless : function () {
					if (b.goal === "sky") {
						b.count = "up";
						f = true;
						return f
					}
				},
				setMsg : function () {
					if (b.msg !== "") {
						return b.msg
					}
					if (b.text === false) {
						return ""
					}
					if (f) {
						if (b.msg !== "") {
							return b.msg
						} else {
							return ""
						}
					}
					this.text = "character word left max".split(" ");
					this.chars = "s ( )".split(" ");
					this.msg = null;
					switch (b.type) {
					case "char":
						if (b.count === c.count && b.text) {
							this.msg = this.text[0] + this.chars[1] + this.chars[0] + this.chars[2] + " " + this.text[2]
						} else if (b.count === "up" && b.text) {
							this.msg = this.text[0] + this.chars[0] + " " + this.chars[1] + b.goal + " " + this.text[3] + this.chars[2]
						}
						break;
					case "word":
						if (b.count === c.count && b.text) {
							this.msg = this.text[1] + this.chars[1] + this.chars[0] + this.chars[2] + " " + this.text[2]
						} else if (b.count === "up" && b.text) {
							this.msg = this.text[1] + this.chars[1] + this.chars[0] + this.chars[2] + " " + this.chars[1] + b.goal + " " + this.text[3] + this.chars[2]
						}
						break;
					default:
					}
					return this.msg
				},
				getWords : function (b) {
					if (b !== "") {
						return a.trim(b).replace(/\s+/g, " ").split(" ").length
					} else {
						return 0
					}
				},
				updateCounter : function (f) {
					var h = a(this);
					if (e < 0 || e > b.goal) {
						g.passedGoal(h)
					}
					if (b.type === c.type) {
						if (b.count === c.count) {
							e = b.goal - h.val().length;
							if (e <= 0) {
								d.text("0")
							} else {
								d.text(e)
							}
						} else if (b.count === "up") {
							e = h.val().length;
							d.text(e)
						}
					} else if (b.type === "word") {
						if (b.count === c.count) {
							e = g.getWords(h.val());
							if (e <= b.goal) {
								e = b.goal - e;
								d.text(e)
							} else {
								d.text("0")
							}
						} else if (b.count === "up") {
							e = g.getWords(h.val());
							d.text(e)
						}
					}
					return
				},
				doStopTyping : function (a) {
					var d = [46, 8, 9, 35, 36, 37, 38, 39, 40, 32];
					if (g.isGoalReached(a)) {
						if (a.keyCode !== d[0] && a.keyCode !== d[1] && a.keyCode !== d[2] && a.keyCode !== d[3] && a.keyCode !== d[4] && a.keyCode !== d[5] && a.keyCode !== d[6] && a.keyCode !== d[7] && a.keyCode !== d[8]) {
							if (b.type === c.type) {
								return false
							} else if (a.keyCode !== d[9] && a.keyCode !== d[1] && b.type != c.type) {
								return true
							} else {
								return false
							}
						}
					}
				},
				isGoalReached : function (a, d) {
					if (f) {
						return false
					}
					if (b.count === c.count) {
						d = 0;
						return e <= d ? true : false
					} else {
						d = b.goal;
						return e >= d ? true : false
					}
				},
				wordStrip : function (b, c) {
					var d = c.replace(/\s+/g, " ").split(" ").length;
					c = a.trim(c);
					if (b <= 0 || b === d) {
						return c
					} else {
						c = a.trim(c).split(" ");
						c.splice(b, d, "");
						return a.trim(c.join(" "))
					}
				},
				passedGoal : function (a) {
					var c = a.val();
					if (b.type === "word") {
						a.val(g.wordStrip(b.goal, c))
					}
					if (b.type === "char") {
						a.val(c.substring(0, b.goal))
					}
					if (b.type === "down") {
						d.val("0")
					}
					if (b.type === "up") {
						d.val(b.goal)
					}
				}
			};
			return this.each(function () {
				g.init(a(this))
			})
		}
	})
})(jQuery)

//* http://mths.be/placeholder v1.8.7 by @mathias
;
(function (f, h, c) {
	var a = 'placeholder' in h.createElement('input'),
	d = 'placeholder' in h.createElement('textarea'),
	i = c.fn,
	j;
	if (a && d) {
		j = i.placeholder = function () {
			return this
		};
		j.input = j.textarea = true
	} else {
		j = i.placeholder = function () {
			return this.filter((a ? 'textarea' : ':input') + '[placeholder]').not('.placeholder').bind('focus.placeholder', b).bind('blur.placeholder', e).trigger('blur.placeholder').end()
		};
		j.input = a;
		j.textarea = d;
		c(function () {
			c(h).delegate('form', 'submit.placeholder', function () {
				var k = c('.placeholder', this).each(b);
				setTimeout(function () {
					k.each(e)
				}, 10)
			})
		});
		c(f).bind('unload.placeholder', function () {
			c('.placeholder').val('')
		})
	}
	function g(l) {
		var k = {},
		m = /^jQuery\d+$/;
		c.each(l.attributes, function (o, n) {
			if (n.specified && !m.test(n.name)) {
				k[n.name] = n.value
			}
		});
		return k
	}
	function b() {
		var k = c(this);
		if (k.val() === k.attr('placeholder') && k.hasClass('placeholder')) {
			if (k.data('placeholder-password')) {
				k.hide().next().show().focus().attr('id', k.removeAttr('id').data('placeholder-id'))
			} else {
				k.val('').removeClass('placeholder')
			}
		}
	}
	function e() {
		var o,
		n = c(this),
		k = n,
		m = this.id;
		if (n.val() === '') {
			if (n.is(':password')) {
				if (!n.data('placeholder-textinput')) {
					try {
						o = n.clone().attr({
								type : 'text'
							})
					} catch (l) {
						o = c('<input>').attr(c.extend(g(this), {
									type : 'text'
								}))
					}
					o.removeAttr('name').data('placeholder-password', true).data('placeholder-id', m).bind('focus.placeholder', b);
					n.data('placeholder-textinput', o).data('placeholder-id', m).before(o)
				}
				n = n.removeAttr('id').hide().prev().attr('id', m).show()
			}
			n.addClass('placeholder').val(n.attr('placeholder'))
		} else {
			n.removeClass('placeholder')
		}
	}
}
	(this, document, jQuery));

//* A jQuery plugin that gets the actual width of hidden DOM elements
//* Copyright 2011, Ben Lin (http://dreamerslab.com/)
//* Licensed under the MIT License (LICENSE.txt).
//* Version: 1.0.6
//* Requires: jQuery 1.2.3 ~ 1.7.1
;
(function (a) {
	a.fn.extend({
		actual : function (b, k) {
			var c,
			d,
			h,
			g,
			f,
			j,
			e,
			i;
			if (!this[b]) {
				throw '$.actual => The jQuery method "' + b + '" you called does not exist';
			}
			h = a.extend({
					absolute : false,
					clone : false,
					includeMargin : undefined
				}, k);
			d = this;
			if (h.clone === true) {
				e = function () {
					d = d.filter(":first").clone().css({
							position : "absolute",
							top : -1000
						}).appendTo("body");
				};
				i = function () {
					d.remove();
				};
			} else {
				e = function () {
					c = d.parents().andSelf().filter(":hidden");
					g = h.absolute === true ? {
						position : "absolute",
						visibility : "hidden",
						display : "block"
					}
					 : {
						visibility : "hidden",
						display : "block"
					};
					f = [];
					c.each(function () {
						var m = {},
						l;
						for (l in g) {
							m[l] = this.style[l];
							this.style[l] = g[l];
						}
						f.push(m);
					});
				};
				i = function () {
					c.each(function (m) {
						var n = f[m],
						l;
						for (l in g) {
							this.style[l] = n[l];
						}
					});
				};
			}
			e();
			j = /(outer)/g.test(b) ? d[b](h.includeMargin) : d[b]();
			i();
			return j;
		}
	});
})(jQuery);

//* jQuery serializeObject - v0.2 - 1/20/2010
//* http://benalman.com/projects/jquery-misc-plugins/
//* Copyright (c) 2010 "Cowboy" Ben Alman
//* Dual licensed under the MIT and GPL licenses.
//* http://benalman.com/about/license/
;
(function ($, a) {
	$.fn.serializeObject = function () {
		var b = {};
		$.each(this.serializeArray(), function (d, e) {
			var f = e.name,
			c = e.value;
			b[f] = b[f] === a ? c : $.isArray(b[f]) ? b[f].concat(c) : [b[f], c]
		});
		return b
	}
})(jQuery);

//* Sticky v1.0 by Daniel Raftery
//* http://thrivingkings.com/sticky
//* http://twitter.com/ThrivingKings
//* This work is licensed under the MIT License.
;
(function (a) {
	a.sticky = function (e, d, f) {
		return a.fn.sticky(e, d, f)
	};
	a.fn.sticky = function (e, d, f) {
		var b = {
			speed : "fast",
			duplicates : !1,
			autoclose : !1,
			position : "top-right"
		};
		d && a.extend(b, d);
		e || (e = this.html());
		var g = !0,
		h = "no",
		c = Math.floor(99999 * Math.random());
		a(".sticky-note").each(function () {
			a(this).html() == e && a(this).is(":visible") && (h = "yes", b.duplicates || (g = !1));
			a(this).attr("id") == c && (c = Math.floor(9999999 * Math.random()))
		});
		a("body").find(".sticky-queue." + b.position).html() || a("body").append('<div class="sticky-queue ' + b.position + '"></div>');
		g && (a(".sticky-queue." + b.position).prepend('<div class="sticky border-' + b.position + '" id="' + c + '"></div>'), a("#" + c).append('<img src="../img/blank.gif" class="sticky-close" rel="' + c + '" title="Close" />'), a("#" + c).append('<div class="sticky-note" rel="' + c + '">' + e + "</div>"), d = a("#" + c).height(), a("#" + c).css("height", d), a("#" + c).slideDown(b.speed), g = !0);
		a(".sticky").ready(function () {
			b.autoclose && a("#" + c).delay(b.autoclose).fadeOut(b.speed)
		});
		a(".sticky-close").click(function () {
			a("#" + a(this).attr("rel")).dequeue().fadeOut(b.speed)
		});
		d = {
			id : c,
			duplicate : h,
			displayed : g,
			position : b.position
		};
		if (f)
			f(d);
		else
			return d
	}
})(jQuery);

/**
 * hoverIntent r6 // 2011.02.26 // jQuery 1.5.1+
 * <http://cherne.net/brian/resources/jquery.hoverIntent.html>
 * @param  f  onMouseOver function || An object with configuration options
 * @param  g  onMouseOut function  || Nothing (use configuration options object)
 * @author    Brian Cherne brian(at)cherne(dot)net
 */
;
(function ($) {
	$.fn.hoverIntent = function (f, g) {
		var cfg = {
			sensitivity : 7,
			interval : 100,
			timeout : 0
		};
		cfg = $.extend(cfg, g ? {
				over : f,
				out : g
			}
				 : f);
		var cX,
		cY,
		pX,
		pY;
		var track = function (ev) {
			cX = ev.pageX;
			cY = ev.pageY
		};
		var compare = function (ev, ob) {
			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
			if ((Math.abs(pX - cX) + Math.abs(pY - cY)) < cfg.sensitivity) {
				$(ob).unbind("mousemove", track);
				ob.hoverIntent_s = 1;
				return cfg.over.apply(ob, [ev])
			} else {
				pX = cX;
				pY = cY;
				ob.hoverIntent_t = setTimeout(function () {
						compare(ev, ob)
					}, cfg.interval)
			}
		};
		var delay = function (ev, ob) {
			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
			ob.hoverIntent_s = 0;
			return cfg.out.apply(ob, [ev])
		};
		var handleHover = function (e) {
			var ev = jQuery.extend({}, e);
			var ob = this;
			if (ob.hoverIntent_t) {
				ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t)
			}
			if (e.type == "mouseenter") {
				pX = ev.pageX;
				pY = ev.pageY;
				$(ob).bind("mousemove", track);
				if (ob.hoverIntent_s != 1) {
					ob.hoverIntent_t = setTimeout(function () {
							compare(ev, ob)
						}, cfg.interval)
				}
			} else {
				$(ob).unbind("mousemove", track);
				if (ob.hoverIntent_s == 1) {
					ob.hoverIntent_t = setTimeout(function () {
							delay(ev, ob)
						}, cfg.timeout)
				}
			}
		};
		return this.bind('mouseenter', handleHover).bind('mouseleave', handleHover)
	}
})(jQuery);

//* smartresize: debounced resize event for jQuery
//* latest version and complete README available on Github:
//* https://github.com/louisremi/jquery.smartresize.js
//* Copyright 2011 @louis_remi
//* Licensed under the MIT license.
;
(function (a) {
	var b = a.event,
	c;
	b.special.smartresize = {
		setup : function () {
			a(this).bind("resize", b.special.smartresize.handler)
		},
		teardown : function () {
			a(this).unbind("resize", b.special.smartresize.handler)
		},
		handler : function (a, b) {
			var d = this,
			e = arguments;
			a.type = "smartresize";
			c && clearTimeout(c);
			c = setTimeout(function () {
					jQuery.event.handle.apply(d, e)
				}, "execAsap" === b ? 0 : 100)
		}
	};
	a.fn.smartresize = function (a) {
		return a ? this.bind("smartresize", a) : this.trigger("smartresize", ["execAsap"])
	}
})(jQuery);

//* UItoTop jQuery Plugin 1.1
//* http://www.mattvarone.com/web-design/uitotop-jquery-plugin/
;
(function (a) {
	a.fn.UItoTop = function (e) {
		var b = a.extend({
				text : "To Top",
				min : 200,
				inDelay : 600,
				outDelay : 400,
				containerID : "toTop",
				containerHoverID : "toTopHover",
				scrollSpeed : 500,
				easingType : "linear"
			}, e),
		c = "#" + b.containerID,
		d = "#" + b.containerHoverID;
		a("body").append('<a href="#" id="' + b.containerID + '">' + b.text + "</a>");
		a(c).hide().click(function () {
			a("html, body").animate({
				scrollTop : 0
			}, b.scrollSpeed, b.easingType);
			a("#" + b.containerHoverID, this).stop().animate({
				opacity : 0
			}, b.inDelay, b.easingType);
			return !1
		}).prepend('<span id="' + b.containerHoverID + '"></span>').hover(function () {
			a(d, this).stop().animate({
				opacity : 1
			}, 600, "linear")
		}, function () {
			a(d, this).stop().animate({
				opacity : 0
			}, 700, "linear")
		});
		a(window).scroll(function () {
			var d = a(window).scrollTop();
			"undefined" === typeof document.body.style.maxHeight && a(c).css({
				position : "absolute",
				top : a(window).scrollTop() + a(window).height() - 50
			});
			d > b.min ? a(c).fadeIn(b.inDelay) : a(c).fadeOut(b.Outdelay)
		})
	}
})(jQuery);

/*
showMessage - jQuery plugin
Simple Twitter like notification method

Examples and documentation can be found at http://showMessage.dingobytes.com/

Copyright (c) 2009 - 2012 Andrew Alba (http://albawebstudio.com)

Version: 3.0
Requires jQuery v1.7+

Dual licensed under the MIT  and GPL licenses:
http://www.opensource.org/licenses/mit-license.php
http://www.gnu.org/licenses/gpl.html

Date: Tue Apr 04 18:00:00 2010 -0500
 */
(function (a) {
	var c,
	d,
	h,
	g,
	i;
	_autoClose = function (e) {
		typeof c != "undefined" && clearTimeout(c);
		c = setTimeout(function () {
				a("#showMessage", window.parent.document).fadeOut()
			}, e)
	};
	_useEsc = function () {
		a(window).keydown(function (e) {
			if ((e === null ? event.keyCode : e.which) == 27)
				a("#showMessage", window.parent.document).fadeOut(), typeof c != "undefined" && clearTimeout(c)
		})
	};
	_navigation = function (e, b, d) {
		var f = a("<span></span>").addClass("messageNav");
		e && a(f).html(b + " ");
		d = a("<a></a>").attr({
				href : "",
				title : option.closeText
			}).css("text-decoration",
				"underline").click(function () {
				a("#showMessage", window.parent.document).fadeOut();
				clearTimeout(c);
				return !1
			}).text(d);
		a(f).append(d);
		return f
	};
	_abandon = function () {
		a(window).click(function () {
			if (a("#showMessage", window.parent.document).length)
				return a("#showMessage", window.parent.document).fadeOut(), a(window).unbind("click"), typeof c != "undefined" && clearTimeout(c), !1
		})
	};
	_show = function (e, b) {
		try {
			a("#showMessage", window.parent.document).length && a("#showMessage", window.parent.document).remove();
			d = a("<div></div>").css({
					position : b.position,
					"z-index" : b.zIndex,
					filter : "Alpha(Opacity=" + b.opacity * 100 + ")",
					opacity : b.opacity
				}).attr("id", "showMessage").addClass(b.className);
			b.location == "top" ? a(d).css("top", 0) : a(d).css("bottom", 0);
			b.useEsc ? _useEsc() : a(window).unbind("keydown");
			b.displayNavigation ? (i = _navigation(b.useEsc, b.escText, b.closeText), a(d).append(i)) : _abandon();
			g = a("<ul></ul>");
			for (var c = 0; c < b.thisMessage.length; c++) {
				var f = a("<li></li>").html(b.thisMessage[c]);
				a(g).append(f)
			}
			h = a("<div></div>").addClass("stateHolder").append(g);
			a(d).append(h);
			b.location == "top" ? a(e, window.parent.document).prepend(d) : a(e, window.parent.document).append(d);
			a(d).fadeIn();
			b.autoClose && _autoClose(b.delayTime)
		} catch (j) {
			console.log("error message:", j.message)
		}
	};
	a.fn.showMessage = function (c) {
		if (!a(this).length)
			return this;
		option = a.extend(a.fn.showMessage.defaults, c);
		_show(this, option)
	};
	a.showMessage = function (c) {
		option = a.extend(a.fn.showMessage.defaults, c);
		_show(jQuery("body", window.parent.document), option)
	};
	a.showMessage.close = function () {
		a("#showMessage", window.parent.document).length &&
		(typeof c != "undefined" && clearTimeout(showmessage_t), a("#showMessage", window.parent.document).fadeOut());
		return !1
	};
	a.showMessage.init = function () {
		a("#showMessage")
	};
	a.fn.showMessage.defaults = {
		thisMessage : [""],
		className : "notification",
		position : "fixed",
		zIndex : 1001,
		opacity : 0.9,
		location : "top",
		useEsc : !0,
		displayNavigation : !0,
		closeText : "close",
		escText : "Esc Key or",
		autoClose : !1,
		delayTime : 5E3,
		onStart : function () {},
		onCancel : function () {},
		onComplete : function () {},
		onCleanup : function () {},
		onClosed : function () {},
		onError : function () {}

	};
	a(document).ready(function () {
		a.showMessage.init()
	})
})(jQuery);

//* change events and position for ipod,iphone
var isiPhone = (navigator.userAgent.match(/iPhone/i)) || (navigator.userAgent.match(/iPod/i)) || (navigator.userAgent.match(/iPad/i)) ? true : false;
clickEvent = isiPhone ? 'touchstart' : 'click';
positionFix = isiPhone ? 'static' : 'fixed';

//* fix for console "undefined"
if (typeof console == "undefined") {
	this.console = {
		log : function () {}

	};
}

/**
 * Select/deselect any matching checkboxes, radio buttons or option elements.
 */
$.fn.selected = function (b) {
	void 0 == b && (b = !0);
	return this.each(function () {
		var a = this.type;
		"checkbox" == a || "radio" == a ? this.checked = b : "option" == this.tagName.toLowerCase() && (a = $(this).parent("select"), b && a[0] && "select-one" == a[0].type && a.find("option").selected(!1), this.selected = b)
	})
};

/*
 * jQuery Tools dev - The missing UI library for the Web
 *
 * scrollable/scrollable.js
 * scrollable/scrollable.autoscroll.js
 * scrollable/scrollable.navigator.js
 * flowtabs/flowtabs.js
 * flowtabs/flowtabs.slideshow.js
 *
 * NO COPYRIGHTS OR LICENSES. DO WHAT YOU LIKE.
 * http://flowplayer.org/tools/
 *
 */
(function (a) {
	a.tools = a.tools || {
		version : "dev"
	},
	a.tools.scrollable = {
		conf : {
			activeClass : "active",
			circular : !1,
			clonedClass : "cloned",
			disabledClass : "disabled",
			easing : "swing",
			initialIndex : 0,
			item : "> *",
			items : ".items",
			keyboard : !0,
			mousewheel : !1,
			next : ".next",
			prev : ".prev",
			size : 1,
			speed : 400,
			vertical : !1,
			touch : !0,
			wheelSpeed : 0
		}
	};
	function b(a, b) {
		var c = parseInt(a.css(b), 10);
		if (c)
			return c;
		var d = a[0].currentStyle;
		return d && d.width && parseInt(d.width, 10)
	}
	function c(b, c) {
		var d = a(c);
		return d.length < 2 ? d : b.parent().find(c)
	}
	var d;
	function e(b, e) {
		var f = this,
		g = b.add(f),
		h = b.children(),
		i = 0,
		j = e.vertical;
		d || (d = f),
		h.length > 1 && (h = a(e.items, b)),
		e.size > 1 && (e.circular = !1),
		a.extend(f, {
			getConf : function () {
				return e
			},
			getIndex : function () {
				return i
			},
			getSize : function () {
				return f.getItems().size()
			},
			getNaviButtons : function () {
				return n.add(o)
			},
			getRoot : function () {
				return b
			},
			getItemWrap : function () {
				return h
			},
			getItems : function () {
				return h.find(e.item).not("." + e.clonedClass)
			},
			move : function (a, b) {
				return f.seekTo(i + a, b)
			},
			next : function (a) {
				return f.move(e.size, a)
			},
			prev : function (a) {
				return f.move(-e.size, a)
			},
			begin : function (a) {
				return f.seekTo(0, a)
			},
			end : function (a) {
				return f.seekTo(f.getSize() - 1, a)
			},
			focus : function () {
				d = f;
				return f
			},
			addItem : function (b) {
				b = a(b),
				e.circular ? (h.children().last().before(b), h.children().first().replaceWith(b.clone().addClass(e.clonedClass))) : (h.append(b), o.removeClass("disabled")),
				g.trigger("onAddItem", [b]);
				return f
			},
			seekTo : function (b, c, k) {
				b.jquery || (b *= 1);
				if (e.circular && b === 0 && i == -1 && c !== 0)
					return f;
				if (!e.circular && b < 0 || b > f.getSize() || b < -1)
					return f;
				var l = b;
				b.jquery ? b = f.getItems().index(b) : l = f.getItems().eq(b);
				var m = a.Event("onBeforeSeek");
				if (!k) {
					g.trigger(m, [b, c]);
					if (m.isDefaultPrevented() || !l.length)
						return f
				}
				var n = j ? {
					top : -l.position().top
				}
				 : {
					left : -l.position().left
				};
				i = b,
				d = f,
				c === undefined && (c = e.speed),
				h.animate(n, c, e.easing, k || function () {
					g.trigger("onSeek", [b])
				});
				return f
			}
		}),
		a.each(["onBeforeSeek", "onSeek", "onAddItem"], function (b, c) {
			a.isFunction(e[c]) && a(f).bind(c, e[c]),
			f[c] = function (b) {
				b && a(f).bind(c, b);
				return f
			}
		});
		if (e.circular) {
			var k = f.getItems().slice(-1).clone().prependTo(h),
			l = f.getItems().eq(1).clone().appendTo(h);
			k.add(l).addClass(e.clonedClass),
			f.onBeforeSeek(function (a, b, c) {
				if (!a.isDefaultPrevented()) {
					if (b == -1) {
						f.seekTo(k, c, function () {
							f.end(0)
						});
						return a.preventDefault()
					}
					b == f.getSize() && f.seekTo(l, c, function () {
						f.begin(0)
					})
				}
			});
			var m = b.parents().add(b).filter(function () {
					if (a(this).css("display") === "none")
						return !0
				});
			m.length ? (m.show(), f.seekTo(0, 0, function () {}), m.hide()) : f.seekTo(0, 0, function () {})
		}
		var n = c(b, e.prev).click(function (a) {
				a.stopPropagation(),
				f.prev()
			}),
		o = c(b, e.next).click(function (a) {
				a.stopPropagation(),
				f.next()
			});
		e.circular || (f.onBeforeSeek(function (a, b) {
				setTimeout(function () {
					a.isDefaultPrevented() || (n.toggleClass(e.disabledClass, b <= 0), o.toggleClass(e.disabledClass, b >= f.getSize() - 1))
				}, 1)
			}), e.initialIndex || n.addClass(e.disabledClass)),
		f.getSize() < 2 && n.add(o).addClass(e.disabledClass),
		e.mousewheel && a.fn.mousewheel && b.mousewheel(function (a, b) {
			if (e.mousewheel) {
				f.move(b < 0 ? 1 : -1, e.wheelSpeed || 50);
				return !1
			}
		});
		if (e.touch) {
			var p = {};
			h[0].ontouchstart = function (a) {
				var b = a.touches[0];
				p.x = b.clientX,
				p.y = b.clientY
			},
			h[0].ontouchmove = function (a) {
				if (a.touches.length == 1 && !h.is(":animated")) {
					var b = a.touches[0],
					c = p.x - b.clientX,
					d = p.y - b.clientY;
					f[j && d > 0 || !j && c > 0 ? "next" : "prev"](),
					a.preventDefault()
				}
			}
		}
		e.keyboard && a(document).bind("keydown.scrollable", function (b) {
			if (!(!e.keyboard || b.altKey || b.ctrlKey || b.metaKey || a(b.target).is(":input"))) {
				if (e.keyboard != "static" && d != f)
					return;
				var c = b.keyCode;
				if (j && (c == 38 || c == 40)) {
					f.move(c == 38 ? -1 : 1);
					return b.preventDefault()
				}
				if (!j && (c == 37 || c == 39)) {
					f.move(c == 37 ? -1 : 1);
					return b.preventDefault()
				}
			}
		}),
		e.initialIndex && f.seekTo(e.initialIndex, 0, function () {})
	}
	a.fn.scrollable = function (b) {
		var c = this.data("scrollable");
		if (c)
			return c;
		b = a.extend({}, a.tools.scrollable.conf, b),
		this.each(function () {
			c = new e(a(this), b),
			a(this).data("scrollable", c)
		});
		return b.api ? c : this
	}
})(jQuery);
(function (a) {
	var b = a.tools.scrollable;
	b.autoscroll = {
		conf : {
			autoplay : !0,
			interval : 3e3,
			autopause : !0
		}
	},
	a.fn.autoscroll = function (c) {
		typeof c == "number" && (c = {
				interval : c
			});
		var d = a.extend({}, b.autoscroll.conf, c),
		e;
		this.each(function () {
			var b = a(this).data("scrollable"),
			c = b.getRoot(),
			f,
			g = !1;
			function h() {
				f = setTimeout(function () {
						b.next()
					}, d.interval)
			}
			b && (e = b),
			b.play = function () {
				f || (g = !1, c.bind("onSeek", h), h())
			},
			b.pause = function () {
				f = clearTimeout(f),
				c.unbind("onSeek", h)
			},
			b.resume = function () {
				g || b.play()
			},
			b.stop = function () {
				g = !0,
				b.pause()
			},
			d.autopause && c.add(b.getNaviButtons()).hover(b.pause, b.resume),
			d.autoplay && b.play()
		});
		return d.api ? e : this
	}
})(jQuery);
(function (a) {
	var b = a.tools.scrollable;
	b.navigator = {
		conf : {
			navi : ".navi",
			naviItem : null,
			activeClass : "active",
			indexed : !1,
			idPrefix : null,
			history : !1
		}
	};
	function c(b, c) {
		var d = a(c);
		return d.length < 2 ? d : b.parent().find(c)
	}
	a.fn.navigator = function (d) {
		typeof d == "string" && (d = {
				navi : d
			}),
		d = a.extend({}, b.navigator.conf, d);
		var e;
		this.each(function () {
			var b = a(this).data("scrollable"),
			f = d.navi.jquery ? d.navi : c(b.getRoot(), d.navi),
			g = b.getNaviButtons(),
			h = d.activeClass,
			i = d.history && history.pushState,
			j = b.getConf().size;
			b && (e = b),
			b.getNaviButtons = function () {
				return g.add(f)
			},
			i && (history.pushState({
					i : 0
				}), a(window).bind("popstate", function (a) {
					var c = a.originalEvent.state;
					c && b.seekTo(c.i)
				}));
			function k(a, c, d) {
				b.seekTo(c),
				d.preventDefault(),
				i && history.pushState({
					i : c
				})
			}
			function l() {
				return f.find(d.naviItem || "> *")
			}
			function m(b) {
				var c = a("<" + (d.naviItem || "a") + "/>").click(function (c) {
						k(a(this), b, c)
					});
				b === 0 && c.addClass(h),
				d.indexed && c.text(b + 1),
				d.idPrefix && c.attr("id", d.idPrefix + b);
				return c.appendTo(f)
			}
			l().length ? l().each(function (b) {
				a(this).click(function (c) {
					k(a(this), b, c)
				})
			}) : a.each(b.getItems(), function (a) {
				a % j == 0 && m(a)
			}),
			b.onBeforeSeek(function (a, b) {
				setTimeout(function () {
					if (!a.isDefaultPrevented()) {
						var c = b / j,
						d = l().eq(c);
						d.length && l().removeClass(h).eq(c).addClass(h)
					}
				}, 1)
			}),
			b.onAddItem(function (a, c) {
				var d = b.getItems().index(c);
				d % j == 0 && m(d)
			})
		});
		return d.api ? e : this
	}
})(jQuery);
(function (a) {
	a.tools = a.tools || {
		version : "dev"
	},
	a.tools.flowtabs = {
		conf : {
			flowtabs : "a",
			current : "current",
			onBeforeClick : null,
			onClick : null,
			effect : "default",
			initialIndex : 0,
			event : "click",
			rotate : !1,
			slideUpSpeed : 400,
			slideDownSpeed : 400,
			history : !1
		},
		addEffect : function (a, c) {
			b[a] = c
		}
	};
	var b = {
		"default" : function (a, b) {
			this.getPanes().hide().eq(a).show(),
			b.call()
		},
		fade : function (a, b) {
			var c = this.getConf(),
			d = c.fadeOutSpeed,
			e = this.getPanes();
			d ? e.fadeOut(d) : e.hide(),
			e.eq(a).fadeIn(c.fadeInSpeed, b)
		},
		slide : function (a, b) {
			var c = this.getConf();
			this.getPanes().slideUp(c.slideUpSpeed),
			this.getPanes().eq(a).slideDown(c.slideDownSpeed, b)
		},
		ajax : function (a, b) {
			this.getPanes().eq(0).load(this.getflowtabs().eq(a).attr("href"), b)
		}
	},
	c,
	d;
	a.tools.flowtabs.addEffect("horizontal", function (b, e) {
		if (!c) {
			var f = this.getPanes().eq(b),
			g = this.getCurrentPane();
			d || (d = this.getPanes().eq(0).width()),
			c = !0,
			f.show(),
			g.animate({
				width : 0
			}, {
				step : function (a) {
					f.css("width", d - a)
				},
				complete : function () {
					a(this).hide(),
					e.call(),
					c = !1
				}
			}),
			g.length || (e.call(), c = !1)
		}
	});
	function e(c, d, e) {
		var f = this,
		g = c.add(this),
		h = c.find(e.flowtabs),
		i = d.jquery ? d : c.children(d),
		j;
		h.length || (h = c.children()),
		i.length || (i = c.parent().find(d)),
		i.length || (i = a(d)),
		a.extend(this, {
			click : function (c, d) {
				var i = h.eq(c);
				typeof c == "string" && c.replace("#", "") && (i = h.filter("[href*=" + c.replace("#", "") + "]"), c = Math.max(h.index(i), 0));
				if (e.rotate) {
					var k = h.length - 1;
					if (c < 0)
						return f.click(k, d);
					if (c > k)
						return f.click(0, d)
				}
				if (!i.length) {
					if (j >= 0)
						return f;
					c = e.initialIndex,
					i = h.eq(c)
				}
				if (c === j)
					return f;
				d = d || a.Event(),
				d.type = "onBeforeClick",
				g.trigger(d, [c]);
				if (!d.isDefaultPrevented()) {
					b[e.effect].call(f, c, function () {
						j = c,
						d.type = "onClick",
						g.trigger(d, [c])
					}),
					h.removeClass(e.current),
					i.addClass(e.current);
					return f
				}
			},
			getConf : function () {
				return e
			},
			getflowtabs : function () {
				return h
			},
			getPanes : function () {
				return i
			},
			getCurrentPane : function () {
				return i.eq(j)
			},
			getCurrentTab : function () {
				return h.eq(j)
			},
			getIndex : function () {
				return j
			},
			next : function () {
				return f.click(j + 1)
			},
			prev : function () {
				return f.click(j - 1)
			},
			destroy : function () {
				h.unbind(e.event).removeClass(e.current),
				i.find("a[href^=#]").unbind("click.T");
				return f
			}
		}),
		a.each("onBeforeClick,onClick".split(","), function (b, c) {
			a.isFunction(e[c]) && a(f).bind(c, e[c]),
			f[c] = function (b) {
				b && a(f).bind(c, b);
				return f
			}
		}),
		e.history && a.fn.history && (a.tools.history.init(h), e.event = "history"),
		h.each(function (b) {
			a(this).bind(e.event, function (a) {
				f.click(b, a);
				return a.preventDefault()
			})
		}),
		i.find("a[href^=#]").bind("click.T", function (b) {
			f.click(a(this).attr("href"), b)
		}),
		location.hash && e.flowtabs == "a" && c.find("[href=" + location.hash + "]").length ? f.click(location.hash) : (e.initialIndex === 0 || e.initialIndex > 0) && f.click(e.initialIndex)
	}
	a.fn.flowtabs = function (b, c) {
		var d = this.data("flowtabs");
		d && (d.destroy(), this.removeData("flowtabs")),
		a.isFunction(c) && (c = {
				onBeforeClick : c
			}),
		c = a.extend({}, a.tools.flowtabs.conf, c),
		this.each(function () {
			d = new e(a(this), b, c),
			a(this).data("flowtabs", d)
		});
		return c.api ? d : this
	}
})(jQuery);
(function (a) {
	var b;
	b = a.tools.flowtabs.slideshow = {
		conf : {
			next : ".forward",
			prev : ".backward",
			disabledClass : "disabled",
			autoplay : !1,
			autopause : !0,
			interval : 3e3,
			clickable : !0,
			api : !1
		}
	};
	function c(b, c) {
		var d = this,
		e = b.add(this),
		f = b.data("flowtabs"),
		g,
		h = !0;
		function i(c) {
			var d = a(c);
			return d.length < 2 ? d : b.parent().find(c)
		}
		var j = i(c.next).click(function () {
				f.next()
			}),
		k = i(c.prev).click(function () {
				f.prev()
			});
		function l() {
			g = setTimeout(function () {
					f.next()
				}, c.interval)
		}
		a.extend(d, {
			getflowtabs : function () {
				return f
			},
			getConf : function () {
				return c
			},
			play : function () {
				if (g)
					return d;
				var b = a.Event("onBeforePlay");
				e.trigger(b);
				if (b.isDefaultPrevented())
					return d;
				h = !1,
				e.trigger("onPlay"),
				e.bind("onClick", l),
				l();
				return d
			},
			pause : function () {
				if (!g)
					return d;
				var b = a.Event("onBeforePause");
				e.trigger(b);
				if (b.isDefaultPrevented())
					return d;
				g = clearTimeout(g),
				e.trigger("onPause"),
				e.unbind("onClick", l);
				return d
			},
			resume : function () {
				h || d.play()
			},
			stop : function () {
				d.pause(),
				h = !0
			}
		}),
		a.each("onBeforePlay,onPlay,onBeforePause,onPause".split(","), function (b, e) {
			a.isFunction(c[e]) && a(d).bind(e, c[e]),
			d[e] = function (b) {
				return a(d).bind(e, b)
			}
		}),
		c.autopause && f.getflowtabs().add(j).add(k).add(f.getPanes()).hover(d.pause, d.resume),
		c.autoplay && d.play(),
		c.clickable && f.getPanes().click(function () {
			f.next()
		});
		if (!f.getConf().rotate) {
			var m = c.disabledClass;
			f.getIndex() || k.addClass(m),
			f.onBeforeClick(function (a, b) {
				k.toggleClass(m, !b),
				j.toggleClass(m, b == f.getflowtabs().length - 1)
			})
		}
	}
	a.fn.slideshow = function (d) {
		var e = this.data("slideshow");
		if (e)
			return e;
		d = a.extend({}, b.conf, d),
		this.each(function () {
			e = new c(a(this), d),
			a(this).data("slideshow", e)
		});
		return d.api ? e : this
	}
})(jQuery);

/*
 * jQuery Easing v1.3 - http://gsgd.co.uk/sandbox/jquery/easing/
 * Uses the built in easing capabilities added In jQuery 1.1
 * to offer multiple easing options
 * TERMS OF USE - jQuery Easing
 * Open source under the BSD License.
 */
eval(function (p, a, c, k, e, r) {
	e = function (c) {
		return (c < a ? '' : e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36))
	};
	if (!''.replace(/^/, String)) {
		while (c--)
			r[e(c)] = k[c] || e(c);
		k = [function (e) {
				return r[e]
			}
		];
		e = function () {
			return '\\w+'
		};
		c = 1
	};
	while (c--)
		if (k[c])
			p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]);
	return p
}
	('h.i[\'1a\']=h.i[\'z\'];h.O(h.i,{y:\'D\',z:9(x,t,b,c,d){6 h.i[h.i.y](x,t,b,c,d)},17:9(x,t,b,c,d){6 c*(t/=d)*t+b},D:9(x,t,b,c,d){6-c*(t/=d)*(t-2)+b},13:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t+b;6-c/2*((--t)*(t-2)-1)+b},X:9(x,t,b,c,d){6 c*(t/=d)*t*t+b},U:9(x,t,b,c,d){6 c*((t=t/d-1)*t*t+1)+b},R:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t*t+b;6 c/2*((t-=2)*t*t+2)+b},N:9(x,t,b,c,d){6 c*(t/=d)*t*t*t+b},M:9(x,t,b,c,d){6-c*((t=t/d-1)*t*t*t-1)+b},L:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t*t*t+b;6-c/2*((t-=2)*t*t*t-2)+b},K:9(x,t,b,c,d){6 c*(t/=d)*t*t*t*t+b},J:9(x,t,b,c,d){6 c*((t=t/d-1)*t*t*t*t+1)+b},I:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t*t*t*t+b;6 c/2*((t-=2)*t*t*t*t+2)+b},G:9(x,t,b,c,d){6-c*8.C(t/d*(8.g/2))+c+b},15:9(x,t,b,c,d){6 c*8.n(t/d*(8.g/2))+b},12:9(x,t,b,c,d){6-c/2*(8.C(8.g*t/d)-1)+b},Z:9(x,t,b,c,d){6(t==0)?b:c*8.j(2,10*(t/d-1))+b},Y:9(x,t,b,c,d){6(t==d)?b+c:c*(-8.j(2,-10*t/d)+1)+b},W:9(x,t,b,c,d){e(t==0)6 b;e(t==d)6 b+c;e((t/=d/2)<1)6 c/2*8.j(2,10*(t-1))+b;6 c/2*(-8.j(2,-10*--t)+2)+b},V:9(x,t,b,c,d){6-c*(8.o(1-(t/=d)*t)-1)+b},S:9(x,t,b,c,d){6 c*8.o(1-(t=t/d-1)*t)+b},Q:9(x,t,b,c,d){e((t/=d/2)<1)6-c/2*(8.o(1-t*t)-1)+b;6 c/2*(8.o(1-(t-=2)*t)+1)+b},P:9(x,t,b,c,d){f s=1.l;f p=0;f a=c;e(t==0)6 b;e((t/=d)==1)6 b+c;e(!p)p=d*.3;e(a<8.w(c)){a=c;f s=p/4}m f s=p/(2*8.g)*8.r(c/a);6-(a*8.j(2,10*(t-=1))*8.n((t*d-s)*(2*8.g)/p))+b},H:9(x,t,b,c,d){f s=1.l;f p=0;f a=c;e(t==0)6 b;e((t/=d)==1)6 b+c;e(!p)p=d*.3;e(a<8.w(c)){a=c;f s=p/4}m f s=p/(2*8.g)*8.r(c/a);6 a*8.j(2,-10*t)*8.n((t*d-s)*(2*8.g)/p)+c+b},T:9(x,t,b,c,d){f s=1.l;f p=0;f a=c;e(t==0)6 b;e((t/=d/2)==2)6 b+c;e(!p)p=d*(.3*1.5);e(a<8.w(c)){a=c;f s=p/4}m f s=p/(2*8.g)*8.r(c/a);e(t<1)6-.5*(a*8.j(2,10*(t-=1))*8.n((t*d-s)*(2*8.g)/p))+b;6 a*8.j(2,-10*(t-=1))*8.n((t*d-s)*(2*8.g)/p)*.5+c+b},F:9(x,t,b,c,d,s){e(s==u)s=1.l;6 c*(t/=d)*t*((s+1)*t-s)+b},E:9(x,t,b,c,d,s){e(s==u)s=1.l;6 c*((t=t/d-1)*t*((s+1)*t+s)+1)+b},16:9(x,t,b,c,d,s){e(s==u)s=1.l;e((t/=d/2)<1)6 c/2*(t*t*(((s*=(1.B))+1)*t-s))+b;6 c/2*((t-=2)*t*(((s*=(1.B))+1)*t+s)+2)+b},A:9(x,t,b,c,d){6 c-h.i.v(x,d-t,0,c,d)+b},v:9(x,t,b,c,d){e((t/=d)<(1/2.k)){6 c*(7.q*t*t)+b}m e(t<(2/2.k)){6 c*(7.q*(t-=(1.5/2.k))*t+.k)+b}m e(t<(2.5/2.k)){6 c*(7.q*(t-=(2.14/2.k))*t+.11)+b}m{6 c*(7.q*(t-=(2.18/2.k))*t+.19)+b}},1b:9(x,t,b,c,d){e(t<d/2)6 h.i.A(x,t*2,0,c,d)*.5+b;6 h.i.v(x,t*2-d,0,c,d)*.5+c*.5+b}});', 62, 74, '||||||return||Math|function|||||if|var|PI|jQuery|easing|pow|75|70158|else|sin|sqrt||5625|asin|||undefined|easeOutBounce|abs||def|swing|easeInBounce|525|cos|easeOutQuad|easeOutBack|easeInBack|easeInSine|easeOutElastic|easeInOutQuint|easeOutQuint|easeInQuint|easeInOutQuart|easeOutQuart|easeInQuart|extend|easeInElastic|easeInOutCirc|easeInOutCubic|easeOutCirc|easeInOutElastic|easeOutCubic|easeInCirc|easeInOutExpo|easeInCubic|easeOutExpo|easeInExpo||9375|easeInOutSine|easeInOutQuad|25|easeOutSine|easeInOutBack|easeInQuad|625|984375|jswing|easeInOutBounce'.split('|'), 0, {}))

/*
 * FancyBox - jQuery Plugin
 * Simple and fancy lightbox alternative
 *
 * Examples and documentation at: http://fancybox.net
 *
 * Copyright (c) 2008 - 2010 Janis Skarnelis
 * That said, it is hardly a one-person project. Many people have submitted bugs, code, and offered their advice freely. Their support is greatly appreciated.
 *
 * Version: 1.3.4 (11/11/2010)
 * Requires: jQuery v1.3+
 *
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 */
;
(function (b) {
	var m,
	t,
	u,
	f,
	D,
	j,
	E,
	n,
	z,
	A,
	q = 0,
	e = {},
	o = [],
	p = 0,
	d = {},
	l = [],
	G = null,
	v = new Image,
	J = /\.(jpg|gif|png|bmp|jpeg)(.*)?$/i,
	W = /[^\.]\.(swf)\s*$/i,
	K,
	L = 1,
	y = 0,
	s = "",
	r,
	i,
	h = false,
	B = b.extend(b("<div/>")[0], {
			prop : 0
		}),
	M = b.browser.msie && b.browser.version < 7 && !window.XMLHttpRequest,
	N = function () {
		t.hide();
		v.onerror = v.onload = null;
		G && G.abort();
		m.empty()
	},
	O = function () {
		if (false === e.onError(o, q, e)) {
			t.hide();
			h = false
		} else {
			e.titleShow = false;
			e.width = "auto";
			e.height = "auto";
			m.html('<p id="fancybox-error">The requested content cannot be loaded.<br />Please try again later.</p>');
			F()
		}
	},
	I = function () {
		var a = o[q],
		c,
		g,
		k,
		C,
		P,
		w;
		N();
		e = b.extend({}, b.fn.fancybox.defaults, typeof b(a).data("fancybox") == "undefined" ? e : b(a).data("fancybox"));
		w = e.onStart(o, q, e);
		if (w === false)
			h = false;
		else {
			if (typeof w == "object")
				e = b.extend(e, w);
			k = e.title || (a.nodeName ? b(a).attr("title") : a.title) || "";
			if (a.nodeName && !e.orig)
				e.orig = b(a).children("img:first").length ? b(a).children("img:first") : b(a);
			if (k === "" && e.orig && e.titleFromAlt)
				k = e.orig.attr("alt");
			c = e.href || (a.nodeName ? b(a).attr("href") : a.href) || null;
			if (/^(?:javascript)/i.test(c) ||
				c == "#")
				c = null;
			if (e.type) {
				g = e.type;
				if (!c)
					c = e.content
			} else if (e.content)
				g = "html";
			else if (c)
				g = c.match(J) ? "image" : c.match(W) ? "swf" : b(a).hasClass("iframe") ? "iframe" : c.indexOf("#") === 0 ? "inline" : "ajax";
			if (g) {
				if (g == "inline") {
					a = c.substr(c.indexOf("#"));
					g = b(a).length > 0 ? "inline" : "ajax"
				}
				e.type = g;
				e.href = c;
				e.title = k;
				if (e.autoDimensions)
					if (e.type == "html" || e.type == "inline" || e.type == "ajax") {
						e.width = "auto";
						e.height = "auto"
					} else
						e.autoDimensions = false;
				if (e.modal) {
					e.overlayShow = true;
					e.hideOnOverlayClick = false;
					e.hideOnContentClick =
						false;
					e.enableEscapeButton = false;
					e.showCloseButton = false
				}
				e.padding = parseInt(e.padding, 10);
				e.margin = parseInt(e.margin, 10);
				m.css("padding", e.padding + e.margin);
				b(".fancybox-inline-tmp").unbind("fancybox-cancel").bind("fancybox-change", function () {
					b(this).replaceWith(j.children())
				});
				switch (g) {
				case "html":
					m.html(e.content);
					F();
					break;
				case "inline":
					if (b(a).parent().is("#fancybox-content") === true) {
						h = false;
						break
					}
					b('<div class="fancybox-inline-tmp" />').hide().insertBefore(b(a)).bind("fancybox-cleanup", function () {
						b(this).replaceWith(j.children())
					}).bind("fancybox-cancel",
						function () {
						b(this).replaceWith(m.children())
					});
					b(a).appendTo(m);
					F();
					break;
				case "image":
					h = false;
					b.fancybox.showActivity();
					v = new Image;
					v.onerror = function () {
						O()
					};
					v.onload = function () {
						h = true;
						v.onerror = v.onload = null;
						e.width = v.width;
						e.height = v.height;
						b("<img />").attr({
							id : "fancybox-img",
							src : v.src,
							alt : e.title
						}).appendTo(m);
						Q()
					};
					v.src = c;
					break;
				case "swf":
					e.scrolling = "no";
					C = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="' + e.width + '" height="' + e.height + '"><param name="movie" value="' + c +
						'"></param>';
					P = "";
					b.each(e.swf, function (x, H) {
						C += '<param name="' + x + '" value="' + H + '"></param>';
						P += " " + x + '="' + H + '"'
					});
					C += '<embed src="' + c + '" type="application/x-shockwave-flash" width="' + e.width + '" height="' + e.height + '"' + P + "></embed></object>";
					m.html(C);
					F();
					break;
				case "ajax":
					h = false;
					b.fancybox.showActivity();
					e.ajax.win = e.ajax.success;
					G = b.ajax(b.extend({}, e.ajax, {
								url : c,
								data : e.ajax.data || {},
								error : function (x) {
									x.status > 0 && O()
								},
								success : function (x, H, R) {
									if ((typeof R == "object" ? R : G).status == 200) {
										if (typeof e.ajax.win ==
											"function") {
											w = e.ajax.win(c, x, H, R);
											if (w === false) {
												t.hide();
												return
											} else if (typeof w == "string" || typeof w == "object")
												x = w
										}
										m.html(x);
										F()
									}
								}
							}));
					break;
				case "iframe":
					Q()
				}
			} else
				O()
		}
	},
	F = function () {
		var a = e.width,
		c = e.height;
		a = a.toString().indexOf("%") > -1 ? parseInt((b(window).width() - e.margin * 2) * parseFloat(a) / 100, 10) + "px" : a == "auto" ? "auto" : a + "px";
		c = c.toString().indexOf("%") > -1 ? parseInt((b(window).height() - e.margin * 2) * parseFloat(c) / 100, 10) + "px" : c == "auto" ? "auto" : c + "px";
		m.wrapInner('<div style="width:' + a + ";height:" + c +
			";overflow: " + (e.scrolling == "auto" ? "auto" : e.scrolling == "yes" ? "scroll" : "hidden") + ';position:relative;"></div>');
		e.width = m.width();
		e.height = m.height();
		Q()
	},
	Q = function () {
		var a,
		c;
		t.hide();
		if (f.is(":visible") && false === d.onCleanup(l, p, d)) {
			b.event.trigger("fancybox-cancel");
			h = false
		} else {
			h = true;
			b(j.add(u)).unbind();
			b(window).unbind("resize.fb scroll.fb");
			b(document).unbind("keydown.fb");
			f.is(":visible") && d.titlePosition !== "outside" && f.css("height", f.height());
			l = o;
			p = q;
			d = e;
			if (d.overlayShow) {
				u.css({
					"background-color" : d.overlayColor,
					opacity : d.overlayOpacity,
					cursor : d.hideOnOverlayClick ? "pointer" : "auto",
					height : b(document).height()
				});
				if (!u.is(":visible")) {
					M && b("select:not(#fancybox-tmp select)").filter(function () {
						return this.style.visibility !== "hidden"
					}).css({
						visibility : "hidden"
					}).one("fancybox-cleanup", function () {
						this.style.visibility = "inherit"
					});
					u.show()
				}
			} else
				u.hide();
			i = X();
			s = d.title || "";
			y = 0;
			n.empty().removeAttr("style").removeClass();
			if (d.titleShow !== false) {
				if (b.isFunction(d.titleFormat))
					a = d.titleFormat(s, l, p, d);
				else
					a = s && s.length ?
						d.titlePosition == "float" ? '<table id="fancybox-title-float-wrap" cellpadding="0" cellspacing="0"><tr><td id="fancybox-title-float-left"></td><td id="fancybox-title-float-main">' + s + '</td><td id="fancybox-title-float-right"></td></tr></table>' : '<div id="fancybox-title-' + d.titlePosition + '">' + s + "</div>" : false;
				s = a;
				if (!(!s || s === "")) {
					n.addClass("fancybox-title-" + d.titlePosition).html(s).appendTo("body").show();
					switch (d.titlePosition) {
					case "inside":
						n.css({
							width : i.width - d.padding * 2,
							marginLeft : d.padding,
							marginRight : d.padding
						});
						y = n.outerHeight(true);
						n.appendTo(D);
						i.height += y;
						break;
					case "over":
						n.css({
							marginLeft : d.padding,
							width : i.width - d.padding * 2,
							bottom : d.padding
						}).appendTo(D);
						break;
					case "float":
						n.css("left", parseInt((n.width() - i.width - 40) / 2, 10) * -1).appendTo(f);
						break;
					default:
						n.css({
							width : i.width - d.padding * 2,
							paddingLeft : d.padding,
							paddingRight : d.padding
						}).appendTo(f)
					}
				}
			}
			n.hide();
			if (f.is(":visible")) {
				b(E.add(z).add(A)).hide();
				a = f.position();
				r = {
					top : a.top,
					left : a.left,
					width : f.width(),
					height : f.height()
				};
				c = r.width == i.width && r.height ==
					i.height;
				j.fadeTo(d.changeFade, 0.3, function () {
					var g = function () {
						j.html(m.contents()).fadeTo(d.changeFade, 1, S)
					};
					b.event.trigger("fancybox-change");
					j.empty().removeAttr("filter").css({
						"border-width" : d.padding,
						width : i.width - d.padding * 2,
						height : e.autoDimensions ? "auto" : i.height - y - d.padding * 2
					});
					if (c)
						g();
					else {
						B.prop = 0;
						b(B).animate({
							prop : 1
						}, {
							duration : d.changeSpeed,
							easing : d.easingChange,
							step : T,
							complete : g
						})
					}
				})
			} else {
				f.removeAttr("style");
				j.css("border-width", d.padding);
				if (d.transitionIn == "elastic") {
					r = V();
					j.html(m.contents());
					f.show();
					if (d.opacity)
						i.opacity = 0;
					B.prop = 0;
					b(B).animate({
						prop : 1
					}, {
						duration : d.speedIn,
						easing : d.easingIn,
						step : T,
						complete : S
					})
				} else {
					d.titlePosition == "inside" && y > 0 && n.show();
					j.css({
						width : i.width - d.padding * 2,
						height : e.autoDimensions ? "auto" : i.height - y - d.padding * 2
					}).html(m.contents());
					f.css(i).fadeIn(d.transitionIn == "none" ? 0 : d.speedIn, S)
				}
			}
		}
	},
	Y = function () {
		if (d.enableEscapeButton || d.enableKeyboardNav)
			b(document).bind("keydown.fb", function (a) {
				if (a.keyCode == 27 && d.enableEscapeButton) {
					a.preventDefault();
					b.fancybox.close()
				} else if ((a.keyCode ==
						37 || a.keyCode == 39) && d.enableKeyboardNav && a.target.tagName !== "INPUT" && a.target.tagName !== "TEXTAREA" && a.target.tagName !== "SELECT") {
					a.preventDefault();
					b.fancybox[a.keyCode == 37 ? "prev" : "next"]()
				}
			});
		if (d.showNavArrows) {
			if (d.cyclic && l.length > 1 || p !== 0)
				z.show();
			if (d.cyclic && l.length > 1 || p != l.length - 1)
				A.show()
		} else {
			z.hide();
			A.hide()
		}
	},
	S = function () {
		if (!b.support.opacity) {
			j.get(0).style.removeAttribute("filter");
			f.get(0).style.removeAttribute("filter")
		}
		e.autoDimensions && j.css("height", "auto");
		f.css("height", "auto");
		s && s.length && n.show();
		d.showCloseButton && E.show();
		Y();
		d.hideOnContentClick && j.bind("click", b.fancybox.close);
		d.hideOnOverlayClick && u.bind("click", b.fancybox.close);
		b(window).bind("resize.fb", b.fancybox.resize);
		d.centerOnScroll && b(window).bind("scroll.fb", b.fancybox.center);
		if (d.type == "iframe")
			b('<iframe id="fancybox-frame" name="fancybox-frame' + (new Date).getTime() + '" frameborder="0" hspace="0" ' + (b.browser.msie ? 'allowtransparency="true""' : "") + ' scrolling="' + e.scrolling + '" src="' + d.href + '"></iframe>').appendTo(j);
		f.show();
		h = false;
		b.fancybox.center();
		d.onComplete(l, p, d);
		var a,
		c;
		if (l.length - 1 > p) {
			a = l[p + 1].href;
			if (typeof a !== "undefined" && a.match(J)) {
				c = new Image;
				c.src = a
			}
		}
		if (p > 0) {
			a = l[p - 1].href;
			if (typeof a !== "undefined" && a.match(J)) {
				c = new Image;
				c.src = a
			}
		}
	},
	T = function (a) {
		var c = {
			width : parseInt(r.width + (i.width - r.width) * a, 10),
			height : parseInt(r.height + (i.height - r.height) * a, 10),
			top : parseInt(r.top + (i.top - r.top) * a, 10),
			left : parseInt(r.left + (i.left - r.left) * a, 10)
		};
		if (typeof i.opacity !== "undefined")
			c.opacity = a < 0.5 ? 0.5 : a;
		f.css(c);
		j.css({
			width : c.width - d.padding * 2,
			height : c.height - y * a - d.padding * 2
		})
	},
	U = function () {
		return [b(window).width() - d.margin * 2, b(window).height() - d.margin * 2, b(document).scrollLeft() + d.margin, b(document).scrollTop() + d.margin]
	},
	X = function () {
		var a = U(),
		c = {},
		g = d.autoScale,
		k = d.padding * 2;
		c.width = d.width.toString().indexOf("%") > -1 ? parseInt(a[0] * parseFloat(d.width) / 100, 10) : d.width + k;
		c.height = d.height.toString().indexOf("%") > -1 ? parseInt(a[1] * parseFloat(d.height) / 100, 10) : d.height + k;
		if (g && (c.width > a[0] || c.height > a[1]))
			if (e.type ==
				"image" || e.type == "swf") {
				g = d.width / d.height;
				if (c.width > a[0]) {
					c.width = a[0];
					c.height = parseInt((c.width - k) / g + k, 10)
				}
				if (c.height > a[1]) {
					c.height = a[1];
					c.width = parseInt((c.height - k) * g + k, 10)
				}
			} else {
				c.width = Math.min(c.width, a[0]);
				c.height = Math.min(c.height, a[1])
			}
		c.top = parseInt(Math.max(a[3] - 20, a[3] + (a[1] - c.height - 40) * 0.5), 10);
		c.left = parseInt(Math.max(a[2] - 20, a[2] + (a[0] - c.width - 40) * 0.5), 10);
		return c
	},
	V = function () {
		var a = e.orig ? b(e.orig) : false,
		c = {};
		if (a && a.length) {
			c = a.offset();
			c.top += parseInt(a.css("paddingTop"),
				10) || 0;
			c.left += parseInt(a.css("paddingLeft"), 10) || 0;
			c.top += parseInt(a.css("border-top-width"), 10) || 0;
			c.left += parseInt(a.css("border-left-width"), 10) || 0;
			c.width = a.width();
			c.height = a.height();
			c = {
				width : c.width + d.padding * 2,
				height : c.height + d.padding * 2,
				top : c.top - d.padding - 20,
				left : c.left - d.padding - 20
			}
		} else {
			a = U();
			c = {
				width : d.padding * 2,
				height : d.padding * 2,
				top : parseInt(a[3] + a[1] * 0.5, 10),
				left : parseInt(a[2] + a[0] * 0.5, 10)
			}
		}
		return c
	},
	Z = function () {
		if (t.is(":visible")) {
			b("div", t).css("top", L * -40 + "px");
			L = (L + 1) % 12
		} else
			clearInterval(K)
	};
	b.fn.fancybox = function (a) {
		if (!b(this).length)
			return this;
		b(this).data("fancybox", b.extend({}, a, b.metadata ? b(this).metadata() : {})).unbind("click.fb").bind("click.fb", function (c) {
			c.preventDefault();
			if (!h) {
				h = true;
				b(this).blur();
				o = [];
				q = 0;
				c = b(this).attr("rel") || "";
				if (!c || c == "" || c === "nofollow")
					o.push(this);
				else {
					o = b("a[rel=" + c + "], area[rel=" + c + "]");
					q = o.index(this)
				}
				I()
			}
		});
		return this
	};
	b.fancybox = function (a, c) {
		var g;
		if (!h) {
			h = true;
			g = typeof c !== "undefined" ? c : {};
			o = [];
			q = parseInt(g.index, 10) || 0;
			if (b.isArray(a)) {
				for (var k =
						0, C = a.length; k < C; k++)
					if (typeof a[k] == "object")
						b(a[k]).data("fancybox", b.extend({}, g, a[k]));
					else
						a[k] = b({}).data("fancybox", b.extend({
									content : a[k]
								}, g));
				o = jQuery.merge(o, a)
			} else {
				if (typeof a == "object")
					b(a).data("fancybox", b.extend({}, g, a));
				else
					a = b({}).data("fancybox", b.extend({
								content : a
							}, g));
				o.push(a)
			}
			if (q > o.length || q < 0)
				q = 0;
			I()
		}
	};
	b.fancybox.showActivity = function () {
		clearInterval(K);
		t.show();
		K = setInterval(Z, 66)
	};
	b.fancybox.hideActivity = function () {
		t.hide()
	};
	b.fancybox.next = function () {
		return b.fancybox.pos(p +
			1)
	};
	b.fancybox.prev = function () {
		return b.fancybox.pos(p - 1)
	};
	b.fancybox.pos = function (a) {
		if (!h) {
			a = parseInt(a);
			o = l;
			if (a > -1 && a < l.length) {
				q = a;
				I()
			} else if (d.cyclic && l.length > 1) {
				q = a >= l.length ? 0 : l.length - 1;
				I()
			}
		}
	};
	b.fancybox.cancel = function () {
		if (!h) {
			h = true;
			b.event.trigger("fancybox-cancel");
			N();
			e.onCancel(o, q, e);
			h = false
		}
	};
	b.fancybox.close = function () {
		function a() {
			u.fadeOut("fast");
			n.empty().hide();
			f.hide();
			b.event.trigger("fancybox-cleanup");
			j.empty();
			d.onClosed(l, p, d);
			l = e = [];
			p = q = 0;
			d = e = {};
			h = false
		}
		if (!(h || f.is(":hidden"))) {
			h =
				true;
			if (d && false === d.onCleanup(l, p, d))
				h = false;
			else {
				N();
				b(E.add(z).add(A)).hide();
				b(j.add(u)).unbind();
				b(window).unbind("resize.fb scroll.fb");
				b(document).unbind("keydown.fb");
				j.find("iframe").attr("src", M && /^https/i.test(window.location.href || "") ? "javascript:void(false)" : "about:blank");
				d.titlePosition !== "inside" && n.empty();
				f.stop();
				if (d.transitionOut == "elastic") {
					r = V();
					var c = f.position();
					i = {
						top : c.top,
						left : c.left,
						width : f.width(),
						height : f.height()
					};
					if (d.opacity)
						i.opacity = 1;
					n.empty().hide();
					B.prop = 1;
					b(B).animate({
						prop : 0
					}, {
						duration : d.speedOut,
						easing : d.easingOut,
						step : T,
						complete : a
					})
				} else
					f.fadeOut(d.transitionOut == "none" ? 0 : d.speedOut, a)
			}
		}
	};
	b.fancybox.resize = function () {
		u.is(":visible") && u.css("height", b(document).height());
		b.fancybox.center(true)
	};
	b.fancybox.center = function (a) {
		var c,
		g;
		if (!h) {
			g = a === true ? 1 : 0;
			c = U();
			!g && (f.width() > c[0] || f.height() > c[1]) || f.stop().animate({
				top : parseInt(Math.max(c[3] - 20, c[3] + (c[1] - j.height() - 40) * 0.5 - d.padding)),
				left : parseInt(Math.max(c[2] - 20, c[2] + (c[0] - j.width() - 40) * 0.5 -
						d.padding))
			}, typeof a == "number" ? a : 200)
		}
	};
	b.fancybox.init = function () {
		if (!b("#fancybox-wrap").length) {
			b("body").append(m = b('<div id="fancybox-tmp"></div>'), t = b('<div id="fancybox-loading"><div></div></div>'), u = b('<div id="fancybox-overlay"></div>'), f = b('<div id="fancybox-wrap"></div>'));
			D = b('<div id="fancybox-outer"></div>').append('<div class="fancybox-bg" id="fancybox-bg-n"></div><div class="fancybox-bg" id="fancybox-bg-ne"></div><div class="fancybox-bg" id="fancybox-bg-e"></div><div class="fancybox-bg" id="fancybox-bg-se"></div><div class="fancybox-bg" id="fancybox-bg-s"></div><div class="fancybox-bg" id="fancybox-bg-sw"></div><div class="fancybox-bg" id="fancybox-bg-w"></div><div class="fancybox-bg" id="fancybox-bg-nw"></div>').appendTo(f);
			D.append(j = b('<div id="fancybox-content"></div>'), E = b('<a id="fancybox-close"></a>'), n = b('<div id="fancybox-title"></div>'), z = b('<a href="javascript:;" id="fancybox-left"><span class="fancy-ico" id="fancybox-left-ico"></span></a>'), A = b('<a href="javascript:;" id="fancybox-right"><span class="fancy-ico" id="fancybox-right-ico"></span></a>'));
			E.click(b.fancybox.close);
			t.click(b.fancybox.cancel);
			z.click(function (a) {
				a.preventDefault();
				b.fancybox.prev()
			});
			A.click(function (a) {
				a.preventDefault();
				b.fancybox.next()
			});
			b.fn.mousewheel && f.bind("mousewheel.fb", function (a, c) {
				if (h)
					a.preventDefault();
				else if (b(a.target).get(0).clientHeight == 0 || b(a.target).get(0).scrollHeight === b(a.target).get(0).clientHeight) {
					a.preventDefault();
					b.fancybox[c > 0 ? "prev" : "next"]()
				}
			});
			b.support.opacity || f.addClass("fancybox-ie");
			if (M) {
				t.addClass("fancybox-ie6");
				f.addClass("fancybox-ie6");
				b('<iframe id="fancybox-hide-sel-frame" src="' + (/^https/i.test(window.location.href || "") ? "javascript:void(false)" : "about:blank") + '" scrolling="no" border="0" frameborder="0" tabindex="-1"></iframe>').prependTo(D)
			}
		}
	};
	b.fn.fancybox.defaults = {
		padding : 10,
		margin : 40,
		opacity : false,
		modal : false,
		cyclic : false,
		scrolling : "auto",
		width : 560,
		height : 340,
		autoScale : true,
		autoDimensions : true,
		centerOnScroll : false,
		ajax : {},
		swf : {
			wmode : "transparent"
		},
		hideOnOverlayClick : true,
		hideOnContentClick : false,
		overlayShow : true,
		overlayOpacity : 0.7,
		overlayColor : "#777",
		titleShow : true,
		titlePosition : "float",
		titleFormat : null,
		titleFromAlt : false,
		transitionIn : "fade",
		transitionOut : "fade",
		speedIn : 300,
		speedOut : 300,
		changeSpeed : 300,
		changeFade : "fast",
		easingIn : "swing",
		easingOut : "swing",
		showCloseButton : true,
		showNavArrows : true,
		enableEscapeButton : true,
		enableKeyboardNav : true,
		onStart : function () {},
		onCancel : function () {},
		onComplete : function () {},
		onCleanup : function () {},
		onClosed : function () {},
		onError : function () {}

	};
	b(document).ready(function () {})
})(jQuery);

/**
 * Color picker
 * Author: Stefan Petre www.eyecon.ro
 * Dual licensed under the MIT and GPL licenses
 */
;
(function (c) {
	var h = function () {
		var h = 65,
		D = {
			eventName : "click",
			onShow : function () {},
			onBeforeShow : function () {},
			onHide : function () {},
			onChange : function () {},
			onSubmit : function () {},
			color : "ff0000",
			livePreview : !0,
			flat : !1
		},
		j = function (a, b) {
			var d = i(a);
			c(b).data("colorpicker").fields.eq(1).val(d.r).end().eq(2).val(d.g).end().eq(3).val(d.b).end()
		},
		o = function (a, b) {
			c(b).data("colorpicker").fields.eq(4).val(a.h).end().eq(5).val(a.s).end().eq(6).val(a.b).end()
		},
		l = function (a, b) {
			c(b).data("colorpicker").fields.eq(0).val(k(i(a))).end()
		},
		p = function (a, b) {
			c(b).data("colorpicker").selector.css("backgroundColor", "#" + k(i({
						h : a.h,
						s : 100,
						b : 100
					})));
			c(b).data("colorpicker").selectorIndic.css({
				left : parseInt(150 * a.s / 100, 10),
				top : parseInt(150 * (100 - a.b) / 100, 10)
			})
		},
		q = function (a, b) {
			c(b).data("colorpicker").hue.css("top", parseInt(150 - 150 * a.h / 360, 10))
		},
		s = function (a, b) {
			c(b).data("colorpicker").currentColor.css("backgroundColor", "#" + k(i(a)))
		},
		r = function (a, b) {
			c(b).data("colorpicker").newColor.css("backgroundColor", "#" + k(i(a)))
		},
		E = function (a) {
			a = a.charCode || a.keyCode || -1;
			if (a > h && 90 >= a || 32 == a)
				return !1;
			!0 === c(this).parent().parent().data("colorpicker").livePreview && m.apply(this)
		},
		m = function (a) {
			var b = c(this).parent().parent(),
			d;
			if (0 < this.parentNode.className.indexOf("_hex")) {
				d = b.data("colorpicker");
				var g = this.value,
				e = 6 - g.length;
				if (0 < e) {
					for (var f = [], h = 0; h < e; h++)
						f.push("0");
					f.push(g);
					g = f.join("")
				}
				g = n(t(g));
				d.color = d = g
			} else
				0 < this.parentNode.className.indexOf("_hsb") ? b.data("colorpicker").color = d = u({
						h : parseInt(b.data("colorpicker").fields.eq(4).val(), 10),
						s : parseInt(b.data("colorpicker").fields.eq(5).val(), 10),
						b : parseInt(b.data("colorpicker").fields.eq(6).val(), 10)
					}) : (d = b.data("colorpicker"), g = parseInt(b.data("colorpicker").fields.eq(1).val(), 10), e = parseInt(b.data("colorpicker").fields.eq(2).val(), 10), f = parseInt(b.data("colorpicker").fields.eq(3).val(), 10), g = {
							r : Math.min(255, Math.max(0, g)),
							g : Math.min(255, Math.max(0, e)),
							b : Math.min(255, Math.max(0, f))
						}, d.color = d = n(g));
			a && (j(d, b.get(0)), l(d, b.get(0)), o(d, b.get(0)));
			p(d, b.get(0));
			q(d, b.get(0));
			r(d, b.get(0));
			b.data("colorpicker").onChange.apply(b, [d, k(i(d)), i(d)])
		},
		F = function () {
			c(this).parent().parent().data("colorpicker").fields.parent().removeClass("colorpicker_focus")
		},
		G = function () {
			h = 0 < this.parentNode.className.indexOf("_hex") ? 70 : 65;
			c(this).parent().parent().data("colorpicker").fields.parent().removeClass("colorpicker_focus");
			c(this).parent().addClass("colorpicker_focus")
		},
		H = function (a) {
			var b = c(this).parent().find("input").focus(),
			a = {
				el : c(this).parent().addClass("colorpicker_slider"),
				max : 0 < this.parentNode.className.indexOf("_hsb_h") ? 360 : 0 < this.parentNode.className.indexOf("_hsb") ? 100 : 255,
				y : a.pageY,
				field : b,
				val : parseInt(b.val(), 10),
				preview : c(this).parent().parent().data("colorpicker").livePreview
			};
			c(document).bind("mouseup", a, v);
			c(document).bind("mousemove", a, w)
		},
		w = function (a) {
			a.data.field.val(Math.max(0, Math.min(a.data.max, parseInt(a.data.val + a.pageY - a.data.y, 10))));
			a.data.preview && m.apply(a.data.field.get(0), [!0]);
			return !1
		},
		v = function (a) {
			m.apply(a.data.field.get(0), [!0]);
			a.data.el.removeClass("colorpicker_slider").find("input").focus();
			c(document).unbind("mouseup", v);
			c(document).unbind("mousemove", w);
			return !1
		},
		I = function () {
			var a = {
				cal : c(this).parent(),
				y : c(this).offset().top
			};
			a.preview = a.cal.data("colorpicker").livePreview;
			c(document).bind("mouseup", a, x);
			c(document).bind("mousemove", a, y)
		},
		y = function (a) {
			m.apply(a.data.cal.data("colorpicker").fields.eq(4).val(parseInt(360 * (150 - Math.max(0, Math.min(150, a.pageY - a.data.y))) / 150, 10)).get(0), [a.data.preview]);
			return !1
		},
		x = function (a) {
			j(a.data.cal.data("colorpicker").color, a.data.cal.get(0));
			l(a.data.cal.data("colorpicker").color, a.data.cal.get(0));
			c(document).unbind("mouseup", x);
			c(document).unbind("mousemove", y);
			return !1
		},
		J = function () {
			var a = {
				cal : c(this).parent(),
				pos : c(this).offset()
			};
			a.preview = a.cal.data("colorpicker").livePreview;
			c(document).bind("mouseup", a, z);
			c(document).bind("mousemove", a, A)
		},
		A = function (a) {
			m.apply(a.data.cal.data("colorpicker").fields.eq(6).val(parseInt(100 * (150 - Math.max(0, Math.min(150, a.pageY - a.data.pos.top))) / 150, 10)).end().eq(5).val(parseInt(100 * Math.max(0, Math.min(150, a.pageX - a.data.pos.left)) / 150, 10)).get(0), [a.data.preview]);
			return !1
		},
		z = function (a) {
			j(a.data.cal.data("colorpicker").color, a.data.cal.get(0));
			l(a.data.cal.data("colorpicker").color, a.data.cal.get(0));
			c(document).unbind("mouseup", z);
			c(document).unbind("mousemove", A);
			return !1
		},
		K = function () {
			c(this).addClass("colorpicker_focus")
		},
		L = function () {
			c(this).removeClass("colorpicker_focus")
		},
		M = function () {
			var a = c(this).parent(),
			b = a.data("colorpicker").color;
			a.data("colorpicker").origColor = b;
			s(b, a.get(0));
			a.data("colorpicker").onSubmit(b, k(i(b)), i(b), a.data("colorpicker").el)
		},
		C = function () {
			var a,
			b,
			d,
			g,
			e = c("#" + c(this).data("colorpickerId"));
			e.data("colorpicker").onBeforeShow.apply(this, [e.get(0)]);
			var f = c(this).offset();
			g = "CSS1Compat" == document.compatMode;
			a = window.pageXOffset || (g ? document.documentElement.scrollLeft : document.body.scrollLeft);
			b = window.pageYOffset || (g ? document.documentElement.scrollTop : document.body.scrollTop);
			d = window.innerWidth || (g ? document.documentElement.clientWidth : document.body.clientWidth);
			g = window.innerHeight || (g ? document.documentElement.clientHeight : document.body.clientHeight);
			var h = f.top + this.offsetHeight,
			f = f.left;
			h + 176 > b + g && (h -= this.offsetHeight + 176);
			f + 356 > a + d && (f -= 356);
			e.css({
				left : f + "px",
				top : h + "px"
			});
			!1 != e.data("colorpicker").onShow.apply(this, [e.get(0)]) && e.show();
			c(document).bind("mousedown", {
				cal : e
			}, B);
			return !1
		},
		B = function (a) {
			N(a.data.cal.get(0), a.target, a.data.cal.get(0)) || (!1 != a.data.cal.data("colorpicker").onHide.apply(this, [a.data.cal.get(0)]) && a.data.cal.hide(), c(document).unbind("mousedown", B))
		},
		N = function (a, b, d) {
			if (a == b)
				return !0;
			if (a.contains)
				return a.contains(b);
			if (a.compareDocumentPosition)
				return !!(a.compareDocumentPosition(b) & 16);
			for (b = b.parentNode; b && b != d; ) {
				if (b == a)
					return !0;
				b = b.parentNode
			}
			return !1
		},
		u = function (a) {
			return {
				h : Math.min(360, Math.max(0, a.h)),
				s : Math.min(100, Math.max(0, a.s)),
				b : Math.min(100, Math.max(0, a.b))
			}
		},
		t = function (a) {
			a = parseInt(-1 < a.indexOf("#") ? a.substring(1) : a, 16);
			return {
				r : a >> 16,
				g : (a & 65280) >> 8,
				b : a & 255
			}
		},
		n = function (a) {
			var b = {
				h : 0,
				s : 0,
				b : 0
			},
			d = Math.min(a.r, a.g, a.b),
			c = Math.max(a.r, a.g, a.b),
			d = c - d;
			b.b = c;
			b.s = 0 != c ? 255 * d / c : 0;
			b.h = 0 != b.s ? a.r == c ? (a.g - a.b) / d : a.g == c ? 2 + (a.b - a.r) / d : 4 + (a.r - a.g) / d : -1;
			b.h *= 60;
			0 > b.h && (b.h += 360);
			b.s *= 100 / 255;
			b.b *= 100 / 255;
			return b
		},
		i = function (a) {
			var b,
			d,
			c;
			b = Math.round(a.h);
			var e = Math.round(255 * a.s / 100),
			a = Math.round(255 * a.b / 100);
			if (0 == e)
				b = d = c = a;
			else {
				var e = (255 - e) * a / 255,
				f = (a - e) * (b % 60) / 60;
				360 == b && (b = 0);
				60 > b ? (b = a, c = e, d = e + f) : 120 > b ? (d = a, c = e, b = a - f) : 180 > b ? (d = a, b = e, c = e + f) : 240 > b ? (c = a, b = e, d = a - f) : 300 > b ? (c = a, d = e, b = e + f) : 360 > b ? (b = a, d = e, c = a - f) : c = d = b = 0
			}
			return {
				r : Math.round(b),
				g : Math.round(d),
				b : Math.round(c)
			}
		},
		k = function (a) {
			var b = [a.r.toString(16), a.g.toString(16), a.b.toString(16)];
			c.each(b, function (a, c) {
				1 == c.length && (b[a] = "0" + c)
			});
			return b.join("")
		},
		O = function () {
			var a = c(this).parent(),
			b = a.data("colorpicker").origColor;
			a.data("colorpicker").color = b;
			j(b, a.get(0));
			l(b, a.get(0));
			o(b, a.get(0));
			p(b, a.get(0));
			q(b, a.get(0));
			r(b, a.get(0))
		};
		return {
			init : function (a) {
				a = c.extend({}, D, a || {});
				if ("string" == typeof a.color)
					a.color = n(t(a.color));
				else if (void 0 != a.color.r && void 0 != a.color.g && void 0 != a.color.b)
					a.color = n(a.color);
				else if (void 0 != a.color.h && void 0 != a.color.s && void 0 != a.color.b)
					a.color = u(a.color);
				else
					return this;
				return this.each(function () {
					if (!c(this).data("colorpickerId")) {
						var b = c.extend({}, a);
						b.origColor = a.color;
						var d = "collorpicker_" + parseInt(1E3 * Math.random());
						c(this).data("colorpickerId", d);
						d = c('<div class="colorpicker"><div class="colorpicker_color"><div><div></div></div></div><div class="colorpicker_hue"><div></div></div><div class="colorpicker_new_color"></div><div class="colorpicker_current_color"></div><div class="colorpicker_hex"><input type="text" maxlength="6" size="6" /></div><div class="colorpicker_rgb_r colorpicker_field"><input type="text" maxlength="3" size="3" /><span></span></div><div class="colorpicker_rgb_g colorpicker_field"><input type="text" maxlength="3" size="3" /><span></span></div><div class="colorpicker_rgb_b colorpicker_field"><input type="text" maxlength="3" size="3" /><span></span></div><div class="colorpicker_hsb_h colorpicker_field"><input type="text" maxlength="3" size="3" /><span></span></div><div class="colorpicker_hsb_s colorpicker_field"><input type="text" maxlength="3" size="3" /><span></span></div><div class="colorpicker_hsb_b colorpicker_field"><input type="text" maxlength="3" size="3" /><span></span></div><div class="colorpicker_submit"></div></div>').attr("id", d);
						b.flat ? d.appendTo(this).show() : d.appendTo(document.body);
						b.fields = d.find("input").bind("keyup", E).bind("change", m).bind("blur", F).bind("focus", G);
						d.find("span").bind("mousedown", H).end().find(">div.colorpicker_current_color").bind("click", O);
						b.selector = d.find("div.colorpicker_color").bind("mousedown", J);
						b.selectorIndic = b.selector.find("div div");
						b.el = this;
						b.hue = d.find("div.colorpicker_hue div");
						d.find("div.colorpicker_hue").bind("mousedown", I);
						b.newColor = d.find("div.colorpicker_new_color");
						b.currentColor = d.find("div.colorpicker_current_color");
						d.data("colorpicker", b);
						d.find("div.colorpicker_submit").bind("mouseenter", K).bind("mouseleave", L).bind("click", M);
						j(b.color, d.get(0));
						o(b.color, d.get(0));
						l(b.color, d.get(0));
						q(b.color, d.get(0));
						p(b.color, d.get(0));
						s(b.color, d.get(0));
						r(b.color, d.get(0));
						b.flat ? d.css({
							position : "relative",
							display : "block"
						}) : c(this).bind(b.eventName, C)
					}
				})
			},
			showPicker : function () {
				return this.each(function () {
					c(this).data("colorpickerId") && C.apply(this)
				})
			},
			hidePicker : function () {
				return this.each(function () {
					c(this).data("colorpickerId") && c("#" + c(this).data("colorpickerId")).hide()
				})
			},
			setColor : function (a) {
				if ("string" == typeof a)
					a = n(t(a));
				else if (void 0 != a.r && void 0 != a.g && void 0 != a.b)
					a = n(a);
				else if (void 0 != a.h && void 0 != a.s && void 0 != a.b)
					a = u(a);
				else
					return this;
				return this.each(function () {
					if (c(this).data("colorpickerId")) {
						var b = c("#" + c(this).data("colorpickerId"));
						b.data("colorpicker").color = a;
						b.data("colorpicker").origColor = a;
						j(a, b.get(0));
						o(a, b.get(0));
						l(a, b.get(0));
						q(a, b.get(0));
						p(a, b.get(0));
						s(a, b.get(0));
						r(a, b.get(0))
					}
				})
			}
		}
	}
	();
	c.fn.extend({
		ColorPicker : h.init,
		ColorPickerHide : h.hidePicker,
		ColorPickerShow : h.showPicker,
		ColorPickerSetColor : h.setColor
	})
})(jQuery);

/*
 * jQuery Autocomplete plugin 1.2.2
 * Copyright (c) 2009 Jörn Zaefferer
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 * With small modifications by Alfonso Gómez-Arzola.
 * See changelog for details.
 *
 */
;
(function ($) {
	$.fn.extend({
		sautocomplete : function (urlOrData, options) {
			var isUrl = typeof urlOrData == "string";
			options = $.extend({}, $.Autocompleter.defaults, {
					url : isUrl ? urlOrData : null,
					data : isUrl ? null : urlOrData,
					delay : isUrl ? $.Autocompleter.defaults.delay : 10,
					max : options && !options.scroll ? 10 : 150
				}, options);
			options.highlight = options.highlight || function (value) {
				return value
			};
			options.formatMatch = options.formatMatch || options.formatItem;
			return this.each(function () {
				new $.Autocompleter(this, options)
			})
		},
		result : function (handler) {
			return this.bind("result", handler)
		},
		search : function (handler) {
			return this.trigger("search", [handler])
		},
		flushCache : function () {
			return this.trigger("flushCache")
		},
		setOptions : function (options) {
			return this.trigger("setOptions", [options])
		},
		unautocomplete : function () {
			return this.trigger("unautocomplete")
		}
	});
	$.Autocompleter = function (input, options) {
		var KEY = {
			UP : 38,
			DOWN : 40,
			DEL : 46,
			TAB : 9,
			RETURN : 13,
			ESC : 27,
			COMMA : 188,
			PAGEUP : 33,
			PAGEDOWN : 34,
			BACKSPACE : 8
		};
		var globalFailure = null;
		if (options.failure != null && typeof options.failure == "function") {
			globalFailure = options.failure
		}
		var $input = $(input).attr("autocomplete", "off").addClass(options.inputClass);
		var timeout;
		var previousValue = "";
		var cache = $.Autocompleter.Cache(options);
		var hasFocus = 0;
		var lastKeyPressCode;
		var config = {
			mouseDownOnSelect : false
		};
		var select = $.Autocompleter.Select(options, input, selectCurrent, config);
		var blockSubmit;
		$.browser.opera && $(input.form).bind("submit.autocomplete", function () {
			if (blockSubmit) {
				blockSubmit = false;
				return false
			}
		});
		$input.bind(($.browser.opera ? "keypress" : "keydown") + ".autocomplete", function (event) {
			hasFocus = 1;
			lastKeyPressCode = event.keyCode;
			switch (event.keyCode) {
			case KEY.UP:
				if (select.visible()) {
					event.preventDefault();
					select.prev()
				} else {
					onChange(0, true)
				}
				break;
			case KEY.DOWN:
				if (select.visible()) {
					event.preventDefault();
					select.next()
				} else {
					onChange(0, true)
				}
				break;
			case KEY.PAGEUP:
				if (select.visible()) {
					event.preventDefault();
					select.pageUp()
				} else {
					onChange(0, true)
				}
				break;
			case KEY.PAGEDOWN:
				if (select.visible()) {
					event.preventDefault();
					select.pageDown()
				} else {
					onChange(0, true)
				}
				break;
			case options.multiple && $.trim(options.multipleSeparator) == "," && KEY.COMMA:
			case KEY.TAB:
			case KEY.RETURN:
				if (selectCurrent()) {
					event.preventDefault();
					blockSubmit = true;
					return false
				}
				break;
			case KEY.ESC:
				select.hide();
				break;
			default:
				clearTimeout(timeout);
				timeout = setTimeout(onChange, options.delay);
				break
			}
		}).focus(function () {
			hasFocus++
		}).blur(function () {
			hasFocus = 0;
			if (!config.mouseDownOnSelect) {
				hideResults()
			}
		}).click(function () {
			if (options.clickFire) {
				if (!select.visible()) {
					onChange(0, true)
				}
			} else {
				if (hasFocus++ > 1 && !select.visible()) {
					onChange(0, true)
				}
			}
		}).bind("search", function () {
			var fn = (arguments.length > 1) ? arguments[1] : null;
			function findValueCallback(q, data) {
				var result;
				if (data && data.length) {
					for (var i = 0; i < data.length; i++) {
						if (data[i].result.toLowerCase() == q.toLowerCase()) {
							result = data[i];
							break
						}
					}
				}
				if (typeof fn == "function")
					fn(result);
				else
					$input.trigger("result", result && [result.data, result.value])
			}
			$.each(trimWords($input.val()), function (i, value) {
				request(value, findValueCallback, findValueCallback)
			})
		}).bind("flushCache", function () {
			cache.flush()
		}).bind("setOptions", function () {
			$.extend(true, options, arguments[1]);
			if ("data" in arguments[1])
				cache.populate()
		}).bind("unautocomplete", function () {
			select.unbind();
			$input.unbind();
			$(input.form).unbind(".autocomplete")
		});
		function selectCurrent() {
			var selected = select.selected();
			if (!selected)
				return false;
			var v = selected.result;
			previousValue = v;
			if (options.multiple) {
				var words = trimWords($input.val());
				if (words.length > 1) {
					var seperator = options.multipleSeparator.length;
					var cursorAt = $(input).selection().start;
					var wordAt,
					progress = 0;
					$.each(words, function (i, word) {
						progress += word.length;
						if (cursorAt <= progress) {
							wordAt = i;
							return false
						}
						progress += seperator
					});
					words[wordAt] = v;
					v = words.join(options.multipleSeparator)
				}
				v += options.multipleSeparator
			}
			$input.val(v);
			hideResultsNow();
			$input.trigger("result", [selected.data, selected.value]);
			return true
		}
		function onChange(crap, skipPrevCheck) {
			if (lastKeyPressCode == KEY.DEL) {
				select.hide();
				return
			}
			var currentValue = $input.val();
			if (!skipPrevCheck && currentValue == previousValue)
				return;
			previousValue = currentValue;
			currentValue = lastWord(currentValue);
			if (currentValue.length >= options.minChars) {
				$input.addClass(options.loadingClass);
				if (!options.matchCase)
					currentValue = currentValue.toLowerCase();
				request(currentValue, receiveData, hideResultsNow)
			} else {
				stopLoading();
				select.hide()
			}
		};
		function trimWords(value) {
			if (!value)
				return [""];
			if (!options.multiple)
				return [$.trim(value)];
			return $.map(value.split(options.multipleSeparator), function (word) {
				return $.trim(value).length ? $.trim(word) : null
			})
		}
		function lastWord(value) {
			if (!options.multiple)
				return value;
			var words = trimWords(value);
			if (words.length == 1)
				return words[0];
			var cursorAt = $(input).selection().start;
			if (cursorAt == value.length) {
				words = trimWords(value)
			} else {
				words = trimWords(value.replace(value.substring(cursorAt), ""))
			}
			return words[words.length - 1]
		}
		function autoFill(q, sValue) {
			if (options.autoFill && (lastWord($input.val()).toLowerCase() == q.toLowerCase()) && lastKeyPressCode != KEY.BACKSPACE) {
				$input.val($input.val() + sValue.substring(lastWord(previousValue).length));
				$(input).selection(previousValue.length, previousValue.length + sValue.length)
			}
		};
		function hideResults() {
			clearTimeout(timeout);
			timeout = setTimeout(hideResultsNow, 200)
		};
		function hideResultsNow() {
			var wasVisible = select.visible();
			select.hide();
			clearTimeout(timeout);
			stopLoading();
			if (options.mustMatch) {
				$input.search(function (result) {
					if (!result) {
						if (options.multiple) {
							var words = trimWords($input.val()).slice(0, -1);
							$input.val(words.join(options.multipleSeparator) + (words.length ? options.multipleSeparator : ""))
						} else {
							$input.val("");
							$input.trigger("result", null)
						}
					}
				})
			}
		};
		function receiveData(q, data) {
			if (data && data.length && hasFocus) {
				stopLoading();
				select.display(data, q);
				autoFill(q, data[0].value);
				select.show()
			} else {
				hideResultsNow()
			}
		};
		function request(term, success, failure) {
			if (!options.matchCase)
				term = term.toLowerCase();
			var data = cache.load(term);
			if (data && data.length) {
				success(term, data)
			} else if ((typeof options.url == "string") && (options.url.length > 0)) {
				var extraParams = {
					timestamp : +new Date()
				};
				$.each(options.extraParams, function (key, param) {
					extraParams[key] = typeof param == "function" ? param() : param
				});
				$.ajax({
					mode : "abort",
					port : "autocomplete" + input.name,
					dataType : options.dataType,
					url : options.url,
					data : $.extend({
						q : lastWord(term),
						limit : options.max
					}, extraParams),
					success : function (data) {
						var parsed = options.parse && options.parse(data) || parse(data);
						cache.add(term, parsed);
						success(term, parsed)
					}
				})
			} else {
				select.emptyList();
				if (globalFailure != null) {
					globalFailure()
				} else {
					failure(term)
				}
			}
		};
		function parse(data) {
			var parsed = [];
			var rows = data.split("\n");
			for (var i = 0; i < rows.length; i++) {
				var row = $.trim(rows[i]);
				if (row) {
					row = row.split("|");
					parsed[parsed.length] = {
						data : row,
						value : row[0],
						result : options.formatResult && options.formatResult(row, row[0]) || row[0]
					}
				}
			}
			return parsed
		};
		function stopLoading() {
			$input.removeClass(options.loadingClass)
		}
	};
	$.Autocompleter.defaults = {
		inputClass : "ac_input",
		resultsClass : "ac_results",
		loadingClass : "ac_loading",
		minChars : 1,
		delay : 400,
		matchCase : false,
		matchSubset : true,
		matchContains : false,
		cacheLength : 100,
		max : 1000,
		mustMatch : false,
		extraParams : {},
		selectFirst : true,
		formatItem : function (row) {
			return row[0]
		},
		formatMatch : null,
		autoFill : false,
		width : 0,
		multiple : false,
		multipleSeparator : " ",
		inputFocus : true,
		clickFire : false,
		highlight : function (value, term) {
			return value.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + term.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1") + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>")
		},
		scroll : true,
		scrollHeight : 180,
		scrollJumpPosition : true
	};
	$.Autocompleter.Cache = function (options) {
		var data = {};
		var length = 0;
		function matchSubset(s, sub) {
			if (!options.matchCase)
				s = s.toLowerCase();
			var i = s.indexOf(sub);
			if (options.matchContains == "word") {
				i = s.toLowerCase().search("\\b" + sub.toLowerCase())
			}
			if (i == -1)
				return false;
			return i == 0 || options.matchContains
		};
		function add(q, value) {
			if (length > options.cacheLength) {
				flush()
			}
			if (!data[q]) {
				length++
			}
			data[q] = value
		}
		function populate() {
			if (!options.data)
				return false;
			var stMatchSets = {},
			nullData = 0;
			if (!options.url)
				options.cacheLength = 1;
			stMatchSets[""] = [];
			for (var i = 0, ol = options.data.length; i < ol; i++) {
				var rawValue = options.data[i];
				rawValue = (typeof rawValue == "string") ? [rawValue] : rawValue;
				var value = options.formatMatch(rawValue, i + 1, options.data.length);
				if (value === false)
					continue;
				var firstChar = value.charAt(0).toLowerCase();
				if (!stMatchSets[firstChar])
					stMatchSets[firstChar] = [];
				var row = {
					value : value,
					data : rawValue,
					result : options.formatResult && options.formatResult(rawValue) || value
				};
				stMatchSets[firstChar].push(row);
				if (nullData++ < options.max) {
					stMatchSets[""].push(row)
				}
			};
			$.each(stMatchSets, function (i, value) {
				options.cacheLength++;
				add(i, value)
			})
		}
		setTimeout(populate, 25);
		function flush() {
			data = {};
			length = 0
		}
		return {
			flush : flush,
			add : add,
			populate : populate,
			load : function (q) {
				if (!options.cacheLength || !length)
					return null;
				if (!options.url && options.matchContains) {
					var csub = [];
					for (var k in data) {
						if (k.length > 0) {
							var c = data[k];
							$.each(c, function (i, x) {
								if (matchSubset(x.value, q)) {
									csub.push(x)
								}
							})
						}
					}
					return csub
				} else if (data[q]) {
					return data[q]
				} else if (options.matchSubset) {
					for (var i = q.length - 1; i >= options.minChars; i--) {
						var c = data[q.substr(0, i)];
						if (c) {
							var csub = [];
							$.each(c, function (i, x) {
								if (matchSubset(x.value, q)) {
									csub[csub.length] = x
								}
							});
							return csub
						}
					}
				}
				return null
			}
		}
	};
	$.Autocompleter.Select = function (options, input, select, config) {
		var CLASSES = {
			ACTIVE : "ac_over"
		};
		var listItems,
		active = -1,
		data,
		term = "",
		needsInit = true,
		element,
		list;
		function init() {
			if (!needsInit)
				return;
			element = $("<div/>").hide().addClass(options.resultsClass).css("position", "absolute").appendTo(document.body).hover(function (event) {
					if ($(this).is(":visible")) {
						input.focus()
					}
					config.mouseDownOnSelect = false
				});
			list = $("<ul/>").appendTo(element).mouseover(function (event) {
					if (target(event).nodeName && target(event).nodeName.toUpperCase() == 'LI') {
						active = $("li", list).removeClass(CLASSES.ACTIVE).index(target(event));
						$(target(event)).addClass(CLASSES.ACTIVE)
					}
				}).click(function (event) {
					$(target(event)).addClass(CLASSES.ACTIVE);
					select();
					if (options.inputFocus)
						input.focus();
					return false
				}).mousedown(function () {
					config.mouseDownOnSelect = true
				}).mouseup(function () {
					config.mouseDownOnSelect = false
				});
			if (options.width > 0)
				element.css("width", options.width);
			needsInit = false
		}
		function target(event) {
			var element = event.target;
			while (element && element.tagName != "LI")
				element = element.parentNode;
			if (!element)
				return [];
			return element
		}
		function moveSelect(step) {
			listItems.slice(active, active + 1).removeClass(CLASSES.ACTIVE);
			movePosition(step);
			var activeItem = listItems.slice(active, active + 1).addClass(CLASSES.ACTIVE);
			if (options.scroll) {
				var offset = 0;
				listItems.slice(0, active).each(function () {
					offset += this.offsetHeight
				});
				if ((offset + activeItem[0].offsetHeight - list.scrollTop()) > list[0].clientHeight) {
					list.scrollTop(offset + activeItem[0].offsetHeight - list.innerHeight())
				} else if (offset < list.scrollTop()) {
					list.scrollTop(offset)
				}
			}
		};
		function movePosition(step) {
			if (options.scrollJumpPosition || (!options.scrollJumpPosition && !((step < 0 && active == 0) || (step > 0 && active == listItems.size() - 1)))) {
				active += step;
				if (active < 0) {
					active = listItems.size() - 1
				} else if (active >= listItems.size()) {
					active = 0
				}
			}
		}
		function limitNumberOfItems(available) {
			return options.max && options.max < available ? options.max : available
		}
		function fillList() {
			list.empty();
			var max = limitNumberOfItems(data.length);
			for (var i = 0; i < max; i++) {
				if (!data[i])
					continue;
				var formatted = options.formatItem(data[i].data, i + 1, max, data[i].value, term);
				if (formatted === false)
					continue;
				var li = $("<li/>").html(options.highlight(formatted, term)).addClass(i % 2 == 0 ? "ac_even" : "ac_odd").appendTo(list)[0];
				$.data(li, "ac_data", data[i])
			}
			listItems = list.find("li");
			if (options.selectFirst) {
				listItems.slice(0, 1).addClass(CLASSES.ACTIVE);
				active = 0
			}
			if ($.fn.bgiframe)
				list.bgiframe()
		}
		return {
			display : function (d, q) {
				init();
				data = d;
				term = q;
				fillList()
			},
			next : function () {
				moveSelect(1)
			},
			prev : function () {
				moveSelect(-1)
			},
			pageUp : function () {
				if (active != 0 && active - 8 < 0) {
					moveSelect(-active)
				} else {
					moveSelect(-8)
				}
			},
			pageDown : function () {
				if (active != listItems.size() - 1 && active + 8 > listItems.size()) {
					moveSelect(listItems.size() - 1 - active)
				} else {
					moveSelect(8)
				}
			},
			hide : function () {
				element && element.hide();
				listItems && listItems.removeClass(CLASSES.ACTIVE);
				active = -1
			},
			visible : function () {
				return element && element.is(":visible")
			},
			current : function () {
				return this.visible() && (listItems.filter("." + CLASSES.ACTIVE)[0] || options.selectFirst && listItems[0])
			},
			show : function () {
				var offset = $(input).offset();
				element.css({
					width : typeof options.width == "string" || options.width > 0 ? options.width : $(input).width(),
					top : offset.top + input.offsetHeight,
					left : offset.left
				}).show();
				if (options.scroll) {
					list.scrollTop(0);
					list.css({
						maxHeight : options.scrollHeight,
						overflow : 'auto'
					});
					if ($.browser.msie && typeof document.body.style.maxHeight === "undefined") {
						var listHeight = 0;
						listItems.each(function () {
							listHeight += this.offsetHeight
						});
						var scrollbarsVisible = listHeight > options.scrollHeight;
						list.css('height', scrollbarsVisible ? options.scrollHeight : listHeight);
						if (!scrollbarsVisible) {
							listItems.width(list.width() - parseInt(listItems.css("padding-left")) - parseInt(listItems.css("padding-right")))
						}
					}
				}
			},
			selected : function () {
				var selected = listItems && listItems.filter("." + CLASSES.ACTIVE).removeClass(CLASSES.ACTIVE);
				return selected && selected.length && $.data(selected[0], "ac_data")
			},
			emptyList : function () {
				list && list.empty()
			},
			unbind : function () {
				element && element.remove()
			}
		}
	};
	$.fn.selection = function (start, end) {
		if (start !== undefined) {
			return this.each(function () {
				if (this.createTextRange) {
					var selRange = this.createTextRange();
					if (end === undefined || start == end) {
						selRange.move("character", start);
						selRange.select()
					} else {
						selRange.collapse(true);
						selRange.moveStart("character", start);
						selRange.moveEnd("character", end);
						selRange.select()
					}
				} else if (this.setSelectionRange) {
					this.setSelectionRange(start, end)
				} else if (this.selectionStart) {
					this.selectionStart = start;
					this.selectionEnd = end
				}
			})
		}
		var field = this[0];
		if (field.createTextRange) {
			var range = document.selection.createRange(),
			orig = field.value,
			teststring = "<->",
			textLength = range.text.length;
			range.text = teststring;
			var caretAt = field.value.indexOf(teststring);
			field.value = orig;
			this.selection(caretAt, caretAt + textLength);
			return {
				start : caretAt,
				end : caretAt + textLength
			}
		} else if (field.selectionStart !== undefined) {
			return {
				start : field.selectionStart,
				end : field.selectionEnd
			}
		}
	}
})(jQuery);

/* ---------------------------------------------
Nested Accordion v.1.4.7.3
Script to create 'accordion' functionality on a hierarchically structured content.
http://www.adipalaz.com/experiments/jquery/nested_accordion.html
Requires: jQuery v1.4.2+
Copyright (c) 2009 Adriana Palazova
Dual licensed under the MIT (http://www.adipalaz.com/docs/mit-license.txt) and GPL (http://www.adipalaz.com/docs/gpl-license.txt) licenses.
------------------------------------------------ */
;
(function (b) {
	b.fn.orphans = function () {
		var d = [];
		this.each(function () {
			b.each(this.childNodes, function () {
				3 == this.nodeType && b.trim(this.nodeValue) && d.push(this)
			})
		});
		return b(d)
	};
	b.fn.accordion = function (d) {
		var a = b.extend({}, b.fn.accordion.defaults, d);
		return this.each(function () {
			function d(a) {
				for (var c = 0, f = arguments.length; c < f; c++) {
					var e = arguments[c],
					n = b(e);
					if (0 < n.scrollTop())
						return e;
					n.scrollTop(1);
					var g = 0 < n.scrollTop();
					n.scrollTop(0);
					if (g)
						return e
				}
				return []
			}
			var c = a.container ? "#" + this.id : "",
			e = a.objID ? a.objID : a.obj + a.objClass,
			c = a.container ? c + " " + e : "#" + this.id,
			i = c + " " + a.el,
			l = null;
			a.head && b(c).find(a.head).addClass("h");
			a.head && (b(i).next("div:not(.outer)").length && b(i).next("div:not(.outer)").wrap('<div class="outer" />'), b(c + " .h").each(function () {
					var c = b(this);
					"div" == a.wrapper && !c.parent("div.new").length && c.add(c.next("div.outer")).wrapAll('<div class="new"></div>')
				}));
			b(i).each(function () {
				var c = b(this);
				if (c.find(a.next).length || c.next(a.next).length)
					if (c.find("> a").length)
						c.find("> a").addClass("trigger").css("display", "block");
					else if (a.elToWrap) {
						var d = c.orphans(),
						c = c.find(a.elToWrap);
						d.add(c).wrapAll('<a class="trigger" style="display:block" href="#" />')
					} else
						c.orphans().wrap('<a class="trigger" style="display:block" href="#" />');
				else
					c.addClass("last-child"), a.lastChild && c.find("> a").length && c.find("> a").addClass("trigger").css("display", "block")
			});
			b(i + " a.trigger").closest(a.wrapper).find("> " + a.next).not(".shown").hide().closest(a.wrapper).find("a.open").removeClass("open").data("state", 0);
			if (a.activeLink) {
				var f,
				e = window.location.href,
				g = window.location.pathname.split("/"),
				g = g[g.length - 1];
				"full" == a.uri ? f = e : f = g;
				b(c + ' a:not([href $= "#"])[href$="' + f + '"]').addClass("active").parent().attr("id", "current").closest(a.obj).addClass("current");
				if (a.shift && b(c + " a.active").closest(a.wrapper).prev(a.wrapper).length) {
					f = b(c + " a.active").closest(a.wrapper);
					var e = f.nextAll().andSelf(),
					g = f.siblings(a.wrapper),
					j = g.filter(":first");
					("clicked" == a.shift || "all" == a.shift && g.length) && f.insertBefore(j).addClass("shown").siblings(a.wrapper).removeClass("shown");
					"all" == a.shift && 1 < g.length && e.insertBefore(j)
				}
			}
			a.initShow && (b(c).find(a.initShow).show().addClass("shown").parents(c + " " + a.next).show().addClass("shown").end().parents(a.wrapper).find("> a.trigger, > " + a.el + " a.trigger").addClass("open").data("state", 1), a.expandSub && b(c + " " + a.initShow).children(a.next).show().end().find("> a").addClass("open").data("state", 1));
			f = "click" == a.event ? "click" : "mouseenter" + (a.focus ? " focus" : "");
			var k;
			"function" == typeof d ? k = d("html", "body") : k = "html, body";
			b(c).delegate("a.trigger", f, function () {
				function c() {
					e.length && d.data("state") && a.collapsible && (d.removeClass("open"), e.filter(":visible")[a.hideMethod](a.hideSpeed, function () {
							d.data("state", 0)
						}));
					if (e.length && !d.data("state") || !e.length && d.closest(a.wrapper).not(".shown"))
						a.standardExpansible || (g.find("> a.open, >" + a.el + " a.open").removeClass("open").data("state", 0).end().find("> " + a.next + ":visible")[a.hideMethod](a.hideSpeed), m && m < b(window).scrollTop() && b(k).animate({
								scrollTop : m
							}, a.scrollSpeed)), d.addClass("open"), e.filter(":hidden")[a.showMethod](a.showSpeed, function () {
							d.data("state", 1)
						});
					if (a.shift && f.prev(a.wrapper).length) {
						var o = f.nextAll().andSelf(),
						h = g.filter(":first");
						("clicked" == a.shift || "all" == a.shift && g.length) && f.insertBefore(h).addClass("shown").siblings(a.wrapper).removeClass("shown");
						"all" == a.shift && 1 < g.length && o.insertBefore(h)
					}
				}
				var d = b(this),
				f = d.closest(a.wrapper),
				e = f.find("> " + a.next),
				g = f.siblings(a.wrapper),
				h = b(i + " a.trigger"),
				j = f.siblings(a.wrapper).find(">" + a.next + ":visible"),
				m;
				j.length ? m = j.offset().top : m = !1;
				if ("click" == a.event)
					return c(h), d.is('[href $= "#"]') ? !1 : b.isFunction(a.retFunc) ? a.retFunc(d) : !0;
				"click" != a.event && (l = window.setTimeout(function () {
							c(h)
						}, a.interval), d.click(function () {
						d.blur();
						if ("#" == d.attr("href"))
							return d.blur(), !1
					}))
			});
			"click" != a.event && b(c).delegate("a.trigger", "mouseleave", function () {
				window.clearTimeout(l)
			})
		})
	};
	b.fn.accordion.defaults = {
		container : !0,
		obj : "ul",
		objClass : ".accordion",
		objID : "",
		wrapper : "li",
		el : "li",
		head : "",
		next : "ul",
		initShow : "",
		expandSub : !0,
		showMethod : "slideDown",
		hideMethod : "slideUp",
		showSpeed : 400,
		hideSpeed : 800,
		scrollSpeed : 600,
		activeLink : !0,
		event : "click",
		focus : !0,
		interval : 400,
		collapsible : !0,
		standardExpansible : !1,
		lastChild : !0,
		shift : !1,
		elToWrap : null,
		uri : "full",
		retFunc : null
	};
	b.fn.slideFadeDown = function (b, a) {
		return this.animate({
			opacity : "show",
			height : "show"
		}, b, function () {
			jQuery.browser.msie && this.style.removeAttribute("filter");
			jQuery.isFunction(a) && a()
		})
	};
	b.fn.slideFadeUp = function (b, a) {
		return this.animate({
			opacity : "hide",
			height : "hide"
		}, b, function () {
			jQuery.browser.msie && this.style.removeAttribute("filter");
			jQuery.isFunction(a) && a()
		})
	}
})(jQuery);
(function (b) {
	b.fn.expandAll = function (d) {
		var a = b.extend({}, b.fn.expandAll.defaults, d);
		return this.each(function () {
			function d(a) {
				for (var c = 0, f = arguments.length; c < f; c++) {
					var e = arguments[c],
					g = b(e);
					if (0 < g.scrollTop())
						return e;
					g.scrollTop(1);
					var h = 0 < g.scrollTop();
					g.scrollTop(0);
					if (h)
						return e
				}
				return []
			}
			var c = b(this),
			e,
			i,
			l,
			f,
			g,
			j;
			"before" == a.switchPosition ? (b.fn.findSibling = b.fn.prev, b.fn.insrt = b.fn.before) : (b.fn.findSibling = b.fn.next, b.fn.insrt = b.fn.after);
			f = this.id.length ? "#" + this.id : this.className.length ? this.tagName.toLowerCase() + "." + this.className.split(" ").join(".") : this.tagName.toLowerCase();
			if (a.ref && c.find(a.ref).length)
				if ("before" == a.switchPosition ? e = c.find("'" + a.ref + ":first'") : e = c.find("'" + a.ref + ":last'"), a.cllpsLength && c.closest(f).find(a.cllpsEl).text().length < a.cllpsLength)
					c.closest(f).find(a.cllpsEl).addClass("dont_touch");
				else {
					"show" == a.initTxt ? (g = a.expTxt, j = "") : (g = a.cllpsTxt, j = "open");
					"hidden" == a.state ? c.find(a.cllpsEl + ":not(.shown, .dont_touch)").hide().findSibling().find("> a.open").removeClass("open").data("state", 0) : c.find(a.cllpsEl).show().findSibling().find("> a").addClass("open").data("state", 1);
					a.oneSwitch ? e.insrt('<p class="switch"><a href="#" class="' + j + '">' + g + "</a></p>") : e.insrt('<p class="switch"><a href="#" class="">' + a.expTxt + '</a>&nbsp;|&nbsp;<a href="#" class="open">' + a.cllpsTxt + "</a></p>");
					e = e.findSibling("p").find("a");
					i = c.closest(f).find(a.cllpsEl).not(".dont_touch");
					l = a.trigger ? c.closest(f).find(a.trigger + " > a") : c.closest(f).find(".expand > a");
					a.child && (c.find(a.cllpsEl + ".shown").show().findSibling().find("> a").addClass("open").text(a.cllpsTxt), window.$vrbls = {
							kt1 : a.expTxt,
							kt2 : a.cllpsTxt
						});
					var k;
					"function" == typeof d ? k = d("html", "body") : k = "html, body";
					e.click(function () {
						var c = b(this),
						d = c.closest(f).find(a.cllpsEl + ":first").offset().top - a.offset;
						if (a.parent) {
							var e = c.parent().nextAll().children("p.switch").find("a");
							kidTxt1 = $vrbls.kt1;
							kidTxt2 = $vrbls.kt2;
							kidTxt = c.text() == a.expTxt ? kidTxt2 : kidTxt1;
							e.text(kidTxt);
							c.text() == a.expTxt ? e.addClass("open") : e.removeClass("open")
						}
						if (c.text() == a.expTxt)
							a.oneSwitch && c.text(a.cllpsTxt).attr("class", "open"), l.addClass("open").data("state", 1), i[a.showMethod](a.speed);
						else {
							a.oneSwitch && c.text(a.expTxt).attr("class", "");
							l.removeClass("open").data("state", 0);
							if (0 == a.speed || a.instantHide)
								i.hide();
							else
								i[a.hideMethod](a.speed);
							a.scroll && d < b(window).scrollTop() && b(k).animate({
								scrollTop : d
							}, 600)
						}
						return !1
					});
					a.localLinks && (c = b(f).find(a.localLinks), c.length && b(c).click(function () {
							var a = b(this.hash),
							a = a.length && a || b("[name=" + this.hash.slice(1) + "]");
							if (a.length)
								return a = a.offset().top, b(k).animate({
									scrollTop : a
								}, 600), !1
						}))
				}
		})
	};
	b.fn.expandAll.defaults = {
		state : "hidden",
		initTxt : "show",
		expTxt : "[Expand All]",
		cllpsTxt : "[Collapse All]",
		oneSwitch : !0,
		ref : ".expand",
		switchPosition : "before",
		scroll : !1,
		offset : 20,
		showMethod : "slideDown",
		hideMethod : "slideUp",
		speed : 600,
		cllpsEl : ".collapse",
		trigger : ".expand",
		localLinks : null,
		parent : !1,
		child : !1,
		cllpsLength : null,
		instantHide : !1
	};
	b.fn.toggler = function (d) {
		var a = b.extend({}, b.fn.toggler.defaults, d),
		h = b(this);
		h.wrapInner('<a style="display:block" href="#" title="Expand/Collapse" />');
		a.initShow && b(a.initShow).addClass("shown");
		h.next(a.cllpsEl + ":not(.shown)").hide();
		return this.each(function () {
			var c;
			a.container ? c = a.container : c = "html";
			h.next("div.shown").length && h.closest(c).find(".shown").show().prev().find("a").addClass("open");
			b(this).click(function () {
				b(this).find("a").toggleClass("open").end().next(a.cllpsEl)[a.method](a.speed);
				return !1
			})
		})
	};
	b.fn.toggler.defaults = {
		cllpsEl : "div.collapse",
		method : "slideToggle",
		speed : "slow",
		container : "",
		initShow : ".shown"
	};
	b.fn.fadeToggle = function (b, a) {
		return this.animate({
			opacity : "toggle"
		}, b, function () {
			jQuery.browser.msie && this.style.removeAttribute("filter");
			jQuery.isFunction(a) && a()
		})
	};
	b.fn.slideFadeToggle = function (b, a, h) {
		return this.animate({
			opacity : "toggle",
			height : "toggle"
		}, b, a, function () {
			jQuery.browser.msie && this.style.removeAttribute("filter");
			jQuery.isFunction(h) && h()
		})
	};
	b.fn.slideFadeDown = function (b, a) {
		return this.animate({
			opacity : "show",
			height : "show"
		}, b, function () {
			jQuery.browser.msie && this.style.removeAttribute("filter");
			jQuery.isFunction(a) && a()
		})
	};
	b.fn.slideFadeUp = function (b, a) {
		return this.animate({
			opacity : "hide",
			height : "hide"
		}, b, function () {
			jQuery.browser.msie && this.style.removeAttribute("filter");
			jQuery.isFunction(a) && a()
		})
	}
})(jQuery);

/*
 * Metadata - jQuery plugin for parsing metadata from elements
 * Copyright (c) 2006 John Resig, Yehuda Katz, Jörn Zaefferer, Paul McLanahan
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */
;
(function (c) {
	c.extend({
		metadata : {
			defaults : {
				type : "class",
				name : "metadata",
				cre : /({.*})/,
				single : "metadata"
			},
			setType : function (b, c) {
				this.defaults.type = b;
				this.defaults.name = c
			},
			get : function (b, f) {
				var d = c.extend({}, this.defaults, f);
				d.single.length || (d.single = "metadata");
				var a = c.data(b, d.single);
				if (a)
					return a;
				a = "{}";
				if ("class" == d.type) {
					var e = d.cre.exec(b.className);
					e && (a = e[1])
				} else if ("elem" == d.type) {
					if (!b.getElementsByTagName)
						return;
					e = b.getElementsByTagName(d.name);
					e.length && (a = c.trim(e[0].innerHTML))
				} else
					void 0 != b.getAttribute && (e = b.getAttribute(d.name)) && (a = e);
				0 > a.indexOf("{") && (a = "{" + a + "}");
				a = eval("(" + a + ")");
				c.data(b, d.single, a);
				return a
			}
		}
	});
	c.fn.metadata = function (b) {
		return c.metadata.get(this[0], b)
	}
})(jQuery);

/*!
 * jQuery Cookie Plugin
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2011, Klaus Hartl
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.opensource.org/licenses/GPL-2.0
 */
;
(function (g) {
	g.cookie = function (h, b, a) {
		if (1 < arguments.length && (!/Object/.test(Object.prototype.toString.call(b)) || null === b || void 0 === b)) {
			a = g.extend({}, a);
			if (null === b || void 0 === b)
				a.expires = -1;
			if ("number" === typeof a.expires) {
				var d = a.expires,
				c = a.expires = new Date;
				c.setDate(c.getDate() + d)
			}
			b = "" + b;
			return document.cookie = [encodeURIComponent(h), "=", a.raw ? b : encodeURIComponent(b), a.expires ? "; expires=" + a.expires.toUTCString() : "", a.path ? "; path=" + a.path : "", a.domain ? "; domain=" + a.domain : "", a.secure ? "; secure" :
				""].join("")
		}
		for (var a = b || {}, d = a.raw ? function (a) {
			return a
		}
			 : decodeURIComponent, c = document.cookie.split("; "), e = 0, f; f = c[e] && c[e].split("="); e++)
			if (d(f[0]) === h)
				return d(f[1] || "");
		return null
	}
})(jQuery);
