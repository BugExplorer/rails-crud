class CommentsController < ApplicationController

  before_action :set_commentable

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_to @commentable
    else
      render 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to :back
  end

  private
    def set_commentable
      @commentable ||= find_commentable
    end

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

    def comment_params
      params.require(:comment).permit(:author_name, :content)
    end
end
