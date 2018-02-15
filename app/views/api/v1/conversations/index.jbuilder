json.conversations({})
json.conversations do
  @conversations.each do |conversation|
    json.set! conversation.id do
      json.call(conversation, :id, :name, :created_at, :updated_at)
    end
  end
end
