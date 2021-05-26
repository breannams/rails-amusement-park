class RidesController < ApplicationController

    def create
        @ride = Ride.create(attraction_id: params["attraction_id"], user_id: session[:user_id])
        @message = @ride.take_ride
       
        redirect_to @ride.user, notice: @message
    end
end