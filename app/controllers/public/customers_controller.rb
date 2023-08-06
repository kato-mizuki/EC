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

  private
  def current_customer
    current_customer.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:telephone_number,:address,:email)
  end
end
