class Pitch < ActiveRecord::Base
  has_many :evalutions
	def user
		return User.find_by_email(self.email)
	end

	def consultancies
		return Consultancy.where("pitch_id =?", self.id)
	end
end
