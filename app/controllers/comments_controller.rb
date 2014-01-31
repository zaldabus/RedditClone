class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.link_id = params[:link_id]
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to link_url(@comment.link)
    else
      flash[:errors] = ["Bad comment"]
      redirect_to link_url(params[:link_id])
    end
  end
end
