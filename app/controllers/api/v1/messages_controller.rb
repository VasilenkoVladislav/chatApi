class Api::V1:: MessagesController < BaseController

  def index
    @messages = Message.find_by(conversation_id: params[:conversation_id])
    render :index
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      render :create
    else
      render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update

  end

  def destroy

  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id)
  end

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

end