class SiteController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(8)
    #@posts = Post.search(params[:search]).page(params[:page]).per(8)
    @slider = Post.slider
    render :layout => 'index'
  end
end
