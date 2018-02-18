json.conversations({})
json.conversations do
  @conversations.each do |conversation|
    user = conversation.find_conversation_user(current_user)
    messages = conversation.messages.order("created_at DESC").limit(1)
    json.set! conversation.id do
      json.call(conversation, :id, :created_at, :updated_at)
      json.last_message_content messages.first ? messages.first.content : ''
      json.user_id user.id
      json.user_name user.name
      json.user_avatar_small user.get_avatar 'small'
    end
  end
end
