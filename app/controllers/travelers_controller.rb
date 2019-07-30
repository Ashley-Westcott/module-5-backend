class TravelersController < ApplicationController

  # skip_before_action :authorized, only: [:create]

    def index
        travelers = Traveler.all
        render json: travelers, include: "*.*.*"
        # .to_json(:include => { :trips => { :include => :details}})
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
      traveler = Traveler.new(
			username: params[:username],
			password: params[:password],
      firstname: params[:firstname],
      lastname: params[:lastname],
      birthday: params[:birthday],
      photo: params[:photo],
      email: params[:email]
		)
		if traveler.save
			token = encode_token(traveler.id)
			render json: {traveler: TravelerSerializer.new(traveler), token: token}, include: "*.*.*"
		else
			render json: {errors: traveler.errors.full_messages}
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
      render json: traveler
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
        :password
        )
  end



end
