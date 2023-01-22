class PassengersController < ApplicationController

    def new
        @booking = Booking.find(params[:booking_id])
        @num_passengers = params[:nums_passengers].to_i
        @passengers = @booking.passengers.build
    end
end
