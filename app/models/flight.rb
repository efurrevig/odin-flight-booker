class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport"
    belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport"

    has_many :bookings, foreign_key: "flight_id"
    has_many :passengers, through: :bookings
end
