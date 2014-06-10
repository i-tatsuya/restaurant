class SelectedSeat < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :seat
  attr_accessible :seat_id
end
