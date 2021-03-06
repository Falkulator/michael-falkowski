class PostsController < ApplicationController

	respond_to :json
	before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
	
	def index
		@posts = Post.all
		respond_to do |format|
    		format.html  { render "admin", :layout => 'admin'}
    		format.json  { render :json => @posts.reverse }
  		end
	end
	
	def edit
		@post = Post.find(params[:id])
		render "edit", :layout => 'admin'
	end
	
	def show
		@post = Post.find(params[:id])
		respond_to do |format|
    		format.html  { render "show", :layout => 'admin'}
    		format.json  { render :json => @post }
  		end
	end
	
	def new
	 	@post = Post.new
	 	render "new", :layout => 'admin'
	end
	
	def create
		@post = Post.new(params[:post])
		if @post.save
			flash[:notice] = 'Post was successfully created.' 
			redirect_to :action => 'index'
		else
			flash[:notice] = 'Problem.'
			redirect_to :action => 'index'
		end
	end
	
	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			flash[:notice] = 'Post was successfully updated.'
			redirect_to :action => 'index'
		else
			flash[:notice] = 'Error :('
			redirect_to :action => 'index'
		end
	end
	
	def destroy
		@post = Post.find(params[:id])
	  	@post.destroy
	  	flash[:notice] = 'Post Deleted'
		redirect_to :action => 'index'
	end
end
