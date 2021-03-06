class WorksController < ApplicationController
	respond_to :json
	before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
	
	def index
		@works = Work.all
		respond_to do |format|
    		format.html  { render "admin", :layout => 'admin'}
    		format.json  { render :json => @works }
  		end
	end
	
	def edit
		@work = Work.find(params[:id])
		render "edit", :layout => 'admin'
	end
	
	def show
		@work = Work.find(params[:id])
		respond_to do |format|
    		format.html  { render "show", :layout => 'admin'}
    		format.json  { render :json => @work }
  		end
	end
	
	def new
	 	@work = Work.new
	 	render "new", :layout => 'admin'
	end
	
	def create
		@work = Work.new(params[:work])
		if @work.save
			flash[:notice] = 'Work was successfully created.' 
			redirect_to :action => 'index'
		else
			flash[:notice] = 'Problem.'
			redirect_to :action => 'index'
		end
	end
	
	def update
		@work = Work.find(params[:id])
		if @work.update_attributes(params[:work])
			flash[:notice] = 'Work was successfully updated.'
			redirect_to :action => 'index'
		else
			flash[:notice] = 'Error :('
			redirect_to :action => 'index'
		end
	end
	
	def destroy
		@work = Work.find(params[:id])
	  	@work.destroy
	  	flash[:notice] = 'Work Deleted'
		redirect_to :action => 'index'
	end
end
