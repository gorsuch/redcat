module Redcat
  class Catter
    def initialize(opts={})
      @redis_list = opts[:redis_list]
      @redis_url = opts[:redis_url]
    end

    def cat(s)
      redis.rpush(list, s)
    end

    def list
      @redis_list
    end

    def redis
      @redis ||= Redis.new(url: @redis_url)
    end

    def redis_url
      @redis_url
    end
  end
end
