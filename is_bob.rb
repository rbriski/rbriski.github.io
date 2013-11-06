require 'sinatra/base'
require 'yaml'

class IsBob < Sinatra::Base
  get '/' do
    redis = Redis.new
    s = redis.get "hubot:storage"
    y = ::YAML.load(s)
    if y['locations']['Bob Briski'] == 'mtv'
      return 'Yes'
    else
      return "Nope. In #{y['locations']['Bob Briski']}"
    end
  end
end