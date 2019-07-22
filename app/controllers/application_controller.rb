class ApplicationController < ActionController::API
  # before_action :authorized

  def encode_token(traveler_id)
     JWT.encode({traveler_id: traveler_id}, "xyz")
   end

   def get_auth_headers
     request.headers["Authorization"]
   end

   def decode_token
     begin
       JWT.decode(get_auth_headers, "xyz")[0]["traveler_id"]
     rescue
       nil
     end
   end

   def session_traveler
     Traveler.find_by(id: decode_token)
   end
 end
