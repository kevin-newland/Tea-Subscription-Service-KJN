# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

CustomerSubscription.destroy_all
SubscriptionTea.destroy_all
Subscription.destroy_all
Customer.destroy_all
Tea.destroy_all

require "faker"

10.times do
  Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address
  )
end

5.times do 
  Tea.create!(
    title: Faker::Tea.variety,
    description: Faker::Lorem.sentence,
    temperature: rand(175..212),
    brew_time: rand(2..5)
  )
end

20.times do
  Subscription.create!(
    title: "#{Faker::Tea.variety} Subscription",
    price: Faker::Commerce.price(range: 5.0..20.0),
    frequency: %w[weekly bi-weekly monthly].sample
  )
end

Customer.all.each do |customer|
  subscriptions = Subscription.all.sample(rand(1..3))
  subscriptions.each do |subscription|
    CustomerSubscription.create!(customer: customer, subscription: subscription, is_active: true) 
  end
end

Subscription.all.each do |subscription|
  teas = Tea.all.sample(rand(1..3))
  teas.each do |tea|
    SubscriptionTea.create!(subscription: subscription, tea: tea)
  end
end