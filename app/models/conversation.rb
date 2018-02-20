class Conversation < ActiveRecord::Base
  has_many :conversation_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :conversation_users

  default_scope { order('created_at ASC') }

  def add_user(user)
    ConversationUser.create(conversation_id: self.id, user_id: user.id )
  end

  def find_conversation_user(current_user)
    user_conversation =  self.users.where.not(id: current_user.id).first
    user_conversation
  end

end
