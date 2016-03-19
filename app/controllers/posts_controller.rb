class PostsController < ApplicationController
  def index
      if params[:tag]
          @post = Post.filter_by_tags(params[:tag]).page(params[:page]).per(Setting.post_per_page)
      else
      @post = Post.where(publish: true).order(id: :desc).page(params[:page]).per(Setting.post_per_page)
  end
  end
    
    
  def show
      @post = Post.friendly.find(params[:id])
      @visitor_comment = Visitor.new(comments: [Comment.new])
  end
    
    private
    def post_params
        params.require(:post).permit(:title, :content, :slug)
    end
    
    def find_post
        @post = Post.friendly.find(params[:id])
    end
    
end
