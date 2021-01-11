class CommentsController < ApplicationController

  def create
    comment = current_user.comments.create(memo: params[:memo])
    render json:{post: comment}
  end
  
end
