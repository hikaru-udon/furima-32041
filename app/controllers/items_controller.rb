class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
# before_action :move_to_index, only: [:edit, :destroy]　dstroyアクションはパスが重複しているかつ、直打ちで確認はできない。
before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
  
  #メモ：authenticate_user!で先にサインイン画面に弾いているので、必要がない。
  # def move_to_index 
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
  
  def set_item
    @item = Item.find(params[:id])
  end
end
