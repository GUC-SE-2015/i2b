class Consultancy < ActiveRecord::Base
	
	def pitch
		if self.pitch_id
			return Pitch.find(self.pitch_id)
		else
			return Pitch.new
		end
	end

	def consultant
		return User.find(self.consaltant_id)
	end
end
