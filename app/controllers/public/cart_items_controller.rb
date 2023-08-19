class Public::CartItemsController < ApplicationController
  def index
    @item = Item.all
    @items = Item.find(current_customer.id)
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_items = Cart_item.new(cart_item_params)
    @cart_items.customer_id = current_customer.id
    @cart_items.item_id = current_cart_item_params([:item_id])
    if Cart_Item.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = Cart_Item.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to cart_items_path
    else
      cart_item.save
      redirect_to public_cart_items_path
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
