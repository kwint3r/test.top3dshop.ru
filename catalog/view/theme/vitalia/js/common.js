$(document).ready(function() {
    $("#feedback-form").unbind('submit').bind('submit', function(){
        $.ajax({
            url: $(this).attr('action'),
            type: "POST",
            dataType: "JSON",
            data: $(this).serialize(),
            success: function(data){
                if (data.success){
                    alert(data.output);
                    //$("#feedback-form").html(data.output);
                }else{
                    //$("#feedback-form .feedback-error").html(data.output);
                    $("#feedback-form .g_recaptcha > div > div")
                        .css("border","2px solid red")
                        .css("margin-top","84px")
                        .css("height","80px")
                        .css("width","306px");
                }
            },
            error: function(data){
                alert(data.responseText);
            }
        });
        return false;
    });

	/* Search */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $('header input[name=\'search\']').val();
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('header input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('header input[name=\'search\']').val();
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	$(window).scroll(function(){
		if ($(this).scrollTop() > 300) {
	    	$('.scrollup').fadeIn();
	    } else {
			$('.scrollup').fadeOut();
		}
	}); 
	
	$('.scrollup').click(function(){
		$("html, body").animate({ scrollTop: 0 }, 600);
		return false;
	});
	
	/* Search MegaMenu */
	$('.button-search2').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $('.container-megamenu input[name=\'search2\']').val();
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('.container-megamenu input[name=\'search2\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('.container-megamenu input[name=\'search2\']').val();
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	/* Quatity buttons */
	
	$('#q_up').click(function(){
		var q_val_up=parseInt($("input#quantity_wanted").val());
		if(isNaN(q_val_up)) {
			q_val_up=0;
		}
		$("input#quantity_wanted").val(q_val_up+1).keyup(); 
		return false; 
	});
	
	$('#q_down').click(function(){
		var q_val_up=parseInt($("input#quantity_wanted").val());
		if(isNaN(q_val_up)) {
			q_val_up=0;
		}
		
		if(q_val_up>1) {
			$("input#quantity_wanted").val(q_val_up-1).keyup();
		} 
		return false; 
	});





    //link_demonstration
    $('body').on('click','.link_demonstration', function(e) {
        e.preventDefault();
        $.fancybox(
            $('.form_demonstration'),
            {
                'autoDimensions'	: false,
                'width'         		: 700,
                'height'        		: 'auto',
                'transitionIn'		: 'none',
                'transitionOut'		: 'none'
            }
        );

    });

    $('body').on('click','.link_demonstration_send', function(e) {
        e.preventDefault();


        var	intRegex = /[0-9 -()+]+$/;
        var name = $('#demonstration_name');
        var phone = $('#demonstration_phone');
        var err = 0;

        name.css('border-color', '#e5e5e5');
        phone.css('border-color', '#e5e5e5');

        if (name.val().trim().length < 2)
        {
            name.css('border-color', 'red');
            err = 1;
        }
        if (phone.val().trim().length < 5 || !intRegex.test(phone.val().trim()))
        {
            phone.css('border-color', 'red');
            err = 1;
        }
        if (err)
        {
            return false;
        }
        $.ajax({
            url: 'index.php?route=module/demonstration/send',
            type: 'post',
            data: $('form#demonstration').serialize(),
            dataType: 'html',
            success: function(html) {
                $('.form_demonstration').html(html);
            }
        });
    });



});
function updateUserTime()
{
    $.ajax({
        url: 'index.php?route=account/basket_push/update',
        type: 'get',
        dataType: 'html',
        success: function(html) {
            console.log('send ok');
        }
    });
}




function getURLVar(key) {
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

function addToCart(product_id, quantity, img) {
	
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;
	
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {			
			if (json['redirect']) {
				location = json['redirect'];
			}
			if (json['success']) {
                var pixels_per_second = 50;
                distance = Math.abs($(document.body).scrollTop( ) - $('#'+img).offset( ).top);
                scroll_duration = (distance / pixels_per_second) * 1000;
                scroll_duration = $('#'+img).offset( ).top+$('#'+img).offset( ).top*0.2;
				$('html, body').animate({
				        scrollTop: $("#"+product_id).offset().top
				    }, 500);
				setTimeout(function(){ }, 500);
				$('#'+img)
				  .clone()
				  .css({'position' : 'absolute', 'z-index' : '11100', 
				  	top: $('#'+img).offset().top+300, 
				  	left:$('#'+img).offset().left, 
				  	width:150, height:150})
				  .appendTo("body")
				  .animate({opacity: 0.05,
					left: $("#cart_block").offset()['left'],
					top: $("#cart_block").offset()['top'],
					width: 20}, scroll_duration, function() {
					$(this).remove();
				});				

				/*$.colorbox({
					html: '<div class="clearfix" style="padding: 15px 30px 15px 30px">' + json['success'] + '<div class="success-checkout"><a href="' + checkout_url + '">' + checkout_text + '</a></div> <div class="success-or">или</div> <div class="success-continue"><a href="#" onclick="$.colorbox.close();">' + continue_shopping_text + '</a></div>',
					fastIframe:false,
					scrolling:false,
					initialWidth:false,
					innerWidth:false,
					maxWidth:false,
					height:false,
					initialHeight:false,
					innerHeight:false,
					onComplete:function () {
						$(this).colorbox.resize();
					}
				});*/
				$('[name="vkredit"]').attr('name', 'money');
				$('#cart_block').load('index.php?route=module/cart #cart_block > *');
			}	
		}
	});
}

function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {						
			if (json['success']) {
			
            $.colorbox({
                html: '<div class="clearfix" style="padding: 15px 30px 15px 30px">' + json['success'] + '</div>',
                fastIframe:false,
                scrolling: false,
                initialWidth:false,
                innerWidth:false,
                maxWidth:false,
                height:false,
                initialHeight:false,
                innerHeight:false,
                onComplete:function () {
                    $(this).colorbox.resize()
                }
				
            });
			
				$('#wishlist-total').html(json['total']);
				
			}	
		}
	});
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {						
			if (json['success']) {
            $.colorbox({
                html: '<div class="clearfix" style="padding: 15px 30px 15px 30px">' + json['success'] + '<br /><div class="success-checkout"><a href="/compare-products/">Сравнить</a></div></div>',
                fastIframe:false,
                scrolling:false,
                initialWidth:false,
                innerWidth:false,
                maxWidth:false,
                height:false,
                initialHeight:false,
                innerHeight:false,
                onComplete:function () {
                    $(this).colorbox.resize()
                }
            });
				$('#compare-total').html(json['total']);
			}	
		}
	});
}
function addToVkredit(product_id, quantity, img) {

	quantity = typeof(quantity) != 'undefined' ? quantity : 1;
	
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity + '&vkredit=1',
		dataType: 'json',
		success: function(json) {			
			if (json['redirect']) {
				location = json['redirect'];
			}
			if (json['success']) {
				
                var pixels_per_second = 50;
                distance = Math.abs($(document.body).scrollTop( ) - $('#'+img).offset( ).top);
                scroll_duration = (distance / pixels_per_second) * 1000;
                scroll_duration = $('#'+img).offset( ).top+$('#'+img).offset( ).top*0.2;
				$('html, body').animate({
				        scrollTop: $("#"+product_id).offset().top
				    }, 500);
				setTimeout(function(){ }, 500);
				$('#'+img)
				  .clone()
				  .css({'position' : 'absolute', 'z-index' : '11100', 
				  	top: $('#'+img).offset().top+300, 
				  	left:$('#'+img).offset().left, 
				  	width:150, height:150})
				  .appendTo("body")
				  .animate({opacity: 0.05,
					left: $("#cart_block").offset()['left'],
					top: $("#cart_block").offset()['top'],
					width: 20}, scroll_duration, function() {
					$(this).remove();
				});				


				/*$.colorbox({
					html: '<div class="clearfix" style="padding: 15px 30px 15px 30px">' + json['success'] + '<div class="success-checkout"><a href="' + checkout_url + '">' + checkout_text + '</a></div> <div class="success-or">или</div> <div class="success-continue"><a href="#" onclick="$.colorbox.close();">' + continue_shopping_text + '</a></div>',
					fastIframe:false,
					scrolling:false,
					initialWidth:false,
					innerWidth:false,
					maxWidth:false,
					height:false,
					initialHeight:false,
					innerHeight:false,
					onComplete:function () {
						$(this).colorbox.resize();
					}
				});*/
				
				$('#cart_block').load('index.php?route=module/cart #cart_block > *');
			}	
		}
	});
}