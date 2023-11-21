class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end
  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :condition_id, :postage_payer_id, :preparation_day_id, :prefecture_id, :user_id)
  end
end
