class Passenger < ApplicationRecord
    belongs_to :booking, foreign_key: "booking_id"
    has_one :user, through: :booking
end
