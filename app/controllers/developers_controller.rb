class DevelopersController < ApplicationController
    before_action :authenticate_user!

    def new
        @developer = Developer.new
    end

    def index
        @developers = Developer.all
        @users = User.all
    end

    def create
        @developer = current_user.developers.new(developer_params)
    
        if @developer.save
            #flash[:notice] = "Project created"
            
            current_user[:developer_request] = true
            @current_user.save
            puts current_user.developer_request
            redirect_to new_developer_path
        else
            render :new
        end
    end

    def accept
        foo = params[:foo_param]
        user = User.find(foo)
        user[:developer_confirm] = true
        user.save
        redirect_to developers_path
    end


    private

    def developer_params
        params.require(:developer).permit(:motivation)
    end


      


end