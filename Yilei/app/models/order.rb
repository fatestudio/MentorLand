class Order < ActiveRecord::Base
  attr_accessible :billing_address, :first_name, :last_name, :month, :card_no, :verification_value, :year
	has_many :line_items, dependent: :destroy
	
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			#item.cart_id = nil
			line_items << item
		end
	end
	
	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end
end
