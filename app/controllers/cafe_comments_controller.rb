class CafeCommentsController < ApplicationController
	def create
		cafe = Cafe.find(params[:cafe_id])
    	comment = current_user.cafe_comments.new(cafe_comment_params)
    	comment.cafe_id = cafe.id
    	comment.score = Language.get_data(cafe_comment_params[:comment])
    	#自然言語処理、感情分析を使用するための記述
    	comment.save
    	redirect_to cafe_path(cafe)
	end

	def destroy
		cafe = Cafe.find(params[:cafe_id])
		comment = CafeComment.find(params[:id])
		comment.destroy
    	redirect_to cafe_path(cafe)
	end

	private
	def cafe_comment_params
	  params.require(:cafe_comment).permit(:comment)
	end

end
