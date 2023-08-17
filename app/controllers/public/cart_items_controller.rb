class Public::CartItemsController < ApplicationController
  def index
    @item = Item.all
    @items = Item.find(current_customer.id)
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.customer_id = current.customer_id
    @cart_item.save
    redirect_to public_cart_items_path
    if Item.find_by
      puts
    else
      puts
    end
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
