class CheckoutController < ApplicationController

    def create
        puts params[:order_number]
        order = Order.find_by(order_number: params[:order_number])
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            metadata: {
                order_id: order.order_number,
            },
            line_items: [{
                price_data: {
                    currency: "cad",
                    unit_amount: (order.total_with_taxes * 100).to_i,
                    product_data: {
                        name: order.order_number,
                    },
                },
                quantity: 1,
            }],
            mode: 'payment',
            success_url: root_url,
            cancel_url: root_url,
        })
        redirect_to @session.url, allow_other_host: true
    end
end
