class Conversation < ActiveRecord::Base
  has_many :conversation_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :conversation_users
end