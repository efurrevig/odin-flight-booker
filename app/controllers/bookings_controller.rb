class BookingsController < ApplicationController

    def show
        @booking = Booking.find(params[:id])
    end

    def new
        @flight = Flight.find(params[:flight_id])
        @booking = Booking.new
        params[:num_passengers].to_i.times { @booking.passengers.build }
    end

    def create
        @flight = Flight.find(params[:flight_id])
        @departure_airport = @flight.departure_airport
        @arrival_airport = @flight.arrival_airport
        @booking = Booking.new(bookings_params)
        params[:booking][:passengers_attributes].each do |i, passenger|
            @booking.passengers.build(name: passenger[:name], email: passenger[:email])
        end
        if @booking.save
            @booking.passengers.each do |passenger|
                PassengerMailer.with(flight: @flight, departure_airport: @departure_airport, arrival_airport: @arrival_airport, passenger: passenger).welcome_email.deliver_now
            end
            flash[:notice] = "Booking created successfully"
            redirect_to booking_path(@booking)
        else
            @booking.errors.full_messages.each do |message|
                flash.now[:alert] = message
            end
            render :new
        end  
    end

    private
        def bookings_params
            params.permit(:flight_id, :user_id, passengers_attributes: [:name, :email])
        end
end
