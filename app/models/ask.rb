class Ask < ApplicationRecord
  belongs_to :user
  validates :ask_price, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
end