class Memorial < ActiveRecord::Base
  has_many :reservations
  has_many :memorial_has_services
  has_many :services, through: :memorial_has_services, source: :service
  validates :memorial_name, presence: true
  validates :memorial_rate, presence: true
end
