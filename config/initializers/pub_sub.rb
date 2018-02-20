require 'pub_sub/pub_sub'

include PubSub

PubSub.redis_host = ENV['REDIS_HOST']
PubSub.redis_port = ENV['REDIS_PORT']