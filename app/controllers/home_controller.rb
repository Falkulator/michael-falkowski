class HomeController < ApplicationController

	def index
		render "index"
	end
	
	def main	
		render "home", :layout => false
	end
	
	def about
		render "about", :layout => false
	end
	
end
