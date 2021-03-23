# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @users = User.all
    @conversations = Conversation.all

    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last && (@messages.last.user_id != current_user.id)
      @messages.last.read = true;
    end
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    if @conversation.nil?
      @conversation = if Conversation.between(params[:sender_id], params[:recipient_id]).present?
                        Conversation.between(params[:sender_id],
                                             params[:recipient_id]).first
                      else
                        Conversation.create!(conversation_params)
                      end
    end

    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
