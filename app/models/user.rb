class User < ActiveRecord::Base
  attr_accessible :user_name,:address,:mail_address,:phone_number,:birthday,:administrator,:password_confirmation,:password
  attr_accessor :password, :password_confirmation
  validates :password,presence: {on: :create},confirmation: {allow_blank: true}
  validates :user_name, :address, :mail_address, :birthday, presence: true
  validates :phone_number, presence: true
  has_many :reservations, dependent: :destroy

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end
  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("user_name LIKE ? OR phone_number LIKE ?",
                "%#{query}%", "%#{query}%")
      end
      rel
    end

    def authenticate(maddress,password)
      user = find_by_mail_address(maddress)
      if user && user.hashed_password.present? && BCrypt::Password.new(user.hashed_password) == password
        user
      else
        nil
      end
    end
  end

end
