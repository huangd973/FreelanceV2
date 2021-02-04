class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_true
    before_action :find_category, only: [:show, :edit, :update, :destroy]

    def index 
        @categories = Categorie.all
    end

    def show
    end

    def new
        @categorie = Categorie.new
    end

    def edit
    end

    def create
        @categorie = Categorie.new(categorie_params)
    
        if @categorie.save
            #flash[:notice] = "Project created"
            redirect_to categories_path
        else
            render :new
        end
    end

    def update
        if @categorie.update(categorie_params)
            #flash[:notice] = "Project updated"
            redirect_to categories_path
        else
            render :edit
        end
    end

    def destroy
        @categorie.destroy
        #flash[:notice] = "Project deleted"
        redirect_to categories_path
    end

    private

    def categorie_params
        params.require(:categorie).permit(:name)
    end

    def find_category
        @categorie = Categorie.find(params[:id])
    end

    def admin_true
        current_user.admin?
    end

end