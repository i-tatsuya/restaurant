class Course < ActiveRecord::Base
  has_one :image,class_name: "CourseImg",dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
  has_many :reservations

  attr_accessible :image, :price, :course_name, :details, :image_attributes

  validates :course_name, :details, presence: true
  validates :price, presence: true,
    numericality: { only_integer: true}
end
