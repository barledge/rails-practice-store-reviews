class User < ActiveRecord::Base
  has_secure_password(validations: false)

  validates_confirmation_of :password, if: ->{ password.present? }, message: "Passwords do not match"

  validate do |record|
    record.errors.add(:password, :blank) unless record.password_digest.present?
  end

  validates :email,
            presence: true,
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i, message: " is invalid"}

  validates :email,
            uniqueness: true

  validates :password,
            format: {with: /\A^(?=.*\d)(?=.*[a-zA-Z]).{8,12}$\z/, message: "must be at least 8-12 characters with 1 number"}, if: 'password.present?'

end
