class Traveler < ApplicationRecord
has_secure_password
before_destroy :destroy_trips

has_many :trips, dependent: :delete_all

validates :username, uniqueness: {case_sensitive: true}
validates :firstname, presence: true
validates :lastname, presence: true
validates :birthday, presence: true
validates :email, uniqueness: true
validates :username, uniqueness: {case_sensitive: true}

def photo=(value)
    if value.blank?
      write_attribute :photo, 'http://bestnycacupuncturist.com/wp-content/uploads/2016/11/anonymous-avatar-sm.jpg'
    else
      write_attribute :photo, value
    end
end

def destroy_trips
  self.trips.destroy_all
end

end
