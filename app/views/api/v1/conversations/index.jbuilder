json.conversations({})
json.conversations do
  @conversations.each do |conversation|
    json.set! conversation.id do
      json.call(conversation, :id, :created_at, :updated_at)
      json.name conversation.get_name(current_user)
      json.last_message_content conversation.messages.last ? conversation.messages.last.content : ''
      json.image_small conversation.get_avatar(current_user, 'small')
      json.image_medium conversation.get_avatar(current_user, 'medium')
      json.image conversation.get_avatar(current_user, 'large')
      json.users do
        json.array!(conversation.users) do |user|
          if user.id != current_user.id
            json.user_id user.id
            json.user_name user.name
            json.user_avatar_small user.get_avatar 'small'
          end
        end
      end
    end
  end
end
