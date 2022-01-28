require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'ducks_bnb_test')
  connection.exec('DROP TABLE users CASCADE;')
  connection.exec('DROP TABLE spaces CASCADE;')
  connection.exec('DROP TABLE bookings CASCADE;')
  connection.exec('CREATE TABLE users(
    user_id SERIAL PRIMARY KEY, 
    first_name VARCHAR(30), 
    surname VARCHAR(30), 
    username VARCHAR(10), 
    email VARCHAR(319), 
    password VARCHAR(15));')
  
  connection.exec('CREATE TABLE spaces(
    space_id SERIAL PRIMARY KEY, 
    space_name VARCHAR(60),
    description VARCHAR(300),
    price NUMERIC(38,2), 
    owner_id INT references users(user_id),
    available_from DATE,
    available_to DATE);')
  
  connection.exec('CREATE TABLE bookings(
    booking_id SERIAL PRIMARY KEY, 
    space_id INT references spaces(space_id), 
    date_from DATE, 
    date_to DATE, 
    booker_id INT references users(user_id), 
    confirmed BOOLEAN);')
end

def add_users_to_test_database
  connection = PG.connect(dbname: 'ducks_bnb_test')
  connection.exec("INSERT INTO users (first_name, surname, username, email, password) VALUES 
  ('Test User 1', 'Number 1','TEST01','test1@test.com','Password1');")
  connection.exec("INSERT INTO users (first_name, surname, username, email, password) VALUES 
  ('Test User 2', 'Number 2','TEST02','test2@test.com','Password2');")
  connection.exec("INSERT INTO users (first_name, surname, username, email, password) VALUES 
  ('Test User 3', 'Number 3','TEST03','test3@test.com','Password3');")
end

def add_spaces_to_test_database
  connection = PG.connect(dbname: 'ducks_bnb_test')
  connection.exec("INSERT INTO spaces (space_name, description, price, owner_id, available_from, available_to) VALUES 
  ('Test Space #1', 'This is the first test space. Spacious.', '50.00', '1', '2022-01-01', '2022-01-30');")
  connection.exec("INSERT INTO spaces (space_name, description, price, owner_id, available_from, available_to) VALUES 
  ('Test Space #2', 'This is the second test space. Cosy.', '40.00', '1', '2022-01-01', '2022-01-30');")
  connection.exec("INSERT INTO spaces (space_name, description, price, owner_id, available_from, available_to) VALUES 
  ('Test Space #3', 'This is the third test space. Cheap.', '20.00', '2', '2022-02-01', '2022-02-28');")
end

def add_bookings_to_test_database
  connection = PG.connect(dbname: 'ducks_bnb_test')
  connection.exec("INSERT INTO bookings (space_id, date_from, date_to, booker_id, confirmed) VALUES 
  ('1', '2022-01-01', '2022-01-02', '3', 'false');")
  connection.exec("INSERT INTO bookings (space_id, date_from, date_to, booker_id, confirmed) VALUES 
  ('2', '2022-01-10', '2022-01-11', '3', 'false');")
  connection.exec("INSERT INTO bookings (space_id, date_from, date_to, booker_id, confirmed) VALUES 
  ('1', '2022-02-01', '2022-02-02', '3', 'true');")
end
  