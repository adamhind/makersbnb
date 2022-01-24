require 'sinatra/base'
require 'sinatra/reloader'

class Makersbnb < Sinatra::Base

  get '/' do 
    'hello world'
  end

  run! if app_file == $0

end 