class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    raise
    @item = Item.new
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :price)
  end
end
