# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
hideAndSeek = (variable) ->
  if $('input#user_role_department_head').is(':checked')
    variable.appendTo('#form_body')
    variable.css('display', 'block')
    variable = null
  else
    $('#department_form').fadeOut('fast', ->
      variable = $(this).detach()
    )

$( ->
  variable = $('#department_form')
  hideAndSeek variable
  $('input[type="radio"]').change( ->
    hideAndSeek variable
  )
)
