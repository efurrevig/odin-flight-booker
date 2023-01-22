class Passenger < ApplicationRecord
    belongs_to :booking, foreign_key: "booking_id"
    belongs_to :user, through: :booking
end
