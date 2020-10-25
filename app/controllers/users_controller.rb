class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@cafes = @user.cafes.page(params[:page]).per(3)
	end

	def edit
		@user = User.find(params[:id])
	end 

	def update
		@user = User.find(params[:id])
       if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path
        else
        flash[:notice] = "errors prohibited this obj from being saved:"
        render :edit
    	end
	end
	
	private

	def user_params
        params.require(:user).permit(:name, :nickname, :email, :profile_image, :is_deleted)
    end
end
