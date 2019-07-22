class AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def login
    # byebug
    traveler = Traveler.find_by(username: params[:username])
    #Traveler#authenticate comes from BCrypt
    if traveler && traveler.authenticate(params[:password])
      # encode token comes from ApplicationController
      token = encode_token(traveler.id)
      render json: { traveler: TravelerSerializer.new(traveler), token: token }, status: :accepted
    else
      render json: { errors: 'Invalid username or password' }, status: :unauthorized
    end
  end

    def auto_login
     if session_traveler
        render json: session_traveler
     else
       render json: {errors: "Error"}
     end
   end
end

  # private
  #
  # def traveler_login_params
  #   # params { traveler: {username: 'Chandler Bing', password: 'hi' } }
  #   params.require(:traveler).permit(:username, :password)
  # end
