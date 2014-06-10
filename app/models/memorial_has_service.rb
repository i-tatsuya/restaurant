class MemorialHasService < ActiveRecord::Base
  attr_accessible :memorial_id, :service_id
  belongs_to :memorial
  belongs_to :service
end
