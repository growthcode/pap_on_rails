class ProjectsController < ApplicationController


  def testAjax
    @project = current_user.projects.find(1)

    respond_to do |format|
      # format.html # index.html.erb
      format.json { render json: @project }
    end
  end





  # GET /projects
  # GET /projects.json
  def index
    all_current_user_projects

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end    
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = current_user.projects.new(weak_project_params)

    respond_to do |format|
      format.html # new.html.erb
      format.js # need the new.js.erb 
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    set_projects

    respond_to do |format|
      format.html # edit.html.erb
      format.js # need the new.js.erb 
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(weak_project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.js 
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.js { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    set_projects


    respond_to do |format|
      if @project.update_attributes(weak_project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.js { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    set_projects

    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
      format.json { head :no_content }
    end
  end

  private
    def all_current_user_projects
      @projects = current_user.projects.all
    end

    def set_projects
      @project = current_user.projects.find(params[:id])
    end

    # weak params, update these to below strong params when on rails 4
    # these allow any updates to params and strong params are white listed
    def weak_project_params
      params[:project]
    end

    # strong params are not not for rails 3.2, need rails 4, these are how you white-list params
    # def project_params
    #   params.require(:project).permit(:project_name)
    # end
end
