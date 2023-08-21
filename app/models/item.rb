class Item < ApplicationRecord

 def with_tax_price
  (price * 1.10).floor
 end
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  belongs_to :order
  has_many :order_detail
end
