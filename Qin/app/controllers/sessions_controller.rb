class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    user = User.find_by_name(params[:name])
	if not user
		user = User.find_by_email(params[:name])	# find by email
	end
	
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_url #:back
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end
  
  # GET regUser
  def register	# register for new user; copy from users_controller.rb : new
    @user = User.new		

    respond_to do |format|
      format.html 
    end
  end
  
  # POST regUser
  def regUser	
    user = User.new(params[:user])	# this :user is created in def register! and we can new a user through this way!

    respond_to do |format|
      if user.save
        format.html { redirect_to login_url, 
			alert: "User #{user.name} was successfully created." }
        format.json { render json: user,
          status: :created, location: user }
      else
        format.html { render action: "register" }
        format.json { render json: user.errors,
          status: :unprocessable_entity }
      end
    end
  end	

  
  
  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "Logged out"
  end
end
