class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :is_active, :frequency, :customer_id
end