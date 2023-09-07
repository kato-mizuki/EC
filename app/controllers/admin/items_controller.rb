class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item_new = Item.new
  end

  def create
    @item_new = Item.new(item_params)
    @item_new.save
      redirect_to admin_item_path(@item_new.item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

  def edit
     @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:item_id)
  end
end
