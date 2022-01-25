require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/space'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do 
    'hello world'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end


  run! if app_file == $0

end 