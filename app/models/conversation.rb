class Conversation < ActiveRecord::Base
  has_many :conversation_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :conversation_users

  def get_name(current_user)
    name = []
    users_conversation =  self.users.where.not(id: current_user.id)
    if users_conversation.length > 1
      users_conversation.each do |user|
        name.push(user.name)
      end
    else
      name.push(users_conversation.first.name)
    end
    name.join(', ')
  end

  def add_users(users_ids)
    users = User.where("users.id in (?)", users_ids)
    users.each do |user|
      ConversationUser.create(conversation_id: self.id, user_id: user.id )
    end
  end
end