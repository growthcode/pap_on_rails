class ProjectsController < ApplicationController

  # GET /projects
  def index
    all_projects_object

    respond_to do |format|
      format.html # index.html.erb
    end    
  end

  # GET /projects/new
  def new
    new_project_object

    respond_to do |format|
      format.js # new.js.erb 
    end
  end

  # GET /projects/1/edit
  def edit
    set_projects

    respond_to do |format|
      format.js # edit.js.erb 
    end
  end

  # POST /projects
  def create
    new_project_object

    respond_to do |format|
      if @project.save
        format.js # create.js.erb 
      else
        format.js { render action: "new" }
      end
    end
  end

  # PUT /projects/1
  def update
    set_projects


    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.js # update.js.erb 
      else
        format.js { render action: "edit" }
      end
    end
  end

  # DELETE /projects/1
  def destroy
    set_projects

    @project.destroy

    respond_to do |format|
      format.js # destroy.js.erb 
    end
  end

  private
    def all_projects_object
      @projects = current_user.projects.all
    end

    def set_projects
      @project = current_user.projects.find(params[:id])
    end

    def new_project_object
      @project = current_user.projects.new(params[:project])
    end

    # strong params are not not for rails 3.2, need rails 4, these are how you white-list params
    # def project_params
    #   params.require(:project).permit(:project_name)
    # end
end
