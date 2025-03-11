class Api::V1::CustomerSubscriptionsController < ApplicationController
  def update
    customer_subscription = CustomerSubscription.find(params[:id])
    customer_subscription.update!(is_active: false)
    render json: { message: "Cancelation Sucessful" }
  end
end