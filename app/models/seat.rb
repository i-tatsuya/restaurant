class Seat < ActiveRecord::Base
  has_many :selected_seats
  has_many :reservations, through: :selected_seats, source: :reservation
end
