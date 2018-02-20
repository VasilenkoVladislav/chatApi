require 'redis'
require 'pub_sub/base_redis_service'
require 'pub_sub/messages_publisher'

module PubSub
  autoload :BaseRedisService, 'pub_sub/base_redis_service'
  autoload :MessagesPublisher, 'pub_sub/messages_publisher'

  mattr_accessor :redis_host,
                 :redis_port
end