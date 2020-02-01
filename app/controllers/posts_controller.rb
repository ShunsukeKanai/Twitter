class PostsController < ApplicationController
  def index
    @posts = current_user.posts
  end

  def show
    @post = current_user.post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      redirect_to @post, notice: "つぶやきました"
    else
      render :new
    end
  end

  def edit
    @post = current_user.post.find(params[:id])
  end

  def update
    post = current_user.post.find(params[:id])
    post.update!(post_params)
    redirect_to posts_url, notice: 'つぶやきを更新しました'
  end

  def destroy
    post = current_user.post.find(params[:id])
    post.destroy
    redirect_to posts_url, notice: 'つぶやきを削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
