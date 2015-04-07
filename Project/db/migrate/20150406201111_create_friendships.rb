class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
     
        add_foreign_key :users, :email
      add_foreign_key :pitches, :email
      t.timestamps null: false
    end
  end
end
