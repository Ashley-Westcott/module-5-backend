class TripSerializer < ActiveModel::Serializer
  attributes :id, :traveler_id, :trip_name, :start_date, :end_date, :duration
  has_many :details
  belongs_to :traveler
end
