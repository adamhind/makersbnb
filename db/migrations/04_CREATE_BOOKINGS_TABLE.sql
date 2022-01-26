CREATE TABLE bookings(
  booking_id SERIAL PRIMARY KEY, 
  space_id INT references spaces(space_id), 
  date_from DATE, 
  date_to DATE, 
  booker_id INT references users(user_id), 
  confirmed BOOLEAN
  );



 