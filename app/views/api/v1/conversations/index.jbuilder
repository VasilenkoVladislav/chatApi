json.conversations({})
json.conversations do
  @conversations.each do |conversation|
    json.set! conversation.id do
      json.call(conversation, :id, :created_at, :updated_at)
      json.name conversation.get_name(current_user)
      json.last_message_content conversation.messages.last ? conversation.messages.last.content : ''
      json.users do
        json.array!(conversation.users) do |user|
          json.user_id user.id
          json.user_name user.name
          json.user_avatar user.image
        end
      end
    end
  end
end
