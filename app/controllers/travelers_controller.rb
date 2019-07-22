class TravelersController < ApplicationController

  # skip_before_action :authorized, only: [:create]

    def index
        travelers = Traveler.all
        render json: travelers, include: 'trips.details'
    end

    def show
    		traveler = Traveler.find(params[:id])
    		render json: traveler
    end

    def new
      traveler = Traveler.new
      render json: traveler
    end

    def create
        traveler = Traveler.create(traveler_params)
        if traveler.valid?
          token = encode_token({ traveler_id: traveler.id })
          render json: { traveler: TravelerSerializer.new(traveler), jwt: token }, status: :created
        else
          render json: { error: 'failed to create traveler' }, status: :not_acceptable
        end
    end

    def edit
      traveler = Traveler.find(params[:id])
        if current_traveler == traveler
        else redirect_to travelers_path
      end
    end

    def update
      traveler = Traveler.find(params[:id])
      traveler.update(traveler_params)
      redirect_to traveler_path(traveler)
    end

    def destroy
      traveler = Traveler.find(params[:id])
      traveler.destroy
  	  redirect_to login_path
    end


  private

  def traveler_params
      params.require(:traveler).permit(
        :firstname,
        :lastname,
        :birthday,
        :photo,
        :username,
        :email,
        :password,
        )
  end

end
