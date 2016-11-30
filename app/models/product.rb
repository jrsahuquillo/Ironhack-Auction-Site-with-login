class Product < ApplicationRecord
  belongs_to :user
  has_many :bids
  validates :title, presence: true
  validates :deadline, presence: true
end
