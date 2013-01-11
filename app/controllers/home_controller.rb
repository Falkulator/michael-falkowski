class HomeController < ApplicationController

	def index
		render "index"
	end
	
	def splinko
		render "splinko", :layout => false
	end
	
	def pnoise
		render "pnoise", :layout => false
	end

end
