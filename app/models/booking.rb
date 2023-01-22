class Booking < ApplicationRecord
    belongs_to :flight, foreign_key: "flight_id"
    belongs_to :user, foreign_key: "user_id"

    has_many :passengers, foreign_key: "booking_id"

    accepts_nested_attributes_for :passengers, reject_if: :all_blank
end
