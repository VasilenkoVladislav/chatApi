class Message < ActiveRecord::Base
  has_one :conversation, dependent: :destroy
  has_one :user
end