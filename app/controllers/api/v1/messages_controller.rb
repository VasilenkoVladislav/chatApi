class Api::V1:: MessagesController < BaseController
  include PubSub

  before_action :find_message, only: [:update, :destroy]
  before_action :find_conversation, only: [:index]
  def index
    @messages = @conversation.messages
    render :index
  end

  def create
    @message = current_user.messages.create(create_message_params)
    if @message.persisted?
      publisher.publish({message: @message, action: 'create'}, @client_id)
      render :create
    else
      render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @message.update(update_message_params)
      publisher.publish({message: @message, action: 'update'}, @client_id)
      render :update, status: :ok
    else
      render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @message.destroy
      publisher.publish({message: @message, action: 'destroy'}, @client_id)
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def publisher
    MessagesPublisher.new
  end

  def create_message_params
    params.require(:message).permit(:content, :conversation_id)
  end

  def update_message_params
    params.require(:message).permit(:content)
  end

  def find_message
    if params[:id]
      @message = Message.find_by(id: params[:id])
    end
    head (:not_found) unless @conversation
  end

  def find_conversation
    if params[:conversation_id]
      @conversation = Conversation.find_by(id: params[:conversation_id])
    end
    head (:not_found) unless @conversation
  end

end