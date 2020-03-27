class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @items = Item.includes(:images).order('created_at DESC')
  end

  def create
    Item.create(item_params)
  end

  def edit
    @items = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :category_id)
  end
end
