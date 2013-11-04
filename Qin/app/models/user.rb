class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :name, :password, :password_confirmation
  validates :name, :presence => true, :uniqueness => true
  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: "Please enter correct email address" }, :presence => true, :uniqueness => true 
  
  has_secure_password
end
