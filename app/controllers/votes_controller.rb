class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @voteable = find_voteable
    @vote = @voteable.votes.build(params[:vote].merge(:user_id => current_user.id))
    if @vote.save
      flash[:notice] = "Vote registerd"
    else
      flash[:error] = "You already spent your last vote"
    end
    
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end
  end

  def update
    @vote = Vote.find(params[:id])
    if @vote.update_attributes(params[:vote])
      flash[:notice] = 'Vote updated'
      redirect_to @vote.owner
    else
      flash[:error] = 'You are missing certain permissions for voting'
    end
  end

  def find_voteable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
