class Votes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
          t.integer :user_id
          t.integer :owner_type
          t.integer :owner_id
          t.integer :grade

          t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
