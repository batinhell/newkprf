class PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(2)
    @slider = Post.slider
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
    respond_to do |format|
      if @post.update_attributes(params[:post])
        if params[:post][:image].present?
          render :crop
        else
          format.html { redirect_to(@post, notice: 'Post was successfully updated.') }
          format.json { respond_with_bip(@post) }
        end
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@post) }
      end
    end  
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
end
