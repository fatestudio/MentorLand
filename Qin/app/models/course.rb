class Course < ActiveRecord::Base
  belong_to :user
  attr_accessible :capacity, :description, :location, :name, :price, :time

end