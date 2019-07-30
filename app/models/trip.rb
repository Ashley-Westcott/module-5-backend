class Trip < ApplicationRecord
belongs_to :traveler
has_many :details, dependent: :delete_all
# accepts_nested_attributes_for :details
end
