class ItemTypesController < ApplicationController
    def index
        @item_types = ItemType.all
    end
    def show
        @item_type = ItemType.find(params[:id])
    end

    def item_type_params
        params_require(:item_type).permit(:name)
    end
end
