require_relative("../db/sql_runner")
require_relative("./film")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
      sql = "INSERT INTO customers
      (
        name,
        funds
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@name, @funds]
      customer = SqlRunner.run( sql, values ).first
      @id = customer['id'].to_i
    end

    def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = Customer.map_items (customers)
    return result
  end

  def self.map_items(customer_data)
  return customer_data.map { |customer| Customer.new(customer)}
end

def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE customers SET name = $1, funds = $2 WHERE id = $3"
    values = [@name, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def show_films()
  sql = "SELECT films.*
  FROM films
  INNER JOIN tickets
  ON tickets.film_id = films.id
  WHERE customer_id = $1"
  values = [@id]
  locations = SqlRunner.run(sql, values)
  return Film.map_items(locations)
end

end
