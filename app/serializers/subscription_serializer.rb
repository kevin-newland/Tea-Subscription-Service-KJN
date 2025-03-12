class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :frequency

  has_many :teas
  has_many :customers, serializer: CustomerSerializer
end