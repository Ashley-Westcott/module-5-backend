class DetailsController < ApplicationController

  def index
   @details = Detail.all
   render json: @details
  end

   def update
     @detail.update(detail_params)
     if @detail.save
       render json: @detail, status: :accepted
     else
       render json: { errors: @detail.errors.full_messages }, status: :unprocessible_entity
     end
   end

   private

   def detail_params
     params.permit(:trip_id, :google_maps_info, :category, :notes, :start_date, :end_date)
   end

   def find_detail
     @detail = Detail.find(params[:id])
   end

end
