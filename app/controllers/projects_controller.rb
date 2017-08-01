class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :sort
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  layout 'project'
  access all: [:show, :index, :react], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
  
	def index
		@projects = Project.by_position
	end

  def sort
    params[:order].each do |key, value|
      Project.find(value[:id]).update(position: value[:position])
    end

    head :ok
  end

  def react
    @react_projects = Project.react
  end

	def new
		@project = Project.new
    3.times { @project.technologies.build }
	end

	def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Your project is now live.' }
      else
        format.html { render :new }
      end
    end
	end	

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: "The project was sucessfully updated."}
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was removed."}
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, 
                                    :subtitle, 
                                    :body,
                                    :main_image,
                                    :thumb_image, 
                                    technologies_attributes: [:name]
                                    )
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
