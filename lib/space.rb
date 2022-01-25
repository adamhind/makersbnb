class Space

  require 'pg'

  attr_reader :name, :description, :price 

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price     
  end

  def self.add(name:, description:, price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'ducks_bnb_test')
    else
      connection = PG.connect(dbname: 'ducks_bnb')
    end
      result = connection.exec_params("INSERT INTO spaces (name, description, price) VALUES($1, $2, $3) RETURNING id, name, description, price;", [name, description, price])
      Space.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
  
  end
end 