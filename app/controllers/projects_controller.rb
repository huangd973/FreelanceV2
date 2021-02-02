class ProjectsController < ApplicationController

    before_action :find_project, only: [:show, :edit, :update, :destroy]
    def index 
        @projects = Project.all
    end

    def show
    end

    def new
        @project = Project.new
    end

    def edit
    end

    def create
        @project = projects.new(project_params)
        if @project.save
            #flash[:notice] = "Project created"
            redirect_to projects_path
        else
            render :new
        end
    end

    def update
        if @project.update(project_params)
            #flash[:notice] = "Project updated"
            redirect_to projects_path
        else
            render :edit
        end
    end

    def destroy
        @project.destroy
        #flash[:notice] = "Project deleted"
        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:name, :created_by, :email, :category_id, :description, :budget, :published_at, :payee)
    end

    def find_project
        @project = Project.find(params[:id])
    end

end