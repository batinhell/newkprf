class SiteController < ApplicationController
  def index
    @posts = Post.limit(6)
    @slider = Post.slider
    render :layout => 'index'
  end
end
