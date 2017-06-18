class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
  end


  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save 
        format.js # Will search for create.js.erb
      else
        format.html { render root_path }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_path)}
      format.js
    end
  end

  def update
    if @post.update_attributes(post_params)
      respond_to do |format|
        format.html {redirect_back(fallback_location: root_path)}
        format.js
      end
    end
  end

  def destroy 
    @post.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:author, :content, :all_tags)
    end
end
