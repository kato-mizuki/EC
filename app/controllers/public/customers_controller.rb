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
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to public_root_path
  end


end
