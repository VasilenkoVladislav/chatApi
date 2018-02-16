class Api::V1:: ConversationsController < BaseController

  before_action :create_conversation_with_users, only: [:create]
  before_action :find_conversation, only: [:update, :destroy]

  def index
    @conversations = current_user.conversations
    render :index
  end

  def create
    if @users_ids
      @conversation = current_user.conversations.create
      if @conversation.persisted?
        @conversation.add_users(@users_ids)
        render :create
      else
        render json: { errors: @conversation.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: 'Please add users_ids' }, status: :unprocessable_entity
    end
  end

  def update
    if @conversation.update(update_conversation_params)
      render :update, status: :ok
    else
      render json: { errors: @conversation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @conversation.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end


  private

  def update_conversation_params
    params.require(:conversation).permit(:name)
  end

  def find_conversation
    if params[:id]
      @conversation = Conversation.find_by(id: params[:id])
    end
    head (:not_found) unless @conversation
  end

  def create_conversation_with_users
    @users_ids = params[:conversation][:users_ids] if params[:conversation][:users_ids] && params[:conversation][:users_ids].length > 0
  end

end