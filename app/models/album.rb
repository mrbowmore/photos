class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :user
  
  validates_presence_of :user
  
  def has_access?(user)
    return false if user.nil?
    self.user == user || user.is_admin?
  end
end
