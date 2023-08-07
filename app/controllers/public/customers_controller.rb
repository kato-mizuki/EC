class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.all
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
  end

  def withdraw
  end

  def withdraw_update
  end


end
