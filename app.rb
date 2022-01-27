require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'lib/space'
require_relative 'lib/user'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/home'
  end

  get '/home' do
    erb :homepage
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.add(
      name: params[:name], 
      description: params[:description], 
      price: params[:price], 
      available_from: params[:available_from], 
      available_to: params[:available_to]
      )
    redirect('/spaces')
  end

  post '/spaces/request' do 
    @name = params[:name]
    erb :'spaces/requested'
  end 

  get '/signup' do 
    erb :signup
  end 

  post '/home' do 
    User.add(first_name: params[:first_name], surname: params[:surname], username: params[:username], email: params[:email], password: params[:password])
    redirect('/home')
  end 

  get '/home' do 
  
  end

  run! if app_file == $0
end
