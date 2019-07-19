class TravelerSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :birthday, :photo, :username, :password_digest

  has_many :trips
end
