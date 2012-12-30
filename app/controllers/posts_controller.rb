class PostsController < ApplicationController

	respond_to :json
	
	def index
		@posts = Post.all
		respond_to do |format|
    		format.html  {render "admin", :layout => 'admin'}
    		format.json  { render :json => @posts }
  		end
	end
	
	def edit
		@post = Post.find(params[:id])
		render "edit", :layout => 'admin'
	end
	
	def show
		@post = Post.find(params[:id])
		respond_to do |format|
    		format.html  {render "show", :layout => 'admin'}
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
			redirect_to :action => 'index', :notice => 'Post was successfully created.'
		else
			redirect_to :action => 'index', :notice => 'Problem.'
		end
	end
	
	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to :action => 'index', :notice => 'Post was successfully updated.'
		else
			redirect_to :action => 'index', :notice => 'Error :('
		end
	end
	
	def destroy
		@post = Post.find(params[:id])
	  	@post.destroy
		redirect_to :action => 'index', :notice => 'Post Deleted'
	end
end
