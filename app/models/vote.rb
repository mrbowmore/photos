class Vote < ActiveRecord::Base
  belongs_to :voteable, :polymorphic => true
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => [:voteable_id, :voteable_type]
  validates_numericality_of :grade, :less_than_or_equal_to => 5, :more_than_or_equal_to => -5
  validates_presence_of :user, :grade
  
  def has_access?(user)
    return false if user.nil?
    self.user == user || user.is_admin?
  end
  
  def vote_count
    @votesum = grade.count(:votable_id)
  end

end
