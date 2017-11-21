class Bid < ApplicationRecord
  belongs_to :user
  validates :bid_price, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
end