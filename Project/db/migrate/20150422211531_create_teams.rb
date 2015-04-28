class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    
      t.integer :req_id
    

  	add_column :pitches, :pitch_id, :integer

  	add_column :pitches, :email, :string

      t.timestamps null: false
    end
  end
end
