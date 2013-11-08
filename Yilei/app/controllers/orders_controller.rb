require 'rubygems'
require 'active_merchant'
class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
		@cart = current_cart
		if @cart.line_items.empty?
			redirect_to store_url, notice: "Your cart is empty"
			return
		end
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
		@order.add_line_items_from_cart(current_cart)
		
		respond_to do |format|
			if @order.save
				# Use the TrustCommerce test servers
				ActiveMerchant::Billing::Base.mode = :test

				gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
										:login => 'TestMerchant',
										:password => 'password')

				# ActiveMerchant accepts all amounts as Integer values in cents
				amount = @order.total_price * 100

				# The card verification value is also known as CVV2, CVC2, or CID
				credit_card = ActiveMerchant::Billing::CreditCard.new(
												:first_name         => @order.first_name,
												:last_name          => @order.last_name,
												:number             => @order.card_no,
												:month              => @order.month,
												:year               => @order.year,
												:verification_value => @order.verification_value)

				# Validating the card automatically detects the card type
				if credit_card.valid?
					# Capture $10 from the credit card
					response = gateway.purchase(amount, credit_card)
					
					Cart.destroy(session[:cart_id])
					session[:cart_id] = nil

					if response.success?
						format.html { redirect_to store_url, notice:
							"Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}" }
						format.json { render json: @order, status: :created,
							location: @order }
					end
				else
					format.html { redirect_to new_order_url, notice:
						"Credit Card invalid" }
					format.json { render json: @order.errors, status: :unprocessable_entity }
				end
				format.html { redirect_to store_url, notice:
					"Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}" }
				format.json { render json: @order, status: :created,
					location: @order }
							
			else
				@cart = current_cart
				format.html { render action: "new" }
				format.json { render json: @order.errors,
					status: :unprocessable_entity }
			end
		end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end