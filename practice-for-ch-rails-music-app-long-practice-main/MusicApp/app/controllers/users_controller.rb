class UsersController < ApplicationController
    def create 
        @user = User.new(user_params)
        if @user.save! 
            redirect_to user_url
        else 
            render :new 
        end 
    end 

    def new
        render :new 
    end

    def destroy
        @user = User.find(params[:id])
        @user.delete! 
    end 

    def show 
        @user = User.find_by(params[:id])
        render :show 
    end 


    private 

    def user_params
        params.require(:user).permit(:username,:email)
    end 

end
