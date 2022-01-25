require 'pg'

class Space

  attr_reader :id, :name, :description, :price

  def initialize(id:, name:, description:, price:)
    @id = id
    @name = name
    @description = description
    @price = "£#{price}"
  end

  def self.all
    results = connection.exec('SELECT * FROM spaces;')
    results.map { |space| 
      Space.new(
        id: space['id'],
        name: space['name'],
        description: space['description'],
        price: space['price']
        )
    }
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