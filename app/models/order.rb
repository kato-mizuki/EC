class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  belongs_to :customer
  has_many :items
  has_many :order_details

  def subtotal
    item.with_tax_price * amount
  end

  def total
    subtotal += 800
  end
end
