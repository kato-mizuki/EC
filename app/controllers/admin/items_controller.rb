class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new
    item.save
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
  end

  def edit
  end

  private

  def item
    params.require(:item).permit(:name,:introduction,:price,:image)
  end
end
