class Blog < ActiveRecord::Base
	has_many :blog_comments
end
