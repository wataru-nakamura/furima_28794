class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_price
  has_one_attached :image

  validates :image, :name, :explanation, :category_id, :status_id,
            :shipping_fee_id, :shipping_origin_id,:shipping_price_id, 
            :selling_price, :user_id, presence: true

  validates :selling_price, numericality: { greater_than_or_equal_to: 300,
            less_than_or_equal_to: 9999999,}

  
  validates :category_id, :status_id, :shipping_fee_id, :shipping_origin_id,
            :shipping_price_id, numericality: { other_than: 1 }
end
