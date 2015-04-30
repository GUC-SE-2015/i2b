class AddVideoToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :video, :string
  end
end
