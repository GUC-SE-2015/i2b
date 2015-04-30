class Pitch < ActiveRecord::Base

	mount_uploader :video, VideoUploader

	def user
		return User.find_by_email(self.email)
	end

	def consultancies
		return Consultancy.where("pitch_id =?", self.id)
	end
end
