# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


# =============== Sandbox page start ================


paintIt = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor
 
$ ->
  $("a[data-background-color]").click (e) ->
    e.preventDefault()
 
    backgroundColor = $(this).data("background-color")
    textColor = $(this).data("text-color")
    paintIt(this, backgroundColor, textColor)


# jQuery(function($) {
  # $("#sandbox").on('ajax:success', function(event,data,status, xhr) {
  #     $(this).css("background-color", "red")
  #   });
# });
# 
# 
jQuery ($) ->
  $("#sandbox").on "ajax:success", (event, data, status, xhr) ->
    $(this).css "background-color", "red"




# =============== Sandbox page end ================
