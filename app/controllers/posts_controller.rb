class PostsController < ApplicationController
  layout 'standard'

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(id: :asc)
    @posts = @posts.paginate(page: params[:page], per_page: 10)
  end

  # Renders the new post form
  def new
    @post = Post.new
  end

  # Saves a new post to the database
  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id # Assuming you have a current_user method

    if @post.save
      redirect_to user_post_path(id: @post.id, user_id: current_user.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
