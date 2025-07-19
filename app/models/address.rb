class Address < ApplicationRecord
  belongs_to :order

  validates :post_code, presence: true
  validates :prefecture_id,
            numericality: { other_than: 0, message: "can't be blank" }
  validates :municipality, presence: true
  validates :street_number, presence: true
  validates :phone_number, presence: true
                            numericality: { only_integer: true}

end
