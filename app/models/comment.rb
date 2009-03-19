class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, :polymorphic => true

  has_many :votes, :as => :owner

  validates_presence_of :user, :owner, :body

  def has_access?(user)
    return false if user.nil?
    self.user == user || user.is_admin?
  end

end
