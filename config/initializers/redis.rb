REDIS_CONFIG = YAML.load_file("#{Rails.root}/config/redis.yml")[Rails.env]
$redis = Redis.new(:host => REDIS_CONFIG["host"], :port => REDIS_CONFIG["port"])
# empty out the cache when server starts!
$redis.del("arts")