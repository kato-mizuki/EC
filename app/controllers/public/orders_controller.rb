class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = 0
    @items = Item.find(current_customer.id)
  end

  def thanks
  end

  def create
    @orders = Order.new(order_params)
    @orders.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @orders.save
    @cart_items.each do |cart_item|
        order_detail = OrderDetail.new()
        order_detail.order_id = @orders.id
        order_detail.item_id = cart_item.item_id
        order_detail.item_amount = cart_item.amount
        order_detail.add_tax_price = cart_item.item.with_tax_price
        order_detail.save
        cart_item.update_attribute
        cart_item.delete
    end

    redirect_to public_orders_thanks_path
  end

  def index
    @orders = Order.all
  end

  def show
    @orders = Order.all
    @order = Order.find(current_customer.id)
    @cart_items = current_customer.cart_items
  end

  private

  def order_params
    params.require(:order).permit(:address_name, :postal_code, :address, :payment_method, :total_price, :postage)
  end
end
