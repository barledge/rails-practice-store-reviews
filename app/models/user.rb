class User < ActiveRecord::Base
  # skipping validations because we needed to customize the
  # password confirmation message and using the built in validations
  # caused a huge hack using I18n strings
  has_secure_password(validations: false)

  validates_confirmation_of :password, if: ->{ password.present? }, message: "do not match"

  validates :email,
            presence: true,
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i, message: " is invalid"}

  validates :password,
            format: {with: /\A^(?=.*\d)(?=.*[a-zA-Z]).{8,12}$\z/, message: "must be at least 8-12 characters with 1 number"}

end
