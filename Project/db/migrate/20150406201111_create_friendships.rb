class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
     
        add_foreign_key :users, :email
      add_foreign_key :pitches, :email
      t.boolean :request_joining_idea:false
      t.timestamps null: false
    end
  end
end
