require "rails_helper"

RSpec.describe "Subscription Endpoints" do
  it "can retieve all Subscriptions" do
    subscription1 = Subscription.create!(title: "WOWZA", price: 5.00, frequency: "Weekly")
    subscription2 = Subscription.create!(title: "Title", price: 10.52, frequency: "Monthly")
    subscription3 = Subscription.create!(title: "hmmmm", price: 13.57, frequency: "Weekly")

    get "/api/v1/subscriptions"

    expect(response.status).to eq(200)

    results =  JSON.parse(response.body, symbolize_names: true)[:data] 

    expect(results.count).to eq(3)

    results.each do |result| 
      expect(result).to have_key(:attributes)
      expect(result[:attributes][:title]).to be_a(String)
      expect(result[:attributes][:price].to_d).to be_a(BigDecimal)
      expect(result[:attributes][:frequency]).to be_a(String)
    end
  end

  it "can retrieve a specific subscription" do
    subscription = Subscription.create!(title: "Title", price: 10.52, frequency: "Monthly")

    get "/api/v1/subscriptions/#{subscription.id}"
    
    expect(response.status).to eq(200)

    result =  JSON.parse(response.body, symbolize_names: true)[:data] 
    
    expect(result).to have_key(:attributes)
    expect(result[:attributes][:title]).to eq("Title")
    expect(result[:attributes][:price].to_d).to eq(10.52)
    expect(result[:attributes][:frequency]).to eq("Monthly")
  end
end