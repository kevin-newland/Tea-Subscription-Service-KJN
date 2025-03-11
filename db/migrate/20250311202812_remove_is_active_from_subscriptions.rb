class RemoveIsActiveFromSubscriptions < ActiveRecord::Migration[7.1]
  def change
    remove_column :subscriptions, :is_active, :boolean
  end
end
