require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'ducks_bnb_test')
  connection.exec('TRUNCATE spaces CASCADE;')
  connection.exec('TRUNCATE users CASCADE;')
  connection.exec('TRUNCATE bookings CASCADE;')
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'ducks_bnb_test')
  connection.exec("INSERT INTO spaces (space_name, description, price, available_from, available_to) VALUES 
  ('Test Space #1', 'This is the first test space. Spacious.', '50.00', '01/01/2022', '01/30/2022');")
  connection.exec("INSERT INTO spaces (space_name, description, price, available_from, available_to) VALUES 
  ('Test Space #2', 'This is the second test space. Cosy.', '40.00', '01/01/2022', '01/30/2022');")
  connection.exec("INSERT INTO spaces (space_name, description, price, available_from, available_to) VALUES 
  ('Test Space #3', 'This is the third test space. Cheap.', '20.00', '02/01/2022', '02/28/2022');")
end

def add_test_users_to_database
  connection = PG.connect(dbname: 'ducks_bnb_test')
  connection.exec("INSERT INTO users (first_name, surname, username, email, password) VALUES 
  ('Test User 1', 'Number 1','TEST01','test1@test.com','Password1');")
  connection.exec("INSERT INTO users (first_name, surname, username, email, password) VALUES 
  ('Test User 2', 'Number 2','TEST02','test2@test.com','Password2');")
  connection.exec("INSERT INTO users (first_name, surname, username, email, password) VALUES 
  ('Test User 3', 'Number 3','TEST03','test3@test.com','Password3');")
end

def add_test_bookings_to_database
  connection = PG.connect(dbname: 'ducks_bnb_test')
  connection.exec("INSERT INTO bookings (date_from, date_to, confirmed) VALUES 
  ('01/01/2022', '01/02/2022','false');")
  connection.exec("INSERT INTO bookings (date_from, date_to, confirmed) VALUES 
  ('01/10/2022', '01/11/2022','false');")
  connection.exec("INSERT INTO bookings (date_from, date_to, confirmed) VALUES 
  ('01/01/2022', '01/02/2022','true');")
end
  