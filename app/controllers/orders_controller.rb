class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @order_address = OrderAddress.new
  end

  def create
    # binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  
  
  private
  
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :number, :building, :phone_number).merge( item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
  
  def set_item
    @item = Item.find(params[:item_id]) #itemの情報を抜き出している
  end
  
  def move_to_index
    if @item.user.id == current_user.id
      redirect_to root_path
    end
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
