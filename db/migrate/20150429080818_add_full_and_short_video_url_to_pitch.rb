class AddFullAndShortVideoUrlToPitch < ActiveRecord::Migration
  def change
  	add_column :pitches, :full_video, :string
  	add_column :pitches, :demo_video, :string
  end
end
