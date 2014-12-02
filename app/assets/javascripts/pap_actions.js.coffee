# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# table sortable
jQuery ->
  $('#pap_action_table_sortable').sortable
    revert: true
    update: ->
      console.log("in the sortable function")
      $.post($(this).data('sort-url'), $(this).sortable('serialize'))
      .success (data) -> 
        console.log("in the 'success' function")
        $('table tr').each -> 
          $(this).children('td:last-child').html($(this).index() + 1)
      .error ->
        console.log("in the 'failure' callback function")
      .done -> 
        console.log("in the 'done' function")
  $('.pap_action_priority_box').each ->
  # # # the below doesn't work as a named function... can't figure out why... calls it undefined is not a function
  # # # something to do with binding 'this'
  #   papActionPriorityColorFetcher()
  # papActionPriorityColorFetcher = ->
    switch $(this).html()
      when "1"
        $(this).addClass("pap_action_1")
      when "2"
        $(this).addClass("pap_action_2")
      when "3"
        $(this).addClass("pap_action_3")
      when "4"
        $(this).addClass("pap_action_4")
      when "5"
        $(this).addClass("pap_action_5")
