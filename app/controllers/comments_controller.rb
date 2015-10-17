class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build comment_params

    if @comment.save
      # get a channel name (post4, article2, etc.)
      path = request.path.split('/')
      channel = path[1] + path[2]

      # render html for JS append
      html = render @comment, layout: false
      Pusher[channel].trigger 'comments/create', html
    end
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
