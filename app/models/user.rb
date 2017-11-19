class User < ApplicationRecord
  include Sluggable
  has_secure_password validations: false
  sluggable_column :name

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :name, presence: true
end
