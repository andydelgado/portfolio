class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
    @project = Project.new(params.require(:project).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Your project is now live.' }
      else
        format.html { render :new }
      end
    end
	end	

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update(params.require(:project).permit(:title, :subtitle, :body))
        format.html { redirect_to projects_path, notice: "The project was sucessfully updated."}
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was removed."}
    end
  end
end
