class PostsController < ApplicationController
  layout 'standard'
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).order(id: :asc).paginate(page: params[:page], per_page: 5)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user
    if @post.save
      flash[:success] = 'Post Created!'
      redirect_to user_posts_url
    else
      flash.now[:error] = 'Error: Post can not be created!'
      render :new, locals: { post: @post }
    end
  end
end
