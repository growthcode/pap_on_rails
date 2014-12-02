class PapActionsController < ApplicationController

  # GET /pap_actions
  # GET /pap_actions.json
  def index
    current_project
    all_project_actions
    new_project_action

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /pap_actions/new
  # GET /pap_actions/new.json
  def new
    current_project
    new_project_action

    respond_to do |format|
      format.js
    end
  end

  # GET /pap_actions/1/edit
  def edit
    current_project
    set_project_action
    
    respond_to do |format|
      format.js # edit.js.erb 
    end
  end

  # POST /pap_actions
  # POST /pap_actions.json
  def create
    current_project
    new_project_action
    total_pap_actions = @project.pap_actions.all.length
    @pap_action.position = total_pap_actions + 1
    respond_to do |format|
      if @pap_action.save
        format.js
      else
        format.js { render action: "new" }
      end
    end
  end

  # PUT /pap_actions/1
  # PUT /pap_actions/1.json
  def update
    current_project
    set_project_action

    respond_to do |format|
      if @pap_action.update_attributes(params[:pap_action])
        format.js
        puts "==========================================="
        puts @pap_action.state_of_action
        puts "==========================================="
      else
        format.js { render action: "edit" }
      end
    end
  end

  # DELETE /pap_actions/1
  # DELETE /pap_actions/1.json
  def destroy
    current_project
    set_project_action

    @pap_action.destroy

    respond_to do |format|
      format.js
    end
  end

  def sort
    params[:pap_action].each_with_index do |id, index|
      PapAction.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  private
    def current_project
      @project = current_user.projects.find(params[:project_id])
    end

    def all_project_actions
      @pap_actions = @project.pap_actions.order("position")
    end

    def new_project_action
      @pap_action = @project.pap_actions.new(params[:pap_action])
      @pap_action.priority = @pap_action.priority.to_i
    end

    def set_project_action
      @pap_action = @project.pap_actions.find(params[:id])
      @pap_action.priority = @pap_action.priority.to_i
    end

    # update and use this #=> strong params are not not for rails 3.2, need rails 4, these are how you white-list params
    # def action_params
      # params.require(:pap_action).permit(:acting_person, :acting_person_title, :action_statement, :description, :position, :priority, :state_of_action)
    # end
end
