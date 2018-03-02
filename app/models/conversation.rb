class Conversation < ActiveRecord::Base
  has_many :conversation_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :conversation_users

  default_scope { order('created_at desc') }

  def add_user(user)
    ConversationUser.create(conversation_id: self.id, user_id: user.id )
  end

  def find_conversation_user(user)
    self.users.where.not(id: user.id).first
  end

end
