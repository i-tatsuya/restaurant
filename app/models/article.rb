class Article < ActiveRecord::Base
  attr_accessible :title, :contents, :start_date
  validates :title, :contents, presence: true
end
