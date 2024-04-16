class OrderController < ApplicationController
    def show
        @member_order = current_member
    end


    def order_params
        params_require(:order).permit(:name, :stock, :price, :rarity, :item_type, :game_type)
    end
end
