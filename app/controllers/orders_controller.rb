class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new(order_params)
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id).merge(
      token: params[:token], user_id: current_user.id
    )
  end
end
