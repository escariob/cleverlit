class Admin::CommentsController < Admin::ApplicationController
  def index
      if params[:search].present?
          @comments = Comment.matching_fullname_or_message(params[:search]).page params[:page]
      else
          @comments = Comment.where(status: to_bool(params[:status])).page params[:page]
      end
  end

  def update
     if @comment = Comment.find(params[:id])
      redirect_to :back, notice: 'Successfully updated comment'
  else
      redirect_to :back, notice: 'There was a problem updating comment'
  end
  end

  def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to :back, notice: 'Successfully deleted comment'
    end
end