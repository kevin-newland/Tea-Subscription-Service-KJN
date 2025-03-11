class Subscription < ApplicationRecord
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions 
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas

  validates :title, presence: true
  validates :price, presence: true
  validates :frequency, presence: true

  def self.add_teas_and_customers(sub_id)
    left_joins(:teas, :customers).where(id: sub_id).distinct.first
  end
end
