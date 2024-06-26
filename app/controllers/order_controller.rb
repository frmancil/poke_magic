class OrderController < ApplicationController
    before_action :create, except:[:index]
    
    def index
        @order = Order.joins(:member).where('member_id = ?', "#{current_member.id}")
    end
    
    def show
        @member_order = current_member
        @order_cart = @cart
        @cart = Cart.create
        session[:cart_id] = @cart.id
    end

    def create
        order_number = rand 1..1000000
        @cart.cart_items.each do |cart_item|
            new_order = Order.new
            new_order.is_completed = false
            new_order.price = cart_item.item.price
            new_order.member = current_member
            new_order.quantity = cart_item.quantity
            new_order.item = Item.find_by(id: cart_item.item.id)
            new_order.order_status = OrderStatus.find_by(id: 1)
            new_order.order_number = order_number
            new_order.GST = current_member.province.GST
            new_order.PST = current_member.province.PST
            new_order.HST = current_member.province.HST
            new_order.total = @cart.total
            new_order.total_with_taxes = @cart.total_after_taxes
            new_order.save
            puts new_order.save!
            @order = order_number
        end
    end

    def order_params
        params_require(:order).permit(:order_number, :is_completed, :price, :quantity, :payment_link)
    end
end
