class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :require_signin, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    @postage_payer = PostagePayer.find_by_id @item.postage_payer_id
    @condition = Condition.find_by_id @item.condition_id
    @category = Category.find_by_id @item.category_id
    @prefecture = Prefecture.find_by_id @item.prefecture_id
    @preparation_day = PreparationDay.find_by_id @item.preparation_day_id
  end

  def edit
    return if current_user == @item.user
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def self.search(search)
    if search != ''
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
  def destroy
    @item.destroy
    redirect_to root_path
  end
  private
  def require_signin
    return if user_signed_in? # または適切なログイン状態のチェック

    redirect_to new_user_session_path
  end
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :postage_payer_id, :preparation_day_id,
                                 :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end
end
