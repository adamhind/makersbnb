class Booking

  attr_reader :booking_id, :space_id, :date_from, :date_to, :booker_id, :confirmed

  def initialize(booking_id:, space_id:, date_from:, date_to:, booker_id:)
    @booking_id = booking_id
    @space_id = space_id
    @date_from = date_from
    @date_to = date_to
    @booker_id = booker_id
    @confirmed = false
  end

  def self.add(space_id:, date_from:, date_to:, booker_id:)
    result  = connection.exec_params(
      'INSERT INTO bookings (space_id, date_from, date_to, booker_id, confirmed) VALUES($1, $2, $3, $4, $5)
      RETURNING booking_id, space_id, date_from, date_to, booker_id, confirmed;',
      [space_id, date_from, date_to, booker_id, 'false']
    )

    Booking.new(
      booking_id: result[0]['booking_id'],
      space_id: result[0]['space_id'],
      date_from: result[0]['date_from'],
      date_to: result[0]['date_to'],
      booker_id: result[0]['booker_id']
      # confirmed: result[0]['confirmed']
    )
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