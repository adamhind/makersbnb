require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'lib/space'

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


  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.add(name: params[:name], description: params[:description], price: params[:price])
    redirect('/spaces')
  end

  post '/spaces/request' do 
    @name = params[:name]
    erb :'spaces/requested'
  end 

  run! if app_file == $0

end 

  # run! if app_file == $0
end

