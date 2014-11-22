class PapActionsController < ApplicationController

  # GET /pap_actions
  # GET /pap_actions.json
  def index
    current_project
    all_project_actions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pap_actions }
    end
  end

  # GET /pap_actions/new
  # GET /pap_actions/new.json
  def new
    current_project
    new_project_action

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pap_action }
    end
  end

  # GET /pap_actions/1/edit
  def edit
    current_project
    set_project_action
  end

  # POST /pap_actions
  # POST /pap_actions.json
  def create

    current_project
    new_project_action

    respond_to do |format|
      if @pap_action.save
        format.html { redirect_to project_pap_actions_path, notice: 'Pap action was successfully created.' }
        format.json { render json: @pap_action, status: :created, location: [@project, @pap_action] }
      else
        format.html { render action: "new" }
        format.json { render json: @pap_action.errors, status: :unprocessable_entity }
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
        format.html { redirect_to project_pap_actions_path, notice: 'Pap action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pap_action.errors, status: :unprocessable_entity }
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
      format.html { redirect_to project_pap_actions_url }
      format.json { head :no_content }
    end
  end

  private
    def current_project
      @project = current_user.projects.find(params[:project_id])
    end

    def all_project_actions
      @pap_actions = @project.pap_actions.all
    end

    def new_project_action
      @pap_action = @project.pap_actions.new(params[:pap_action])
    end

    def set_project_action
      @pap_action = @project.pap_actions.find(params[:id])
    end

    # update and use this #=> strong params are not not for rails 3.2, need rails 4, these are how you white-list params
    # def action_params
      # params.require(:pap_action).permit(:acting_person, :acting_person_title, :action_statement, :description, :position, :priority, :state_of_action)
    # end
end
