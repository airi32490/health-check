class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order(id: "DESC")
  end

  def create
    Comment.create(memo: params[:memo]).merge(user_id: current_user.id)
    redirect_to :index
  end
end
