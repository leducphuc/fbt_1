class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = current_user.comments.build
  end

  def create
    @comment = @commentable.comments.build comment_params
    @comment.user = current_user
    unless @comment.commentable.user_id == current_user.id
    @activity = @comment.activities.new tag_user_id: @comment.commentable.user_id,
      user_id: current_user.id
    end
    if @comment.save
      if @comment.commentable_type == "Review"
        @commentable.update_attributes number: Review.maximum("number") +1
      else
        @commentable.commentable.update_attributes number: Review.maximum("number") +1
      end
      flash[:danger] = t "comment.create_error"
      redirect_to :back
    end
  end

  def destroy
    autherize @comment
    if params[:comment_id]
      @comment = Comment.find_by id: params[:comment_id]
    else
      @comment = Comment.find_by id: params[:id]
    end
    flash.now[:danger] = t "comment.not_axist" if @comment.nil?
    if @comment.destroy
      flash[:success] = t "comment.destroyed_success"
    else
      flash[:danger] = t "comment.destroyed_error"
    end
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit :body, :user_id
  end

  def find_commentable
    @commentable = if params[:comment_id]
      Comment.find_by_id params[:comment_id]
    elsif params[:review_id]
      Review.find_by_id params[:review_id]
    else
      Tour.find_by_id params[:tour_id]
    end
  end
end
