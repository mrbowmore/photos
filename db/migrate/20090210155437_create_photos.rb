class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.column :parent_id, :integer
      t.column :content_type, :string
      t.column :filename, :string
      t.column :title, :string
      t.column :thumbnail, :string
      t.column :size, :integer
      t.column :with, :integer
      t.column :height, :integer
      
      t.column :album_id, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end