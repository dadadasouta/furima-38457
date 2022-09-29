class ItemsController < ApplicationController

  def index
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

  private

  def item_params
    params.require(:item).permit(:name, :day_id, :category_id, :prefecture_id, :delivery_charge_defrayer_id, :status_id, :description, :price)
  end

end
