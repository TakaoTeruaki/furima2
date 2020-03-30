class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @items = Item.includes(:item_image).order('created_at DESC')
    @parents = Category.all.order("id ASC").limit(10)
  end

  def create
    # Item.create(item_params)
    @item = Item.new(item_params)
    # @item.create(item_params)
    # binding.pry
    @item.save
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

  def search
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
        #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :price, :category_id)
  end
end
