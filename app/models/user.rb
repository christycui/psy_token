class User < ApplicationRecord
  has_secure_password validations: false

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :name, presence: true
end
