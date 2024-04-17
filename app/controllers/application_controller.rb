class ApplicationController < ActionController::Base
    before_action :set_render_cart
    before_action :initialize_cart
    before_action :set_current_member

    def set_current_member
      Member.current = current_member
    end

    def set_render_cart
        @render_cart = true
    end

    def add_to_cart
        id = params[:id].to_i
        session[:cart] << id unless session[:cart].include?(id)
        redirect_back(fallback_location: index)
    end

    def remove_from_cart
        id = params[:id].to_i
        session[:cart].delete(id)
        redirect_back(fallback_location: index)
    end

    def initialize_cart
        @cart ||= Cart.find_by(id: session[:cart_id])

        if @cart.nil?
            @cart = Cart.create
            session[:cart_id] = @cart.id
        end
    end
end
