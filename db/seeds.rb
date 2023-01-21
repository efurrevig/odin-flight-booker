# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Populate airport table with airport codes and names
Airport.delete_all
airport_names = {ATL: 'Atlanta', LAX: 'Los Angeles', ORD: 'Chicago', DFW: 'Dallas', DEN: "Denver", JFK: "New York", SFO: "San Francisco", SEA: "Seatle",
                    LAS: "Las Vegas", MIA: "Miami", CLT: "Charlotte", IAH: "Houston", PHX: "Phoenix", MCO: "Orlando", EWR: "Newark", BOS: "Boston"}
airport_names.each do |code, name|
  Airport.create(code: code, name: name)
end

#Populate flight table with flight data
Flight.delete_all
airport_codes = Airport.pluck(:id)
airport_codes.each do |departure_airport|
    airport_codes.each do |arrival_airport|
        next if arrival_airport == departure_airport

        #Generate random time for departure_time
        now = Time.now
        three_months_from_now = now + 3.months
        random_time = Time.at(rand(now..three_months_from_now))

        #Generate random flight_duration between 1 and 4 hours
        duration_min = 1.hours
        duration_max = 5.hours
        random_duration = rand(duration_min..duration_max)

        Flight.create(departure_airport: departure_airport, arrival_airport: arrival_airport, departure_time: random_time, flight_duration: random_duration)
    end
end