class TravelerSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :birthday, :photo, :username, :password_digest

  has_many :trips
  # def trips
  #  ActiveModel::SerializableResource.new(object.trips,  each_serializer: TripSerializer)
  #  end
  end
