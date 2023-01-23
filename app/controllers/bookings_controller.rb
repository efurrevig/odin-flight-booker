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
        @booking = Booking.new(bookings_params)
        params[:booking][:passengers_attributes].each do |i, passenger|
            @booking.passengers.build(name: passenger[:name], email: passenger[:email])
        end
        if @booking.save
            flash[:notice] = "Booking created successfully"
            redirect_to root_url
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
