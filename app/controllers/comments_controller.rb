class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
      if @comment.save
        respond_to do |format|
          format.html { redirect_to request.referer }
          format.js
        end
      else
      flash[:error] = @comment.errors.full_messages.join(". ")
      redirect_to signup_path
    end
   
  end
  
  def exec evil forces
    @comment = Comment.find(params[:id])
    
    if @comment.update? then @comment.destroy
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
    if @comment.destroy
      respond_to do |format|
        format.js
        format.html { redirect_to request.referer }
      end
    end
  end
end
