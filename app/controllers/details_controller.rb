class DetailsController < ApplicationController

  def index
   details = Detail.all
   render json: details
  end

  def new
    detail = Detail.new
    render json: detail
  end

  def show
      detail = Detail.find(params[:id])
      render json: detail
  end

  def create
      detail = Detail.create(detail_params)
      render json: detail
  end

  def edit
    details = Detail.find(params[:id])
      if current_details == details
      else redirect_to detailss_path
    end
  end

   def update
     detail = Detail.find(params[:id])
     detail.update(detail_params)
     render json: detail
     # detail.update(detail_params)
     # if detail.save
     #   render json: detail, status: :accepted
     # else
     #   render json: { errors: detail.errors.full_messages }, status: :unprocessible_entity
   end

   def destroy
     detail = Detail.find(params[:id])
     detail.destroy
     render json: detail
   end

   private

   def detail_params
     params.permit(:trip_id, :google_maps_info, :category, :notes, :start_date, :end_date)
   end

   def find_detail
     detail = Detail.find(params[:id])
   end

end
