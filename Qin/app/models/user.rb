class User < ActiveRecord::Base
  has_one :mentor
  has_one :student
  rolify
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :user_id
  #attr_accessible :email, :first_name, :last_name, :name, :password, :password_confirmation
  validates :name, :presence => true, :uniqueness => true
  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: "Please enter correct email address" }, :presence => true, :uniqueness => true 

	def self.find_for_database_authentication(conditions={})
	  self.where("name = ?", conditions[:email]).limit(1).first ||
	  self.where("email = ?", conditions[:email]).limit(1).first
	end 

  after_create :default_role

  protected
  def default_role
    self.roles << Role.where(:name => :user).first
  end

end
