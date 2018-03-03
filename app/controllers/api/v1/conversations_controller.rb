class Api::V1:: ConversationsController < BaseController

  before_action :find_user, only: [:create]

  def index
    conversation_ids = current_user.conversation_users.where(is_deleted: false).pluck(:conversation_id)
    @conversations = Conversation.where(id: conversation_ids)
    render :index
  end

  def create
    # Todo check
    if !params[:conversation][:id].blank?
      conversation_user = current_user.conversation_users.find_by(conversation_id: params[:conversation][:id])
      if conversation_user.is_deleted
        conversation_user.update(is_deleted: false)
        @conversation = conversation_user.conversation
        render :create
      else
        render json: { errors: 'Conversation exist' }, status: :unprocessable_entity
      end
    else
      @conversation = current_user.conversations.create
      if @conversation.persisted?
        @conversation.add_user @user
        render :create
    else
        render json: { errors: @conversation.errors.full_messages }, status: :unprocessable_entity
      end
    end

  end


  private

  def find_user
    if params[:conversation] && params[:conversation][:user_id]
      @user = User.find_by(id: params[:conversation][:user_id])
    end
    head (:not_found) unless @user
  end

end
