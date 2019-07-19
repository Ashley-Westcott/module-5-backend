class TravelersController < ApplicationController

  # skip_before_action :authorized, only: [:create]

  def index
        @travelers = Traveler.all
        render json: @travelers, include: 'trips.details'
    end

    def new
      @traveler = Traveler.new
    end

    def profile
      render json: { traveler: TravelerSerializer.new(current_traveler) }, status: :accepted
    end

    def create
        @traveler = Traveler.create(traveler_params)
        if @traveler.valid?
          @token = encode_token({ traveler_id: @traveler.id })
          render json: { traveler: TravelerSerializer.new(@traveler), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create traveler' }, status: :not_acceptable
        end
      end

    def edit
      @traveler = Traveler.find(params[:id])
        if current_traveler == @traveler
        else redirect_to travelers_path
      end
    end

    def update
      @traveler = Traveler.find(params[:id])
      @traveler.update(traveler_params)
      redirect_to traveler_path(@traveler)
    end

    def destroy
      @traveler = Traveler.find(params[:id])
      @traveler.destroy
  	  redirect_to login_path
    end


    # def show
    #
    #  @traveler = Traveler.find(params[:id])
    #  @who_follows_you = @traveler.followers
    #  @who_you_follow = @traveler.followees
    #
    # #   birthday.month == Time.now.month &&
    #   @who_you_follow.each do |traveler|
    #
    #     if traveler.birthday.day == Time.now.day && traveler.birthday.month == Time.now.month
    #
    #       flash[:birthday_notice] = "It is your friend #{traveler.name}'s birthday!"
    #     end
    #   end
    # end

  private

  def traveler_params
      params.require(:traveler).permit(
        :firstname,
        :lastname,
        :birthday,
        :photo,
        :username,
        :email,
        :password)
  end

end
