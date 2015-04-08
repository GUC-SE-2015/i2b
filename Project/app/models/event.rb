class Event < ActiveRecord::Base
	
		def self.edit_the_event(title,description,start_time,end_time) 
	events.title= title
	 events.description= description
	events.start_time  = start_time 
	 events.end_time = end_time
	  events.save 
	end
end
