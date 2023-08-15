class Public::ItemsController < ApplicationController
  def index
    @item = Item.all
    @item.count
  end

  def show
  end

end
