# hide the link that opened the form to new.js.erb
# $("#new_project").remove();

# $("#projects_new_link").hide().after("<%= j (render 'form') %>");
# $('.bottom_saver').on( "click", saveButtonsTopAndBottom  )

# jQuery ->
#   $("#new_action_form_submit").on( "click", showPapActionForm )

# showPapActionForm = (event) ->
#   event.preventDefault();
#   console.log "in the showPapActionForm function" 
#   $.ajax(
#     type: "POST"
#     url: $("#new_pap_action").attr("action")
#     data: $("#new_pap_action").serialize()
#   ).success((data) -> 
#     console.log "in the 'success' showPapActionForm fucntion"
#     console.log "The action statement is: '" + data.action_statement + "'  on action.id: '" + data.id + "'  on action.step: '" + data.step

#     # $('#pap_actions_table_list tbody').append('<tr id="project_<%= @pap_action.id  %>">'+'<%= j render partial: "pap_action_table_row", locals: {pap_action: @pap_action} %>'+'</tr>');

#     # $("#new_pap_action").trigger("reset")

#   ).error( ->
#     console.log "in the 'failure' showPapActionForm  callback function"
#   ).done( ->
#     console.log "in the 'done' showPapActionForm  function"
#   )







