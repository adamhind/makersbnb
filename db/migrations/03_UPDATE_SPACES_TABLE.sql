ALTER TABLE spaces ADD COLUMN owner_id INT references users(user_id);
ALTER TABLE spaces RENAME COLUMN id TO space_id;
ALTER TABLE spaces RENAME COLUMN name TO space_name;
