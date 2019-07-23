class TravelerSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :birthday, :photo, :username, :password_digest

  has_many :trips

  # class TripSerializer < ActiveModel::Serializer
  #   attributes :trip_name, :start_date, :end_date, :duration
  #
  #   has_many :details
  #
  #   class DetailSerializer < ActiveModel::Serializer
  #     attributes :google_maps_info, :category, :notes, :start_date, :end_date
  #   end

  end
#
#
#   # def trips
#   #  ActiveModel::SerializableResource.new(object.trips,  each_serializer: TripSerializer)
#   #  end
