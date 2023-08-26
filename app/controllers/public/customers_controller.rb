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
    @customer = Customer.find(current_customer.id)
    if current_customer
      customer_status = true && !true
      redirect_to new_customer_registration_path
    else
      customer_status = true && !false
      redirect_to public_customers_information_path
    end
  end


end
