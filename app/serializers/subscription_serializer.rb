class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :frequency

  has_many :teas
  has_many :customers

  attribute :customer_subscription_id do |subscription|
    subscription.customer_subscriptions.first&.id 
  end
end