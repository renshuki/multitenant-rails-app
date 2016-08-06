class ProjectsController < ApplicationController
  def index
    @projects = Project.all    
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(projects_params)
    if @project.save
      redirect_to projects_path, notice: "Project created!"
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(projects_params)
      redirect_to projects_path, notice: "Project updated!"
    else
      render :edit
    end
  end

  private

  def projects_params
    params.require(:project).permit(:name, :client, :archived)    
  end
end