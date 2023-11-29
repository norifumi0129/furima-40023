class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :ensure_user_owns_item, only: [:new]

  def index
  #  gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @item = Item.find(params[:item_id])
    @order = Order.new
    @order_address = OrderAddress.new
  end

  def new
    @order = Order.new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end
  
  # def pay_item
  #  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    # item_paramsが商品の価格を返すメソッドであると仮定します
  #  Payjp::Charge.create(
  #    amount: item_params,
  #    card: order_params[:token],
  #    currency: 'jpy'
  #  )
  # end

  def ensure_user_owns_item
    # ログインしていることを確認
    unless user_signed_in?
      redirect_to new_user_session_path
      return
    end

    # 出品された商品のIDを取得（例：params[:item_id]に出品商品のIDがあると仮定）
    item_id = params[:item_id]

    # 出品商品が存在するか確認
    item = Item.find_by(id: item_id)

    # 出品商品が存在しないか、ログインユーザーがその商品の出品者である場合
    return unless item.nil? || item.user != current_user

    redirect_to root_path
  end
end