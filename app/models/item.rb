class Item < ApplicationRecord

 def add_tax_price
  (self.price * 1.10).round
 end
  has_one_attached :image
end
