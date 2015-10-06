class TagsController < ApplicationController
  before_action :find_tag

  def show
    @posts = Post.any_tags(@tag.id)
  end

  protected

    def find_tag
      @tag = Tag.where(slug: params[:id]).first
    end
end
