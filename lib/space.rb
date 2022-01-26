require 'pg'

class Space
  attr_reader :id, :name, :description, :price , :available_from, :available_to

  def initialize(id:, name:, description:, price:, available_from:, available_to:)
    @id = id
    @name = name
    @description = description
    @price = "£#{price}"
    @available_from = available_from
    @available_to = available_to
  end

  def self.all
    results = connection.exec('SELECT * FROM spaces;')
    results.map do |space|
      Space.new(
        id: space['space_id'],
        name: space['space_name'],
        description: space['description'],
        price: space['price'],
        available_from: space['available_from'],
        available_to: space['available_to']
      )
    end
  end

  def self.add(name:, description:, price:, available_from:, available_to:)
    result = connection.exec_params(
      'INSERT INTO spaces (space_name, description, price, available_from, available_to) VALUES($1, $2, $3, $4, $5)
        RETURNING space_id, space_name, description, price, available_from, available_to;',
      [name, description, price, available_from, available_to]
    )
    Space.new(id: result[0]['space_id'], 
              name: result[0]['space_name'],
              description: result[0]['description'],
              price: result[0]['price'],
              available_from: result[0]['available_from'],
              available_to: result[0]['available_to'])
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
