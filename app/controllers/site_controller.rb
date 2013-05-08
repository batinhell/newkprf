class SiteController < ApplicationController
  def index
    # @posts = Post.limit(6)
    @posts = Post.page(params[:page]).per(1)
    @slider = Post.slider
    render :layout => 'index'
  end
end
