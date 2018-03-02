json.conversation do
    user = @conversation.find_conversation_user(current_user)
    json.call(@conversation, :id, :created_at, :updated_at)
    json.last_message_content ''
    json.user_id user.id
    json.user_name user.name
    json.user_avatar_small user.get_avatar 'small'
end
