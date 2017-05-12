class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_cart

  # def clear_cart_link(text = 'Empty Cart')
  #   link_to_remote text,
  #     {:url => { :controller => "cart",
  #               :action => "clear" }},
  #     {:href => url_for(:controller => "cart",
  #                       :action => "clear")}
  # end
  #
  # def remove_dish_link(text, dish)
  #   link_to_remote text, {:url => {:controller => "cart",
  #     :action => "remove",
  #     :id => dish}},
  #     {:title => "Remove",
  #       :href => url_for( :controller => "cart",
  #       :action => "remove", :id => dish)}
  # end

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  # def destroy_cart
  #
  #   session[:cart] = nil
  #
  # end

  # private

    # def session_cart
    #   return @session_cart if defined?(@session_cart)
    #   session_cart!
    # end
    # # use this method if you want to force a SQL query to get the cart.
    # def session_cart!
    #   if cookies[:cart_id]
    #     @session_cart = Cart.includes(:shopping_cart_items).find_by_id(cookies[:cart_id])
    #     unless @session_cart
    #       @session_cart = Cart.create(:user_id => current_user_id)
    #       cookies[:cart_id] = @session_cart.id
    #     end
    #   elsif current_user && current_user.current_cart
    #     @session_cart = current_user.current_cart
    #     cookies[:cart_id] = @session_cart.id
    #   else
    #     @session_cart = Cart.create
    #     cookies[:cart_id] = @session_cart.id
    #   end
    #   @session_cart
    # end
end
