class PostsController < ApplicationController
  before_action :require_user, only: [:create, :new]
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
    flash.now[:danger] = "Whoops! Looks like you don't have a location reference for the post. Add a location from the top." if current_user.posts == []
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:body, :location_id))
    @post.user = current_user
    if @post.save
      flash[:notice] = "Your post was added!"
      redirect_to root_path
    else
      render 'new'
    end
  end
end