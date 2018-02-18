class Api::V1:: ConversationsController < BaseController

  before_action :find_user, only: [:create]

  def index
    @conversations = current_user.conversations
    render :index
  end

  def create
    @conversation = current_user.conversations.create
    if @conversation.persisted?
      @conversation.add_user @user
      render :create
    else
      render json: { errors: @conversation.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

  def find_user
    if params[:conversation][:user_id]
      @user = User.find_by(id: params[:conversation][:user_id])
    end
    head (:not_found) unless @user
  end

end
