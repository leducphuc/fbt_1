class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  before_action :load_places, only: [:new, :edit]
  before_action(except: [:new, :create, :index]) {find_object "review", "id"}
  before_action(only: :show) {find_object "activity", "notification_id"}
  before_action :max_number, only: :create

  def index
    if current_user
      @reviews = current_user.reviews
    else
      @reviews = Review.all
    end
  end

  def show
    if @notification
      @notification.update_attributes seen: true;
    end
    @comment = Comment.new
  end

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build review_params
    @review.assign_attributes number: @max + 1
    if @review.save
      flash.now[:success] = t "review.create_success"
      redirect_to @review
    else
      flash.now[:danger] = t "review.create_error"
      load_places
      render :new
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update_attributes review_params
      flash.now[:success] = t "review.updated_success"
      redirect_to @review
    else
      load_places
      render :edit
    end
  end

  def destroy
    authorize @review
    if @review.destroy
      flash.now[:success] = t "review.destroyed_success"
    else
      flash.now[:danger] = t "review.destroyed_error"
    end
    redirect_to root_url
  end

  private
  def review_params
    params.require(:review).permit :title, :content, :place_id
  end

  def max_number
    @max = Review.maximum("number")
  end
end
