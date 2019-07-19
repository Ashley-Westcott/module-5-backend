class ApplicationController < ActionController::API
  # before_action :authorized

  def encode_token(payload) #{ traveler_id: 2 }
    JWT.encode(payload, 'my_s3cr3t') #issue a token, store payload in token
  end

  def auth_header
    request.headers['Authorization'] # Bearer <token>
  end

  def decoded_token
    if auth_header()
      token = auth_header.split(' ')[1] #[Bearer, <token>]
      begin
        JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
        # JWT.decode => [{ "traveler_id"=>"2" }, { "alg"=>"HS256" }]
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_traveler
    if decoded_token()
      traveler_id = decoded_token[0]['traveler_id'] #[{ "traveler_id"=>"2" }, { "alg"=>"HS256" }]
      @traveler = Traveler.find_by(id: traveler_id)
    else
      nil
    end
  end

  def logged_in
    !!current_traveler
  end

  def authorized
    if !logged_in
      render json: { message: 'Please log in' }
    end
  end

end
