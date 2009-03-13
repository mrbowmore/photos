class Photo < ActiveRecord::Base
  belongs_to :album
  has_many :comments, :as => :owner
  acts_as_list :scope => :album
  delegate :user, :to => :album
  
  attr_accessible :title, :user_id, :user, :filename, :comments
  
  def has_access?(user)
    return false if user.nil?
    self.user == user || user.is_admin?
  end
  
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :min_size => 0.kilobytes,
                 :max_size => 256.kilobytes,
                 :resize_to => "320x320>",
                 :thumbnails => { :thumb => '64x64>' }
                 
  validates_as_attachment
  
end
