class CafesController < ApplicationController

	def new
		@user = current_user
		@cafe = Cafe.new
	end

	def create
		@cafe = Cafe.new(cafe_params)
		
		#自然言語処理、感情分析を使用するための記述
		@user = current_user
		@cafe.user_id = current_user.id
		if @cafe.save
        	flash[:success] = "登録に成功しました"
        	redirect_to cafe_path(@cafe.id)
        else
         	flash[:warning] = "入力内容を確認してください"
         	render :new
        end
	end

	def index
		@user = current_user
		@cafes = params[:tag_id].present? ? Tag.find(params[:tag_id]).cafes.page(params[:page]).per(3) : Cafe.page(params[:page]).per(3)
	end

	def show
		@user = current_user
		@cafe = Cafe.find(params[:id])
		@cafe_comment = CafeComment.new
	end

	def edit 
		@user = current_user
		@cafe = Cafe.find(params[:id])
	end

	def update
		@user = current_user
		@cafe = Cafe.find(params[:id])
		if @cafe.update(cafe_params)
		flash[:notice] = "編集に成功しました"
		redirect_to cafe_path(@cafe.id)
		else
         flash[:warning] = "入力内容を確認してください"
         render :edit
		end
	end

	def destroy
		@cafe = Cafe.find(params[:id])
		@cafe.destroy
		redirect_to cafes_path
	end

	private

  	def cafe_params
  		params.require(:cafe).permit(:shop_name, :impression, :user_id, :review, :address, :latitude, :longitude, tag_ids: [])
  	end

	def user_params
        params.require(:user).permit(:name, :nickname, :email, :profile_image, :is_deleted)
    end
	
end
