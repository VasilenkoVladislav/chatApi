class Api::V1:: ConversationsController < BaseController

  before_action :authenticate_user!

  def index
    @conversations = Conversation.all
    render :index
  end

  def create
    @conversation = current_user.conversations.new
    render :index
  end

  def update

  end

  def destroy

  end

end