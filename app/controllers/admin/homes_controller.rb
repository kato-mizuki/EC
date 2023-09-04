class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).per(10)
    @order = Order.find(current_customer.id)
  end

end
