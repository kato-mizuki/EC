class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.all
    @customers = Customer.find(params[:id])
  end

  def update
  end

  def edit
    @customers = Customer.find(params[:id])
  end
end
