class PostsController < ApplicationController

before_action :authenticate_admin!, only: [:create, :update, :destroy]
before_action :set_post, only: [:show, :edit, :update, :destroy]

def new
 @post = Post.new
end

def index 
 @posts = Post.all
end

def show
 @post = Post.find(params[:id])
end

def create 
 @post = Post.create(post_params)
 respond_to do |format|
  if @post.save
 	format.html { redirect_to @post, notice: "Post is created"}
 	format.json { render :show, status: :created, location: @post }
 	SubscriptionMailer.notify(@post).deliver_later
  else
 	format.html { redirect_to posts_url }
 	format.json { render json: @post.errors, status: :unprocessable_entity }
  end
 end
end

def update 
 @post = Post.find(params[:id])
 respond_to do |format| 
  if @post.update(post_params)
  	format.html { redirect_to @post, notice: "Post is updated" }
  	format.json ( render :show, status: :ok, location: @post )
  else 
  	format.html { render :new }
  	format.json { render json: @post.errors, sstatus: :unprocessable_entity }
  end
 end
end

def destroy 
 @post = Post.find(params[:id])
 @post.destroy
 respond_to do |format| 
  format.html { redirect_to posts_url, notice: "Post was destroyed" }
  format.json { head :no_content }
 end
end

private 

def set_post
 @post = Post.find(params[:id])
end

def post_params
 params.require(:post).permit(:title, :body, :image, :image_cache)
end 

end


