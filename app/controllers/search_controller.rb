class SearchController < ApplicationController
  def index
    @posts = Post.search(params[:search]).page(params[:page]).per(8)
  end
end
