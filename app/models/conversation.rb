class Conversation < ActiveRecord::Base
  has_many :conversation_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :conversation_users

  def add_users(users_ids)
    users = User.where("users.id in (?)", users_ids)
    users.each do |user|
      ConversationUser.create(conversation_id: self.id, user_id: user.id )
    end
  end
end