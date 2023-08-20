class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def thanks
  end

  def create
    orders = Order.new(order_params)
    orders.each do |order|
      if 
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        order.delete
      end
    end
    orders.save
    redirect_to public_cart_items_path
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:address_name, :postal_code, :address, :payment_method, :total_price)
  end
end
