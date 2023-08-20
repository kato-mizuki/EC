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
    @orders = Order.new(order_params)
    @orders.customer_id = current_customer.id
    @order = current_customer.orders
    @order.each do |order|
        total
        order.update_attribute(total)
        @orders.delete
    end
    @orders.save
    redirect_to public_orders_thanks_path
  end

  def index
    @orders = Order.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:address_name, :postal_code, :address, :payment_method, :total_price)
  end
end
