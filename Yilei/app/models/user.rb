class User < ActiveRecord::Base
  attr_accessible :credit_card_billing_address, :credit_card_month, :credit_card_no, :credit_card_type, :credit_card_verification_value, :credit_card_year, :email, :first_name, :last_name, :name, :password_digest, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  has_secure_password
end
