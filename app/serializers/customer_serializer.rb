class CustomerSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :address

  attribute :customer_subscription_id do |customer|
    customer.customer_subscriptions.first&.id 
  end
end