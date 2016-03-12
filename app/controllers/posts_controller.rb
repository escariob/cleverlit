class PostsController < ApplicationController
  def index
      if params[:tag]
          @post = Post.filter_by_tags(params[:tag]).page(params[:page]).per(Setting.post_per_page)
      else
      @post = Post.where(publish: true).order(id: :desc).page(params[:page]).per(Setting.post_per_page)
  end
  end
    
    
  def show
     @post = Post.find(params[:id])
      @visitor_comment = Visitor.new(comments: [Comment.new])
  end
end
