class BookingsController < ApplicationController

    def new

    end

    def create

    end


    private
        def bookings_params
            params.require(:booking).permit(:flight_id, :user_id)
        end
end
