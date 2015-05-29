class Journey < ActiveRecord::Base
  include Location
  attr_accessor :conditions

  belongs_to :taxi

  validates :taxi, presence: true
  validates :start_latitude, presence: true
  validates :start_longitude, presence: true
  validates :end_latitude, presence: true, if: Proc.new { |journey| journey.ended? }
  validates :end_longitude, presence: true, if: Proc.new { |journey| journey.ended? }

  enum status: [:unstarted, :started, :ended]

  before_validation :assign_empty_taxi, if: :new_record?

  after_initialize :set_state


  def start
    @state.start
  end

  def end(destination)
    @state.end(destination)
  end

  def payment_amount
    @state.payment_amount
  end


  private

  def set_state
    @state = JourneyStateFactory.create(self)
  end

  def assign_empty_taxi
    self.taxi = EmptyTaxi.nearest_to(start_latitude, start_longitude, conditions)
    self.taxi.assign_to(start_latitude, start_longitude) if self.taxi
  end
end