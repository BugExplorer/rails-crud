class ArticlesController < ApplicationController
  include FindingAllTags

  def index
    @articles = Article.all.page(params[:page]).per(5)
  end

  def new
    @article = Article.new
    @article.build_thumbnail
  end

  def show
    @article = Article.find(params[:id])
    @article_tags = Tag.where(id: @article.tag_ids)

    if stale?(@article)
      respond_to do |format|
        format.html
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new article_params
    @article.tag_ids = params[:tag_ids]
    if @article.save
      redirect_to @article
    else
      @article.build_thumbnail
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.tag_ids = params[:tag_ids] if params[:tag_ids]
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
