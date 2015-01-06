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

    $(".pagination li")



pap_action_view_through_toggle = (priority_buttons) ->
switch $(priority_buttons)
  when $("#pap_action_view_through_1")
    $("#pap_action_view_through_1").addClass("active")
    $("#pap_action_view_through_2").removeClass("active")
    $("#pap_action_view_through_3").removeClass("active")
    $("#pap_action_view_through_4").removeClass("active")
    $("#pap_action_view_through_5").removeClass("active")
  when $("#pap_action_view_through_1")
    $("#pap_action_view_through_1").addClass("active")
    $("#pap_action_view_through_2").removeClass("active")
    $("#pap_action_view_through_3").removeClass("active")
    $("#pap_action_view_through_4").removeClass("active")
    $("#pap_action_view_through_5").removeClass("active")
  when $("#pap_action_view_through_2")
    $("#pap_action_view_through_1").addClass("active")
    $("#pap_action_view_through_2").addClass("active")
    $("#pap_action_view_through_3").removeClass("active")
    $("#pap_action_view_through_4").removeClass("active")
    $("#pap_action_view_through_5").removeClass("active")
  when $("#pap_action_view_through_3")
    $("#pap_action_view_through_1").addClass("active")
    $("#pap_action_view_through_2").addClass("active")
    $("#pap_action_view_through_3").addClass("active")
    $("#pap_action_view_through_4").removeClass("active")
    $("#pap_action_view_through_5").removeClass("active")
  when $("#pap_action_view_through_4")
    $("#pap_action_view_through_1").addClass("active")
    $("#pap_action_view_through_2").addClass("active")
    $("#pap_action_view_through_3").addClass("active")
    $("#pap_action_view_through_4").addClass("active")
    $("#pap_action_view_through_5").removeClass("active")
  when $("#pap_action_view_through_5")
    $("#pap_action_view_through_1").addClass("active")
    $("#pap_action_view_through_2").addClass("active")
    $("#pap_action_view_through_3").addClass("active")
    $("#pap_action_view_through_4").addClass("active")
    $("#pap_action_view_through_5").addClass("active")

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
