require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )

require( 'pry-byebug' )



customer1 = Customer.new({
  'name' => 'Bob',
  'founds' => '100'
  })
  customer1.save()

customer2 = Customer.new({
  'name' => 'Kevin',
  'founds' => '50'
  })
  customer2.save()

customer3 = Customer.new({
  'name' => 'Graeme',
  'founds' => '200'
  })
  customer3.save()



film1 = Film.new({
  'title' => 'Red Sparow',
   'price' => '10'
   })
film2 = Film.new({
   'title' => 'Joy',
   'price' => '10'
   })
film3 = Film.new({
  'title' => 'Interstellar',
   'price' => '8'
   })




ticket1 = Ticket.new({
   'customer_id' => customer1.id,
   'film_id' => film1.id
   })
ticket2 = Ticket.new({
   'customer_id' => customer2.id,
   'film_id' => film1.id
   })
ticket3 = Ticket.new({
   'customer_id' => customer3.id,
   'film_id' => film3.id
   })




binding.pry
nil
