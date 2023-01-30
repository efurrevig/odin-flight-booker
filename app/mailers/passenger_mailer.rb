class PassengerMailer < ApplicationMailer
    default from: "test@test.com"

    def welcome_email
        @passenger = params[:passenger]
        @flight = params[:flight]
        @departure_airport = params[:departure_airport]
        @arrival_airport = params[:arrival_airport]
        @url = 'http://example.com/login'
        mail(to: @passenger.email, subject: 'Flight details')
    end
end
