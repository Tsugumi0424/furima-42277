class RemovePriceFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :price
  end
end
