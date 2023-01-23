class BookingsController < ApplicationController

    def new
        @flight = Flight.find(params[:flight_id])
        @booking = @flight.bookings.create
        params[:num_passengers].to_i.times { @booking.passengers.build }
    end

    def show
        @booking = Booking.find(params[:id])
    end

    def create
        @flight = Flight.find(params[:flight_id])
        @booking = @flight.bookings.create(booking_params)
        @booking.user_id = current_user.id
        if @booking.save
            params[:booking][:passengers_attributes].each do |passenger|
                @booking.passengers.create(name: passenger[:name], email: passenger[:email])
            end
            flash[:notice] = "Booking created successfully"
            redirect_to root_url
        else
            render :new
            @booking.errors.full_messages.each do |message|
                flash.now[:alert] = message
            end
        end  
    end

    private
        def booking_params
            params.require(:booking).permit(:flight_id, :user_id, passengers_attributes: [:name, :email, :booking_id])
        end
end
