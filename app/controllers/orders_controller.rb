class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @orderaddress.valid?
      @orderaddress.save(params,current_user.id)
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end
      
  private
    def order_params
      params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
    end
    

  def pay_item
    Payjp.api_key =    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end