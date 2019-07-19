class AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def create
    @traveler = Traveler.find_by(username: params[:username])
    #Traveler#authenticate comes from BCrypt
    if @traveler && @traveler.authenticate(params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ traveler_id: @traveler.id })
      render json: { traveler: TravelerSerializer.new(@traveler), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  # private
  #
  # def traveler_login_params
  #   # params { traveler: {username: 'Chandler Bing', password: 'hi' } }
  #   params.require(:traveler).permit(:username, :password)
  # end

end
