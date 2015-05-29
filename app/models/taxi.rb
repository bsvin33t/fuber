class Taxi < ActiveRecord::Base
  include Location

  validates :latitude, presence: true
  validates :longitude, presence: true


  def distance_to(latitude, longitude)
    distance_between(self.latitude, self.longitude, latitude, longitude)
  end

  def assigned?
    assigned
  end

  def hipster?
    color == 'pink'
  end

  def unassign
    update_attributes(assigned: false)
  end
end
