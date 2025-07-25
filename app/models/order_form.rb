class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id,
                :post_code, :prefecture_id, :municipality,
                :street_number, :building, :phone_number

  VALID_POSTCODE_REGEX = /\A\d{3}-\d{4}\z/

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: VALID_POSTCODE_REGEX, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :municipality
    validates :street_number
    validates :phone_number, length: { minimum: 10, maximum: 11, message: 'is too short' },
                             numericality: { only_integer: true, message: 'is invalid. Input only number' }
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id,
            numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create!(
      post_code: post_code,
      prefecture_id: prefecture_id,
      municipality: municipality,
      street_number: street_number,
      building: building,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
