class VotesController < ApplicationController
  
  def new
    @vote = Vote.new
  end
  
  def create
    @vote = Vote.new(params[:vote])
    @vote.user = User.find(current_user)
    @vote.comment = Comment.find(params[:comment_id])
    if @vote.save
      flash[:notice] = "Your vote has been saved!"
    else
      flash[:error] = "You already spent your last vote"
      redirect_to @vote.owner
    end
  end
  
  def update
    @vote = Vote.find(params[:id])
      
      if @vote.update_attributes(params[:vote])
        flash[:notice] = 'Vote updated'
        redirect_to @vote.owner
      else
        flash[:error] = 'You are missing cetain permissions for voting'
      end
    end
end
