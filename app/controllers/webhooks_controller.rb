class WebhooksController < ApplicationController
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
        puts session
        puts session.amount_total
        puts ((session.amount_total)/100).to_f
        Order.all.each do |order|
            puts order.total_with_taxes
        end
        amount = ((session.amount_total)/100).to_f
        order = Order.find_by(total_with_taxes: amount)
        new_order_status = OrderStatus.find_by(id: 2)
        order.order_status = new_order_status
        order.save
      end
  
      render json: { message: 'success' }
    end
  end