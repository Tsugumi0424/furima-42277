class OrderForm
  include ActiveModel::Model
    attr_accessor :token, :user_id, :item_id,
                  :post_code, :prefecture_id, :municipality,
                  :street_number, :building, :phone_number

    VALID_POSTCODE_REGEX = /\A\d{3}[-]\d{4}\z/

    validates :token, presence: true
    validates :post_code, presence: true,
              format: { with: VALID_POSTCODE_REGEX, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id,
              numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality, presence: true
    validates :street_number, presence: true
    validates :phone_number, presence: true,
              length: { minimum: 10, maximum: 11 , message: "is too short" },
              numericality: { only_integer: true, message: "is invalid. Input only number" }

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
