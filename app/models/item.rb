class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_time
  belongs_to :user
  has_one_attached :image

  VALID_PRICE_REGEX = /\A[0-9]+\z/

  validates :image, presence: true
  validates :title, presence: { message: "can't be blank"}, length: { maximum: 40 }
  validates :description, presence: { message: "can't be blank"}, length: { minimum: 7, maximum: 1000 }
  validates :price, presence: true,
                    format: { with: VALID_PRICE_REGEX,  message: "is not a number"},
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id,
            :condition_id,
            :shipping_cost_id,
            :prefecture_id,
            :shipping_time_id,
            numericality: { other_than: 1 , message: "can't be blank"} 


end
