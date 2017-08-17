class ConversationsController < ApplicationController
  layout false


  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create! conversation_params
    end

    render json: {conversation_id: @conversation.id}
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end

  def update
  @conversation = Conversation.find(params[:id])

  if @conversation.update(conversation_params)
      redirect_to @conversation
  else
      render :index
  end

  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def interlocutor conversation
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end
