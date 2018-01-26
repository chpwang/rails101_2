class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.recent.paginate(:page => params[:page], :per_page => 4)
  end

  def edit
    @post = Post.find(params[:id])
    @group = @post.group

    if current_user != @post.user
      redirect_to root_path, alert: "You have no permission"
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to account_posts_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    flash[:alert] = "Post deleted"
    redirect_to account_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
