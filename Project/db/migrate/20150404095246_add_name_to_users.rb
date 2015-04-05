class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :is_Ideator, :boolean, default: false
    add_column :users, :is_Idea_Consultant, :boolean, default: false
    add_column :users, :is_Idea_Enabler, :boolean, default: false
    add_column :users, :is_Volunteer, :boolean, default: false
  end
end
