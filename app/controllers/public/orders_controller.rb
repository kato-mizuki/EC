class Public::OrdersController < ApplicationController
  def new
    @order = Order.all
  end

  def confirm
  end

  def thanks
  end

  def create
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
