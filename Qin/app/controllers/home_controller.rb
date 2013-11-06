class HomeController < ApplicationController
  skip_authorization_check

  def index
    if user_signed_in?	# ? mark for true false ...
	@roles = current_user.roles
    else
	@roles = ["guest"]
    end
  end
end
