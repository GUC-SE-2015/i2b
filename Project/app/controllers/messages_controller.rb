#Author Ahmed Naguib
class MessagesController < ApplicationController
before_action do
@conversation = Conversation.find(params[:conversation_id])
end

  	#This method is to list the created messages in a conversation 
  	#Author Ahmed Naguib
	def index
		@messages = @conversation.messages
		if @messages.length > 10
		@over_ten = true
		@messages = @messages[-10..-1]
		end

		if params[:m]
		@over_ten = false
		@messages = @conversation.messages
		end
		
		if @messages.last
		if @messages.last.user_id != current_user.id
		@messages.last.read = true;
		end
		end
		@message = @conversation.messages.new
	end

  	#This method is to create new message 
  	#Author Ahmed Naguib
	def new
		@message = @conversation.messages.new
	end

  	#This method is to add message body to a new message and to save the message 
  	#Author Ahmed Naguib
	def create
		@message = @conversation.messages.new(message_params)
		if @message.save
		redirect_to conversation_messages_path(@conversation)
		end
	end

private
	def message_params
		params.require(:message).permit(:body, :user_id)
	end
end
