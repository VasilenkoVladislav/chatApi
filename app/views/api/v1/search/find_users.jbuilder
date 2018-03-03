json.users do
  json.array!(@users.records) do |user|
    intersection_array = current_user.get_common_conversation_ids(user)
    conversation_user = current_user.conversation_users.find_by(conversation_id: intersection_array[0])
    json.call(user, :id, :name)
    if !conversation_user.nil? && !conversation_user.is_deleted
      json.conversation_id intersection_array[0]
    end
    json.image user.get_avatar 'large'
    json.image_medium user.get_avatar 'medium'
    json.image_small user.get_avatar 'small'
  end
end
