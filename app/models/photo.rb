class Photo < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :min_size => 0.kilobytes,
                 :max_size => 1024.kilobytes,
                 :rezise_to => '320x320>',
                 :thumbnails => { :thumb => '64x64>' }
                 
  validates_as_attachment
  
end
