class Buyerorder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building_name,
                :phone_number, :user_id, :product_id, :token

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONE_NUMBER_REGEX = /\A\d{11}\z/.freeze

  with_options presence: true do
    validates :city, :address, :token
    validates :postal_code, format: { with: POSTAL_CODE_REGEX }
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX }
    validates :prefectures_id, numericality: { other_than: 1 }
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Buyer.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address,
                 building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
