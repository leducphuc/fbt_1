class LikesController < ApplicationController
  before_action :find_likeable, only: :create
  before_action :find_like, only: :destroy

  def create
    current_user.likes.build(likeable_id: @likeable.id).save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  private
  def find_likeable
    @likeable = if params[:review_id]
      Review.find_by_id params[:review_id]
    else
      Comment.find_by_id params[:comment_id]
    end
  end

  def find_like
    @like = current_user.likes.find_by likeable_id: params[:id]
    if @like.nil?
      flash[:danger] = t "like.cant_find_like"
      redirect_to :back
    end
  end
end
