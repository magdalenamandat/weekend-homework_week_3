require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )

require( 'pry-byebug' )

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


customer1 = Customer.new({
  'name' => 'Bob',
  'funds' => '100'
  })
  customer1.save()

customer2 = Customer.new({
  'name' => 'Kevin',
  'funds' => '50'
  })
  customer2.save()

customer3 = Customer.new({
  'name' => 'Graeme',
  'funds' => '200'
  })
  customer3.save()



film1 = Film.new({
  'title' => 'Red Sparow',
   'price' => '10'
   })
   film1.save()

film2 = Film.new({
   'title' => 'Joy',
   'price' => '10'
   })
   film2.save()

film3 = Film.new({
  'title' => 'Interstellar',
   'price' => '8'
   })
   film3.save()



ticket1 = Ticket.new({
   'customer_id' => customer1.id,
   'film_id' => film1.id
   })
ticket1.save()

ticket2 = Ticket.new({
   'customer_id' => customer2.id,
   'film_id' => film1.id
   })
ticket2.save()

ticket3 = Ticket.new({
   'customer_id' => customer3.id,
   'film_id' => film3.id
   })
ticket3.save()




binding.pry
nil
