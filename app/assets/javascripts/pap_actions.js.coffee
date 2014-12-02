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

  completePrepColorFetcher()

  $('.pap_action_priority_box').each (index, priority_box) ->
    priorityColorFetcher(priority_box)







priorityColorFetcher = (priority_box) ->
  switch $(priority_box).html()
    when "1"
      $(priority_box).parents("tr").addClass("pap_action_1")
    when "2"
      $(priority_box).parents("tr").addClass("pap_action_2")
    when "3"
      $(priority_box).parents("tr").addClass("pap_action_3")
    when "4"
      $(priority_box).parents("tr").addClass("pap_action_4")
    when "5"
      $(priority_box).parents("tr").addClass("pap_action_5")

completePrepColorFetcher = ->
  $(".check_box_state_of_action:not(:contains('not ready'))")
    .parents(".pap_action_tr")
    .addClass("complete_state")
