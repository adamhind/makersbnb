require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'lib/space'
require_relative 'lib/user'
require_relative 'lib/booking'
require_relative 'lib/mail'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :home
  end

  get '/home' do
    erb :homepage
  end

  get '/spaces' do
    session[:check_in] = params[:'Check-in']
    session[:check_out] = params[:'Check-out']
    @spaces = Space.all(
      checkin: params[:'Check-in'],
      checkout: params[:'Check-out']
      )
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
    @space_id = params[:space_id]
    @booker_id = session[:user_id]
    @date_from = session[:check_in]
    @date_to = session[:check_out]
    Booking.add(
      space_id: @space_id, 
      booker_id: @booker_id, 
      date_from: @date_from, 
      date_to: @date_to
      )
    erb :'spaces/requested'
  end 

  get '/signup' do 
    erb :signup
  end 

  post '/home' do 
    User.add(
      first_name: params[:first_name],
      surname: params[:surname],
      username: params[:username],
      email: params[:email],
      password: params[:password]
      )
    redirect('/home')
  end 

  post '/login' do 
    session[:user_id] = User.login(username: params[:username], password: params[:password])
    username = params[:username]
    redirect('/home')
  end

  run! if app_file == $0
end
