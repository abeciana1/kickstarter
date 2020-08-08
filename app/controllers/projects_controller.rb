class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(project_params)
        redirect_to project_path(@project)
    end

    def show
        @project = find_project
    end

    def edit
        @project = find_project
    end

    def update
        @project = find_project
        @project.update(project_params)
        redirect_to project_path(@project)
    end

    def destroy
        @project = find_project
        @project.destroy

        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:name, :description, :goal)
    end

    def find_project
        Project.find(params[:id])
    end
end
