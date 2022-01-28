require 'pg'
require_relative 'mail'

class User

  attr_reader :user_id, :first_name, :surname, :username, :email, :password

  def initialize(user_id:, first_name:, surname:, username:, email:, password:)
    @user_id = user_id
    @first_name = first_name
    @surname = surname
    @username = username
    @email = email 
    @password = password 
  end

  def self.add(first_name:, surname:, username:, email:, password:)
    result = connection.exec_params(
      'INSERT INTO users (first_name, surname, username, email, password) VALUES($1, $2, $3, $4, $5)
        RETURNING user_id, first_name, surname, username, email, password;',
      [first_name, surname, username, email, password]
    )
    Mail.new_user(first_name: first_name, email: email)
    User.new(
      user_id: result[0]['user_id'], 
      first_name: result[0]['first_name'],
      surname: result[0]['surname'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password'])
  end

  def self.login(username:, password:)
    result = connection.exec_params(
      "SELECT user_id FROM users WHERE username='#{username}' AND password='#{password}';")
      result[0]['user_id'].to_i
  end 

  def requests
    @my_bookings = []

    space_id = User.connection.exec("SELECT space_id from spaces WHERE owner_id='#{@user_id}';")
    space_id = space_id.map do |space|
      space
    end 

    space_id.each do |spacey|
    results = User.connection.exec("SELECT * from bookings WHERE space_id='#{spacey['space_id']}';")
      results.map do |each_booking|
        @my_bookings << each_booking
      end 
    end 
    @my_bookings
  end 
  
      
  def self.connection
    private_class_method
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'ducks_bnb_test')
    else
      PG.connect(dbname: 'ducks_bnb')
    end
  end

end 