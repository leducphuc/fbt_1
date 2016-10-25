class ToursController < ApplicationController
  skip_before_action :authenticate_user!
  before_action(only: :show) {find_object "tour", "id"}

  def index
    q = params[:search]
    if q
      @tours = Tour.search(name_or_price_cont: q).result
    else
      @tours = Tour.all
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @comment = Comment.new
    @booking = @tour.bookings.build
  end
end
