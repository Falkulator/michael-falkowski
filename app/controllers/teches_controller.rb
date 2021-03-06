class TechesController < ApplicationController

	respond_to :json
	before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
	
	def index
		@teches = Tech.all
		respond_to do |format|
    		format.html  { render "admin", :layout => 'admin'}
    		format.json  { render :json => @teches }
  		end
	end
	
	def edit
		@tech = Tech.find(params[:id])
		render "edit", :layout => 'admin'
	end
	
	def show
		@tech = Tech.find(params[:id])
		respond_to do |format|
    		format.html  { render "show", :layout => 'admin'}
    		format.json  { render :json => @tech }
  		end
	end
	
	def new
	 	@tech = Tech.new
	 	render "new", :layout => 'admin'
	end
	
	def create
		@tech = Tech.new(params[:tech])
		if @tech.save
			flash[:notice] = 'Tech was successfully created.' 
			redirect_to :action => 'index'
		else
			flash[:notice] = 'Problem.'
			redirect_to :action => 'index'
		end
	end
	
	def update
		@tech = Tech.find(params[:id])
		if @tech.update_attributes(params[:tech])
			flash[:notice] = 'Tech was successfully updated.'
			redirect_to :action => 'index'
		else
			flash[:notice] = 'Error :('
			redirect_to :action => 'index'
		end
	end
	
	def destroy
		@tech = Tech.find(params[:id])
	  	@tech.destroy
	  	flash[:notice] = 'Tech Deleted'
		redirect_to :action => 'index'
	end
end
