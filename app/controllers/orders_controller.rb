class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.create(order_params.merge(item_id: @item.id))
    Address.create(address_params)
    redirect_to root_path
  end
  private
  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end
  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(order_id: @order.id)
  end
end