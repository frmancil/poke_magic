class WebhooksController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_action :verify_authenticity_token
  
    def create
      payload = request.body.read
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      event = nil

      endpoint_secret = ENV["STRIPE_WEBHOOK_KEY"]
  
      begin
        event = Stripe::Webhook.construct_event(
          payload, sig_header, endpoint_secret
        )
      rescue JSON::ParserError => e
        status 400
        return
      rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        puts "Signature error"
        p e
        return
      end
  
      # Handle the event
      case event.type
      when 'checkout.session.completed'
        session = event.data.object
        session_with_expand = Stripe::Checkout::Session.retrieve({ id: session.id, expand: ["line_items"]})
        session_with_expand.line_items.data.each do |line_item|
          order = Order.find_by(order_number: line_item.price_data.product_data.name)
          order_status = OrderStatus.find_by(id: 2)
          order.order_status = 2
          order.save
        end
      end
  
      render json: { message: 'success' }
    end
  end