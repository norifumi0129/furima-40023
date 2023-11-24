class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def show
    # @item = Item.find(params[:id])
    # @postage_payer = PostagePayer.find_by_id @item.postage_payer_id
  # end

  def self.search(search)
    if search != ''
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :postage_payer_id, :preparation_day_id,
                                 :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end
end
