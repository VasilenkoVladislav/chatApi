json.messages({})
json.messages do
  @messages.each do |message|
    json.set! message.id do
      json.call(message, :id, :content, :created_at, :updated_at)
      json.user_id
      json.user_name
      json.user_avatar
    end
  end
end
