class Message < ActiveRecord::Base
 belongs_to :conversation
 belongs_to :user
 validates_presence_of :body, :conversation_id, :user_id
 
	def message_time
		t = Time.now
		t.strftime(" %a, %d %b at %I:%M%p")            #=> example: "wed, 29 Apr at 01:20AM"
	end
end