module PubSub
  class MessagesPublisher < BaseRedisService

    def publish(data, client_id)
      message = message_builder(data[:message], data[:action])
      redis.publish("#{client_id}?#{data[:message].conversation_id}", message)
    end

    private

    def message_builder(message, action)
      {
          type: "message",
          action: action,
          data: {
              id: message.id,
              content: message.content,
              conversation_id: message.conversation.id,
              read: message.read,
              created_at: message.created_at,
              update_at: message.updated_at,
              user_id: message.user.id,
              user_name: message.user.name,
              user_avatar_small: message.user.get_avatar('small')
          }
      }.to_json
    end

  end
end
