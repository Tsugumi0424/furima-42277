class CreateShippingTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_times do |t|

      t.timestamps
    end
  end
end
