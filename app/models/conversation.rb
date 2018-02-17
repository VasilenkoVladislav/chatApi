class Conversation < ActiveRecord::Base
  has_many :conversation_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :conversation_users

  ST_AVATAR = ['', '_medium', '_small']

  def get_name(current_user)
    names = []
    users_conversation =  self.users.where.not(id: current_user.id)
    if users_conversation.length > 1
      if !self.name
        users_conversation.each do |user|
          names.push(user.name)
        end
      else
        names.push(self.name)
      end
    else
      names.push(users_conversation.first.name)
    end
    names.join(', ')
  end

  def get_avatar(current_user, size)
    type = ['large', 'medium', 'small']
    image = nil
    users_conversation =  self.users.where.not(id: current_user.id)
    if users_conversation.length > 1
      image = self.image
    else
      image = users_conversation.first.image
    end
    image + ST_AVATAR[type.index(enum)]
  end

  def add_users(users_ids)
    users = User.where("users.id in (?)", users_ids)
    users.each do |user|
      ConversationUser.create(conversation_id: self.id, user_id: user.id )
    end
  end

end
