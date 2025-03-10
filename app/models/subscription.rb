class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas

  validates :title, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  validates :frequency, presence: true
end
