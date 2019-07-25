class DetailSerializer < ActiveModel::Serializer
  attributes :id, :trip_id, :google_maps_info, :category, :notes, :start_date, :end_date
#
  belongs_to :trip
end
