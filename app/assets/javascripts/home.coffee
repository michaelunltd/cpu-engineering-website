# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

slider = $(".bxslider").bxSlider({
	auto: true,
	autoControls: true
	captions: true,
	adaptiveHeight: true,
	slideWidth: 1000
})

(($) ->
	$(document).ready ->
		# hide .navbar first
		$('.navbar').hide()

		# fade in .navbar
		$ ->
			$(window).scroll ->
			# set distance user needs to scroll before we fadeIn navbar
				if $(this).scrollTop() > $('.header-img').height() - 50
					$('.navbar').fadeIn()
				else
					$('.navbar').fadeOut()
				return
			return
		return
	return
) jQuery




$("body").css("padding-top", "10px");
