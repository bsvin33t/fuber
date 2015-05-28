class Journey < ActiveRecord::Base
  include Location
  attr_accessor :conditions

  belongs_to :taxi

  validates :taxi, presence: true
  validates :start_latitude, presence: true
  validates :start_longitude, presence: true

  before_validation :assign_empty_taxi, if: :new_record?


  def start
    update_attributes(start_time: DateTime.current)
  end

  def end(destination)
    update_attributes(end_time: DateTime.current,
                      end_latitude: destination[:end_latitude],
                      end_longitude: destination[:end_longitude])
  end

  def payment_amount
    (travelled_time * Prices::PERMIN + travelled_distance * Prices::PERKM + extras.to_f).ceil
  end


  private

  def assign_empty_taxi
    self.taxi = EmptyTaxi.nearest_to(start_latitude, start_longitude, conditions)
    self.taxi.assign_to(start_latitude, start_longitude) if self.taxi
  end

  def travelled_time
    (end_time - start_time)/60
  end

  def travelled_distance
    distance_between(start_latitude, start_longitude, end_latitude, end_longitude)
  end

  def extras
    Prices::HIPSTERCAR if self.taxi.hipster?
  end

end