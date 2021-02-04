class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_project, only: [:show, :edit, :update, :destroy]
    before_action :check_ownership, only: [:edit, :update, :destroy]

    def index 
        @projects = Project.all
        @categories = Categorie.all
        if params[:search].blank?  
            
        else  
            @parameter = params[:search].downcase  
            @projects = Project.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
        end

        if params[:search_by_budget] && params[:search_by_budget] != ""
            @parameter = params[:search_by_budget].to_i
            @projects = @projects.where("budget <= :search_by_budget", search_by_budget: @parameter)
            puts params[:search_by_budget].to_i.inspect
        end

        if params[:search_by_category] && params[:search_by_category] != ""
            @parameter = params[:search_by_category]
            @projects = @projects.where("categorie_id LIKE :search_by_budget", search_by_budget: @parameter)
            puts params[:search_by_category].to_i.inspect
        end
        @counted = @projects.count
    end

    def show
    end

    def new
        @project = Project.new
    end

    def edit
        
    end

    def create
        
        @categories = Categorie.all
        @project = current_user.projects.new(project_params)
        
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


    def search       
        
    end

    private

    def project_params
        params.require(:project).permit(:name, :budget, :phone, :categorie_id, :description, :statut, :payed)
    end

    def find_project
        @project = Project.find(params[:id])
    end

    def check_ownership
        unless current_user.admin == true
            if current_user.id != @project.user_id
                flash[:alert] = "You didn't create this project !"
                redirect_to projects_path
            end
        end
    end

end