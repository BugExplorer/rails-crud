class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build comment_params
    redirect_to @commentable if @comment.save
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to @comment.commentable
    else
      render 'edit'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to @comment.commentable
  end

  private

    def find_commentable
      resource, id = request.path.split('/')[1, 2]
      resource.singularize.classify.constantize.find(id)
    end

    def comment_params
      params.require(:comment).permit(:author_name, :content)
    end
end
