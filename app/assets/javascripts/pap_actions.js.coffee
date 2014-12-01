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
