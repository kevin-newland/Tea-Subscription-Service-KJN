require "rails_helper"

RSpec.describe "customer_subscription Endpoints", type: :request do
  it "can cancel a subscriptions" do
    customer = Customer.create!(first_name: "Jimmy", last_name: "whocares", email: "seeyainmod3@example.com", address: "123 yay St")
    subscription = Subscription.create!(title: "Title", price: 10.52, frequency: "Monthly")
    customer_subscription = CustomerSubscription.create!(customer_id: customer.id, subscription_id: subscription.id, is_active: true)

    patch "/api/v1/customer_subscriptions/#{customer.id}/#{subscription.id}"

    expect(response.status).to eq(200)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:message)
    expect(result[:message]).to eq("Cancelation Successful")
  end

  it "can returns an error when teh record is not found" do
    customer = Customer.create!(first_name: "Jimmy", last_name: "whocares", email: "seeyainmod3@example.com", address: "123 yay St")
    subscription = Subscription.create!(title: "Title", price: 10.52, frequency: "Monthly")
    
    patch "/api/v1/customer_subscriptions/#{customer.id}/#{subscription.id}"
    
    expect(response.status).to eq(404)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:error)
    expect(result[:error]).to eq("Record not found")
  end
end