class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, :polymorphic => true

  validates_uniqueness_of :user_id, :scope => :comment_id
  validates_numericality_of :grade, :less_than_or_equal_to => 5, :more_than_or_equal_to => -5
  validates_presence_of :user, :owner, :grade
  
  def has_access?(user)
    return false if user.nil?
    self.user == user || user.is_admin?
  end

end
