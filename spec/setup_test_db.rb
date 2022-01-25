require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'ducks_bnb_test')
  connection.exec("TRUNCATE spaces;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'ducks_bnb_test')
  connection.exec("INSERT INTO spaces (name, description, price) VALUES ('Test Space #1', 'This is the first test space. Spacious.', 50.00);")
  connection.exec("INSERT INTO spaces (name, description, price) VALUES ('Test Space #2', 'This is the second test space. Cosy.', 40.00);")
  connection.exec("INSERT INTO spaces (name, description, price) VALUES ('Test Space #3', 'This is the third test space. Cheap.', 20.00);")
end
