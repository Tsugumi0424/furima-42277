class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :order,             null: false, foreign_key: true
      t.string     :post_code,         null: false
      t.integer    :prefecture_id,     null: false
      t.string     :municipality,      null: false
      t.string     :street_number,     null: false
      t.string     :building
      t.string     :phone_number,      null: false

      t.timestamps
    end
  end
end
