class FlightsController < ApplicationController

    def index
        @airports = Airport.all
        @flights = Flight.all
        
        # Filter flights by params if present
        if params[:departure_airport].present?
            @flights = @flights.where(departure_airport: params[:departure_airport])
        end

        if params[:arrival_airport].present?
            @flights = @flights.where(arrival_airport: params[:arrival_airport])
        end

        if params[:departure_time].present?
            @flights = @flights.where(departure_time: params[:departure_time])
        end

    end

end
