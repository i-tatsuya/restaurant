class Reservation < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :selected_seats
  has_many :seats, through: :selected_seats, source: :seat
  belongs_to :course, class_name: "Course", foreign_key: "course_id"
  belongs_to :service, class_name: "Service", foreign_key: "service_id"
  belongs_to :memorial, class_name: "Memorial", foreign_key: "memorial_id"


  accepts_nested_attributes_for :selected_seats

  attr_accessible :user_id ,:date, :time, :persons, :course_id, :memorial_id, :message, :seat_id, :selected_seats_attributes, :service_id, :service

  def new1valid?
    flag = true
    if !date.instance_of?(Date)
      flag = false
    end
#    if date < Time.now
#      flag = false
#    end
    if !time
      flag = false
    end
    if !course
      flag = false
    end
    flag
  end

  def new2valid?
    flag = true
    selected_seats.each_with_index do |val, i|
      i.upto(selected_seats.length-1) do |j|
        if i != j
          if val.seat_id == selected_seats[j].seat_id
            flag = false
          end
        end
      end
    end
    flag
  end

  class << self
    def searchdate(query)
      rel = order("date DESC")
      if query.present?
        rel = rel.where("date LIKE ?", "%#{query}%")
      end
      rel
    end
    def searchname(query)
      rel = joins(:author)
      if query.present?
        rel = rel.where("user_name LIKE ?", "%#{query}%")
      end
      rel = order("date DESC")
      rel
    end
  end

end
