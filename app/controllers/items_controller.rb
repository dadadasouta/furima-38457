class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new]

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
      render :new
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :day_id, :category_id, :prefecture_id,
                                 :delivery_charge_defrayer_id, :status_id, :description, :price, :image).merge(user_id: current_user.id)
  end
end
