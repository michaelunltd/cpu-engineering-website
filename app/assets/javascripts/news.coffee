# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
slider = $(".bxslider").bxSlider({
	auto: true,
	autoControls: true
	captions: true,
	adaptiveHeight: true,
	slideWidth: 1000
});
readURL = (input) ->
  if input.files and input.files[0]
    reader = new FileReader

    reader.onload = (e) ->
      $('#img_prev').attr('src', e.target.result).width(200).height 200
      return

    reader.readAsDataURL input.files[0]
  return
