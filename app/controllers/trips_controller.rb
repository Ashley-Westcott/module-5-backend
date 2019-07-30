class TripsController < ApplicationController

  def index
   trips = Trip.all
   render json: trips
  end

  def new
    trip = Trip.new
    render json: trip
  end

  def show
      trip = Trip.find(params[:id])
      render json: trip
  end

  def create
      trip = Trip.create(trip_params)
      render json: trip
  end

   def update
     trip.update(trip_params)
     if trip.save
       render json: trip, status: :accepted
     else
       render json: { errors: trip.errors.full_messages }, status: :unprocessible_entity
     end
   end

   def destroy
     trip = Trip.find(params[:id])
     trip.destroy
     render json: trip
   end

   private

   def trip_params
     params.permit(:traveler_id, :trip_name, :start_date, :end_date, :duration)
   end

   def find_trip
     trip = Trip.find(params[:id])
   end

end
