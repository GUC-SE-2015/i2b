class Pitch < ActiveRecord::Base
	def user
		return User.find_by_email(self.email)
	end
end
