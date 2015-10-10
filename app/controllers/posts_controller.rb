class PostsController < ApplicationController
  before_action :get_all_tags, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def new
    @post = Post.new
    @post.build_picture
  end

  def show
    @post = Post.find(params[:id])
    @post_tags = Tag.where(id: @post.tag_ids)
    respond_to do |format|
      format.html
      format.pdf do
        render template: "posts/show_pdf.html.slim",
               pdf: "report",
               layout: "pdf.html.slim"
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new post_params
    @post.tag_ids = params[:tag_ids]
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.tag_ids = params[:tag_ids] if params[:tag_ids]
    if @post.update_attributes post_params
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private
    def get_all_tags
      @tags = Tag.all
    end

    def post_params
      params.require(:post).permit(:title, :content, :author_name,
                                   picture_attributes: [:data])
    end
end
