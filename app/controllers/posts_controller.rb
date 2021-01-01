# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize, except: %i[index show]

  def index
    styp = admin? ? Post::POST_STATUSES : ['public']
    @posts = Post.where(status: styp).order(:created_at)
  end

  def show
    redirect_to(posts_path, alert: 'unauthorized access') and return unless @post.public? || admin?
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :status, :body)
  end
end
