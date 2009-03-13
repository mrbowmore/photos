class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    
    if @comment.save
      flash[:notice] = "Your comment was saved"
    else
      flash[:error] = @comment.errors.full_messages.join(". ")
    end
    redirect_to request.referer
  end

  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Your comment was updated"
    else
      flash[:error] = @comment.errors.full_messages.join(". ")
    end
    redirect_to @comment.owner
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
end
