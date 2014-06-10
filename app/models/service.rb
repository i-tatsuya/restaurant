class Service < ActiveRecord::Base
  has_many :reservations
  has_many :memorial_has_services
  has_many :memorial, through: :memorial_has_services, source: :memorial
end
