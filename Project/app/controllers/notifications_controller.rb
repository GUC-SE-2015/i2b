class NotificationsController < ApplicationController

	def index
      @notifications=current_user.notication.all
      
      end
      @notification.save!
    end
end