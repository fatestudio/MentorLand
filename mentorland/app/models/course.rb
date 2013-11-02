class Course < ActiveRecord::Base
  attr_accessible :capacity, :description, :location, :name, :price, :time
end
