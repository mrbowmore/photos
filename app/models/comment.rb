class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, :polymorphic => true
  
  validates_presence_of :user, :owner
  
end
