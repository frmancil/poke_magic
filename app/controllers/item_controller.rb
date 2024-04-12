class ItemController < ApplicationController
    before_action :initialize_session

    def index
        @items = Item.page(params[:page])
    end

    def show
        @item = Item.find(params[:id])
    end

    def add_to_cart
        session[:cart] << params[:id]
        redirect_back(fallback_location: index)
    end

    def initialize_session
        session[:cart] ||= []
    end

    def search
        if params[:type].blank?
            if params[:search].blank?
                redirect_to '/' and return
            else
                @parameter = params[:search].downcase
                @results = Item.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
            end
        else
            if params[:search].blank?
                redirect_to '/' and return
            else
                @parameter = params[:search].downcase
                @type = params[:type]
                @results = Item.all.where("lower(name) LIKE :search AND item_type_id = :type", search: "%#{@parameter}%", type: "#{@type}")
            end
        end
    end

    def item_params
        params_require(:item).permit(:name, :stock, :price, :rarity, :item_type, :game_type)
    end
end
