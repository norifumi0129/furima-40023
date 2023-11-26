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

  def show
    @item = Item.find(params[:id])
    @postage_payer = PostagePayer.find_by_id @item.postage_payer_id
    @condition = Condition.find_by_id @item.condition_id
    @category = Category.find_by_id @item.category_id
    @prefecture = Prefecture.find_by_id @item.prefecture_id
    @preparation_day = PreparationDay.find_by_id @item.preparation_day_id
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path, alert: "You don't have permission to edit this item."
    end
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path
  end

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
