class Api::V1::CustomerSubscriptionsController < ApplicationController
  def update
    customer_subscription = CustomerSubscription.find_by!(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
    customer_subscription.update!(is_active: false)
    render json: { message: "Cancelation Successful" }, status: :ok
  end
end