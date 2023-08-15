class Public::ItemsController < ApplicationController
  def index
    @item = Item.page(params[:page]).per(8)
    @item.count
  end

  def show
    @items = Item.find(params[:id])
  end
  
  
end
