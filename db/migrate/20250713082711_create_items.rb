class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|

      t.string     :title,              null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true
      t.text       :description,        null: false
      t.integer    :category_id,        null: false
      t.integer    :condition_id,       null: false
      t.integer    :shipping_cost_id,   null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :shipping_time_id,   null: false

      t.timestamps
    end
  end
end
