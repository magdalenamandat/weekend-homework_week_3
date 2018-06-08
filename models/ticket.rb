require_relative("../db/sql_runner")
require_relative("./film")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
      sql = "INSERT INTO tickets
      (
        customer_id,
        film_id
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@customer_id, @film_id]
      ticket = SqlRunner.run( sql, values ).first
      @id = ticket['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM tickets"
        tickets = SqlRunner.run(sql)
        result = Visit.map_items(tickets)
        return result
      end

      def self.map_items(ticket_data)
        return ticket_data.map { |ticket| Ticket.new(ticket)}
      end

      def self.delete_all()
        sql = "DELETE FROM tickets"
        values = []
        SqlRunner.run(sql, values)
      end

      def update
        sql = "UPDATE tickets SET customer_id = $1, film_id = $2 WHERE id = $3"
        values = [@customer_id, @film_id]
        SqlRunner.run(sql, values)
      end

end
