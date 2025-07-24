class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_time
  belongs_to :user
  has_one_attached :image
  has_one    :order

  validates :image, presence: true
  validates :title, presence: { message: "can't be blank" }, length: { maximum: 40 }
  validates :description, presence: { message: "can't be blank" }, length: { maximum: 1000 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id,
            :condition_id,
            :shipping_cost_id,
            :prefecture_id,
            :shipping_time_id,
            numericality: { other_than: 0, message: "can't be blank" }
end
