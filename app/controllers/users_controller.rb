class UsersController < ApplicationController
    def new
         @user = User.new
    end

    def create
        whitelisted_params = {:username=>"username", :email=>"email", :password=>"[FILTERED]"} 

        @user = User.new(whitelisted_params)

        if @user.save
            redirect_to_new_user_path
        else
            render :new
        end
    
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(whitelisted_params)
            redirect_to  '/'
        else
            render 'edit'
        end
    end

    private

    def whitelisted_params
        params.require(:user).permit(:username, :email, :password)
    end

end
