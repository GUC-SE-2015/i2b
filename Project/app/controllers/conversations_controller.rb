#Author Ahmed Naguib
class ConversationsController < ApplicationController
	
  	#This method is to list the created conversations 
  	#Author Ahmed Naguib
	def index
		@users = User.all
		@conversations = Conversation.all
	end

  	#This method is to create a new conversation 
  	#Author Ahmed Naguib
	def create
	 	# if Conversation.between? (params[:sender_id]),(params[:recipient_id]).present?
	    # @conversation = Conversation.between? (params[:sender_id]),(params[:recipient_id]).first
	  	@conversation = Conversation.create!(conversation_params)
	 	redirect_to conversation_messages_path(@conversation)
	end

  	#This method is to delete an existing conversation
  	#Author Ahmed Naguib
	def destroy
	    @conversation = conversation.find(params[:sender_id, :recipient_id])
	    @conversation.destroy
	 
	    redirect_to conversation_messages_path
  	end

	private
	def conversation_params
		params.permit(:sender_id, :recipient_id)
	end
end