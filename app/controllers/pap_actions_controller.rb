class PapActionsController < ApplicationController

  # GET /pap_actions
  # GET /pap_actions.json
  def index
    @project = current_user.projects.find(params[:project_id])
    @pap_actions = @project.pap_actions.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pap_actions }
    end
  end

  # GET /pap_actions/new
  # GET /pap_actions/new.json
  def new
    @project = current_user.projects.find(params[:project_id])
    @pap_action = @project.pap_actions.new(params[:pap_action])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pap_action }
    end
  end

  # GET /pap_actions/1/edit
  def edit
    @project = current_user.projects.find(params[:project_id])
    @pap_action = @project.pap_actions.find(params[:id])
  end

  # POST /pap_actions
  # POST /pap_actions.json
  def create

    @project = current_user.projects.find(params[:project_id])
    @pap_action = @project.pap_actions.new(params[:pap_action])

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
    @project = current_user.projects.find(params[:project_id])
    @pap_action = @project.pap_actions.find(params[:id])

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
    @project = current_user.projects.find(params[:project_id])
    @pap_action = @project.pap_actions.find(params[:id])
    @pap_action.destroy

    respond_to do |format|
      format.html { redirect_to project_pap_actions_url }
      format.json { head :no_content }
    end
  end


end
