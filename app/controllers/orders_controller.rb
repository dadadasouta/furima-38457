class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new(order_params)
  end
end
