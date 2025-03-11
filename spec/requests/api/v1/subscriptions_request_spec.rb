require "rails_helper"

RSpec.describe "Subscription Endpoints" do
  it "can retieve all Subscriptions" do
    customer1 = Customer.create!(first_name: "Jimmy", last_name: "Person", email: "1234@realemail.com",address: "125 Maybe I promote to mod 4")
    subscription1 = Subscription.create!(title: "WOWZA", price: 5.00, is_active: true, frequency: "Weekly", customer_id: customer1.id)
    subscription2 = Subscription.create!(title: "Title", price: 10.52, is_active: true, frequency: "Monthly", customer_id: customer1.id)
    subscription3 = Subscription.create!(title: "hmmmm", price: 13.57, is_active: false, frequency: "Weekly", customer_id: customer1.id)

    get "/api/v1/subscriptions"

    expect(response.status).to eq(200)

    results =  JSON.parse(response.body, symbolize_names: true)[:data] 

    expect(results.count).to eq(3)

    results.each do |result| 
      expect(result).to have_key(:attributes)
      expect(result[:attributes][:title]).to be_a(String)
      expect(result[:attributes][:price].to_d).to be_a(BigDecimal)
      expect(result[:attributes][:is_active]).to be_in([true, false])
      expect(result[:attributes][:frequency]).to be_a(String)
      expect(result[:attributes][:customer_id]).to be_a(Integer)
    end
  end

  it "can retrieve a specific subscription" do
    customer1 = Customer.create!(first_name: "Jimmy", last_name: "Person", email: "1234@realemail.com",address: "125 Maybe I promote to mod 4")
    subscription1 = Subscription.create!(title: "WOWZA", price: 5.00, is_active: true, frequency: "Weekly", customer_id: customer1.id)
    subscription2 = Subscription.create!(title: "Title", price: 10.52, is_active: true, frequency: "Monthly", customer_id: customer1.id)
    subscription3 = Subscription.create!(title: "hmmmm", price: 13.57, is_active: false, frequency: "Weekly", customer_id: customer1.id)

    get "/api/v1/subscriptions/#{subscription2.id}"

    expect(response.status).to eq(200)

    result =  JSON.parse(response.body, symbolize_names: true)[:data] 

    expect(result).to have_key(:attributes)
    expect(result[:attributes][:title]).to eq("Title")
    expect(result[:attributes][:price].to_d).to eq(10.52)
    expect(result[:attributes][:is_active]).to be(true)
    expect(result[:attributes][:frequency]).to eq("Monthly")
    expect(result[:attributes][:customer_id]).to eq(customer1.id)
  end

  it "can cancel a specific subscription by setting is_active to false" do
    customer1 = Customer.create!(first_name: "Jimmy", last_name: "Person", email: "1234@realemail.com",address: "125 Maybe I promote to mod 4")
    subscription1 = Subscription.create!(title: "WOWZA", price: 5.00, is_active: true, frequency: "Weekly", customer_id: customer1.id)
    subscription2 = Subscription.create!(title: "Title", price: 10.52, is_active: true, frequency: "Monthly", customer_id: customer1.id)
    subscription3 = Subscription.create!(title: "hmmmm", price: 13.57, is_active: false, frequency: "Weekly", customer_id: customer1.id)

    patch "/api/v1/subscriptions/#{subscription2.id}"

    expect(response.status).to eq(200)

    result =  JSON.parse(response.body, symbolize_names: true)[:data] 

    expect(result).to have_key(:attributes)
    expect(result[:attributes][:title]).to eq("Title")
    expect(result[:attributes][:price].to_d).to eq(10.52)
    expect(result[:attributes][:is_active]).to be(false)
    expect(result[:attributes][:frequency]).to eq("Monthly")
    expect(result[:attributes][:customer_id]).to eq(customer1.id)
  end
end