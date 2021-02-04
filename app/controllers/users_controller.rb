class UsersController < ApplicationController
    def new

    end

    def create
        user_params = {"username"=>"username", "email"=>"email", "password"=>"[FILTERED]"}

        @user = User.new(user_params)

        if @user.save
            redirect_to_new_user_path
        else
            render :new

        end
    end

end
