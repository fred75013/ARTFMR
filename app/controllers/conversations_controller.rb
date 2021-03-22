# frozen_string_literal: true

class ConversationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    if @conversation.nil?
      @conversation = if Conversation.between(params[:sender_id], params[:recipient_id]).present?
                        Conversation.between(params[:sender_id],
                                             params[:recipient_id]).first
                      else
                        Conversation.create!(conversation_params)
                      end
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
