class HomeController < ApplicationController

	def index
		render "index"
	end
	
	def main
		render "home", :layout => false
	end
	
end
