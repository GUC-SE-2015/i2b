class Team < ActiveRecord::Base
	  has_many :users

		 
  belongs_to :pitch, :class_name => "Pitch"
end
