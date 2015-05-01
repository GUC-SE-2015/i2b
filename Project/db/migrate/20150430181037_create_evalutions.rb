class CreateEvalutions < ActiveRecord::Migration
  def change
    create_table :evalutions do |t|
      t.integer :user_id
      t.integer :pitch_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
