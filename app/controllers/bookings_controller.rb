class BookingsController < ApplicationController

    def new

    end

    def create
        @flight = Flight.find(params[:flight_id])
        @booking = @flight.bookings.build
        @booking.user_id = current_user.id
        if @booking.save
            redirect_to new_passenger_path(nums_passengers: params[:num_passengers], booking_id: @booking.id)
        else
            redirect_to root_path
        end
    end

    private
        def bookings_params
            params.require(:booking).permit(:flight_id, :user_id)
        end
end
