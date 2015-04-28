class AddRequestsToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :Requestermail, :string
    add_column :pitches, :Add_Pitch_id_To_Pitches_Requestjoin, :integer
  end
end
