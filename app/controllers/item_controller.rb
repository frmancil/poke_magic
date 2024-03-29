class ItemController < ApplicationController
    def index
        @items = Item.page(params[:page])
    end

    def show
        @item = Item.find(params[:id])
    end

    def item_params
        params_require(:item).permit(:name, :stock, :price, :rarity, :item_type, :game_type)
    end
end
