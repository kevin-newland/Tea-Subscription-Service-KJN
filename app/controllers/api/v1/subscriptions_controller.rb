class Api::V1::SubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.all
    render json: SubscriptionSerializer.new(subscriptions), status: :ok
  end

  def show
    subscription = Subscription.add_teas_and_customers(params[:id]) 
    render json: SubscriptionSerializer.new(subscription, include: [:teas, :customers]), status: :ok
  end
end