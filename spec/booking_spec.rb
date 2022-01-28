require 'booking'

describe Booking do
  describe '#add' do
   it 'adds a booking to database' do
     booking = Booking.add(space_id: '1', date_from: '2022-01-01', date_to: '2022-01-02', booker_id: '3')
     expect(booking.space_id).to eq '1'
     expect(booking.date_from).to eq '2022-01-01'
     expect(booking.date_to).to eq '2022-01-02'
     expect(booking.booker_id).to eq '3'
     expect(booking.confirmed).to eq false
   end
  end


  # describe '#confirm' do 
  #   it 'changes the database to confirm => true when a request is confirmed' do 

  #   end 
  # end 


end