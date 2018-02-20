json.message do
  json.call(@message, :id, :content, :conversation_id, :read, :created_at, :updated_at)
  json.user_id @message.user.id
  json.user_name @message.user.name
  json.user_avatar_small @message.user.get_avatar 'small'
end