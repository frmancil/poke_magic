class CartController < ApplicationController
  def show
    @render_cart = false
  end

  def add
    @item = Item.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_cart_item = @cart.cart_items.find_by(item_id: @item.id)
      if current_cart_item && quantity > 0
        current_cart_item.update(quantity: current_cart_item.quantity + quantity)
      else
        @cart.cart_items.create(item: @item, quantity:)
      end
        redirect_back(fallback_location: cart_path)
  end

  def remove
    CartItem.find_by(id: params[:id]).destroy
    redirect_back(fallback_location: cart_path)
    end
  end

