class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :title
      t.string :brief_description
      t.string  :full_description
      t.string  :url
      add_foreign_key :users, :email
        t.boolean :request_joining_idea : false 

      t.timestamps null: false
    end
  end
end
