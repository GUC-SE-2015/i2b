class AddEmailToPitches < ActiveRecord::Migration
  def change
  	add_column :pitches, :email, :string
  end
end
