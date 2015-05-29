You are the proprietor of füber, an on call taxi service.

You have a fleet of cabs at your disposal, and each cab has a location, determined by it's latitude and longitude.

A customer can call one of your taxis by providing their location, and you must assign the nearest taxi to the customer.

Some customers are particular that they only ride around in pink cars, for hipster reasons. You must support this ability.

When the cab is assigned to the customer, it can no longer pick up any other customers

If there are no taxis available, you reject the customers request.

The customer ends the ride at some location. The cab waits around outside the customer's house, and is available to be assigned to another customer.
Notes:

You can build this in any programming language of your choice
We expect good unit tests
Unfortunately, you skipped Geography, and believe the earth is flat. The distance between two points can be calculated by Pythagoras' theorem.
We don't expect a front end for this, but try to build an restful API.

Extra Credit:

When the customer ends the ride, log the total amount the customer owes
The price is 1 dogecoin per minute, and 2 dogecoin per kilometer. Pink cars cost an additional 5 dogecoin.
HTML front end showing me all the cars available


##Exposed APIs
_____________

### root

#### It displays the status of the taxis that are present in the system

----

### POST /journey 

`{"journey"=>{"latitude"=>"3", "longitude"=>"4"}}`

#### Creates a new journey and assigns a taxi

----

### PUT  /journey/:id/start

#### Starts the Journey

----

###PUT  /journey/:id/end

`{"journey"=>{"latitude"=>"30", "longitude"=>"2"}}`

#### Ends the Journey 

----

### GET  /journey/:id/payment_amount

####Gets Payment for the given completed journey

----

