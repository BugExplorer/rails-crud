class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @article.build_thumbnail
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes article_params
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :description,
                                      :content, :author_name,
                                      thumbnail_attributes: [:data])
    end
end
