class CartsController < ApplicationController
  # before_filter :set_cart, :only => [:index, :show]
  def show
    @order_items = current_order.order_items
  end

  private
  def set_cart

  end
end
