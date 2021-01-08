class CommentsController < ApplicationController
  
  # 消しても問題なければ削除する
  # def index
  #   @comments = Comment.all.order(id: "DESC")
  # end


  def create
    comment = current_user.comments.create(memo: params[:memo])
    render json:{post: comment}
  end

  private

  # def comment_params
  #   # params.require(:comment).permit(:memo).merge(user_id: current_user.id)
  # end
end
