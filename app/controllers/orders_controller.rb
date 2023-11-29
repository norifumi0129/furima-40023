class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end
end
