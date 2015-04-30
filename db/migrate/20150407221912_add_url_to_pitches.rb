class AddUrlToPitches < ActiveRecord::Migration
  def change
  	add_column :pitches, :link, :string
  end
end
