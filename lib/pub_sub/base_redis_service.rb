module PubSub
  class BaseRedisService

    private
    def redis
      $pub_sub
    end
  end
end
