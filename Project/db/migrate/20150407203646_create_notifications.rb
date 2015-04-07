class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
     
      add_foreign_key :pitches, :email
      t.timestamps null: false
    end
  end
end
