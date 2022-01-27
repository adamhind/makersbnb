require 'pg'
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
    User.new(
      user_id: result[0]['user_id'], 
      first_name: result[0]['first_name'],
      surname: result[0]['surname'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password'])
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