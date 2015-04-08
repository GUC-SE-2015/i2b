class CreateConsultancies < ActiveRecord::Migration
  def change
    create_table :consultancies do |t|
      t.integer :pitch_id
      t.text :body
      t.integer :consaltant_id
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
