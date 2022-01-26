CREATE TABLE users(
  user_id SERIAL PRIMARY KEY, 
  first_name VARCHAR(30), 
  surname VARCHAR(30), 
  username VARCHAR(10), 
  email VARCHAR(319), 
  password VARCHAR(15)
  );