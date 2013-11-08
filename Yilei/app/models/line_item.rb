class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :course_id
	belongs_to :order
	belongs_to :course
	belongs_to :cart
	
	def total_price
		course.price
	end
end
