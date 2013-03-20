class PostsController < ApplicationController

  def index
    @posts = Post.all
    @slider = Post.slider
    render :layout => 'index'
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      if params[:post][:image].present?
        render :crop
      else
        redirect_to @post, notice: 'Post was successfully created.'
      end
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      if params[:post][:image].present?
        render :crop
      else
        redirect_to @post, notice: 'Post was successfully updated.'
      end
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
end
