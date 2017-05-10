class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_order
  # before_action :set_cart

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  # private
  #   def set_cart
  #     @cart = Cart.find(session[:cart_id])
  #   rescue ActiveRecord::RecordNotFound
  #     @cart = Cart.create
  #     session[:cart_id] = @cart.id
  #   end
end
