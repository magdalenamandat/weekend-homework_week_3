require_relative("../db/sql_runner")
require_relative("./film")

class Customer

  attr_reader :id
  attr_accessor :name, :founds

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @founds = options['founds']
  end

  def save()
      sql = "INSERT INTO customers
      (
        name,
        founds
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@name, @founds]
      user = SqlRunner.run( sql, values ).first
      @id = user['id'].to_i
    end

end
