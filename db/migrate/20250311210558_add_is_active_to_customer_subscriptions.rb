class AddIsActiveToCustomerSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :customer_subscriptions, :is_active, :boolean
  end
end
