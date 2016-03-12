class Admin::DashboardController < Admin::ApplicationController
  def index
      @post = Post.last 5
      @comments = Comment.last 5
      @visitors = Visitor.last 5
  end
end
