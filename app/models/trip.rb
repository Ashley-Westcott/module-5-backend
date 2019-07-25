class Trip < ApplicationRecord
belongs_to :traveler
has_many :details
# accepts_nested_attributes_for :details
end
