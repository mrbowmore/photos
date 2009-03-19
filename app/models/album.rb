class Album < ActiveRecord::Base
  has_many :photos, :order => "position"
  belongs_to :user
  
  validates_presence_of :user
  validates_uniqueness_of :title
  attr_accessible :title, :user_id, :user
  
  def has_access?(user)
    return false if user.nil?
    self.user == user || user.is_admin?
  end
end
