class User < ActiveRecord::Base
  has_secure_password

  validates :email,
            presence: true,
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i, message: " is invalid"}

  validates :password,
            format: {with: /\A^(?=.*\d)(?=.*[a-zA-Z]).{8,12}$\z/, message: "must be at least 8-12 characters with 1 number"}

end
