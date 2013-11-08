class Course < ActiveRecord::Base
  attr_accessible :capacity, :description, :location, :name, :price, :time
	validates	:name, :description, :time, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :capacity, numericality: {greater_than: 0}
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	
	private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
