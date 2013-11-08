class StoreController < ApplicationController
  def index
		@courses = Course.order(:name)
  end
end
