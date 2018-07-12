class PostController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @post = Post.all.reverse
  end

  def new
  end

  def create
    uploader = ImageUploader.new
    uploader.store!(params[:image])

    @post = Post.new
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.user_id = current_user.id
    @post.image = uploader.url
    @post.thumb = uploader.thumb.url
    @post.middle = uploader.middle.url
    @post.save
    
    redirect_to "/post/index"
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    
    redirect_to "/post/show/" + params[:id]
  end

  def edit
    @post =Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to "/post/index"
    else
      redirect_to "/post/index"
    end
    
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def search
    if params[:cate] =="1"
      @post = Post.where("title LIKE ?", "%#{params[:q]}%")
    elsif params[:cate] == "2"
      @post = Post.where("content LIKE ?", "%#{params[:q]}%")
    elsif params[:cate] == "3"
      @post = Post.where("title LIKE? OR content LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    elsif params[:cate] == "4"
      @post = User.where("username LIKE ?", "%#{params[:q]}%").take.posts
   end
  end
end