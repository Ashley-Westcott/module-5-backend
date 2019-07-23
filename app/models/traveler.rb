class Traveler < ApplicationRecord
has_secure_password

has_many :trips
# accepts_nested_attributes_for :trips
validates :username, uniqueness: {case_sensitive: true}

validates :firstname, presence: true
validates :lastname, presence: true
validates :birthday, presence: true
validates :email, uniqueness: true
validates :username, uniqueness: {case_sensitive: true}

 


def photo=(value)
    if value.blank?
      write_attribute :photo, 'https://user-images.githubusercontent.com/16608864/35882949-bbe13aa0-0bab-11e8-859c-ceda3b213818.jpeg'
    else
      write_attribute :photo, value
    end
  end

end
