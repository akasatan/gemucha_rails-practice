class PostsController < ApplicationController
  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @post  = @tag.posts.page(params[:page])
  end
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render posts_path #変える
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content)
  end
  
end
