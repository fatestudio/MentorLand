class WelcomeController < ApplicationController
	skip_before_filter :authorize
	def new 
	end
	
	def index
		