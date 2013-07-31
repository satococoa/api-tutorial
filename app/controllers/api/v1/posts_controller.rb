class Api::V1::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: 'ok', status: :created
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :name, :body)
    end
end