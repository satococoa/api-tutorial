class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.all
  end
end