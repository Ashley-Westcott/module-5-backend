class TripSerializer < ActiveModel::Serializer
  attributes :id, :traveler_id, :trip_name, :start_date, :end_date, :duration
  has_many :details
  belongs_to :traveler

#
#   # def details
#   #   ActiveModel::SerializableResource.new(object.details,  each_serializer: DetailSerializer)
#   # end
end
