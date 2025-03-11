class Api::V1::SubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.all
    render json: SubscriptionSerializer.new(subscriptions), status: :ok
  end

  def show
    id = params[:id]
    subscription = Subscription.find(id)
    render json: SubscriptionSerializer.new(subscription), status: :ok
  end

  def update
    id = params[:id]
    subscription = Subscription.find(id)
    subscription.update(is_active: false)
    render json: SubscriptionSerializer.new(subscription), status: :ok
  end
end