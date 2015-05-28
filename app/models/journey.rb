class Journey < ActiveRecord::Base

  attr_accessor :conditions

  belongs_to :taxi

  validates :taxi, presence: true
  validates :start_latitude, presence: true
  validates :start_longitude, presence: true

  before_validation :assign_empty_taxi


  def start
    update_attributes(start_time: DateTime.current)
  end

  def end(destination)
    update_attributes(end_time: DateTime.current,
                      end_latitude: destination[:end_latitude],
                      end_longitude: destination[:end_longitude])
  end


  private

  def assign_empty_taxi
    self.taxi = EmptyTaxi.nearest_to(start_latitude, start_longitude, conditions)
    self.taxi.assign_to(start_latitude, start_longitude) if self.taxi
  end

end