class TopController < ApplicationController
	def index
	end 

	def new_guest
		user = User.find_or_create_by!(email: 'guest@example.com', nickname: "ゲストユーザー") do |user|
    	user.password = SecureRandom.urlsafe_base64
    	end
    	#ゲストユーザーがなければ作成し、パスワードもランダムに設定

    	sign_in user
    	redirect_to cafes_path, notice: "ゲストユーザーとしてログインしました。"
    end
end
