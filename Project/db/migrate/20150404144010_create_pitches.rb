class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :title
      t.string :brief_description
      t.string  :full_description
      t.integer :pitch_id
      t.string  :url
      t.boolean :request_for_joining , :default => :false
      add_foreign_key :users, :email
     

      t.timestamps null: false
    end
  end
end
