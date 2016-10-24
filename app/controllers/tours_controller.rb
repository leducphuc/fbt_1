class ToursController < ApplicationController
  skip_before_action :authenticate_user!
  before_action(only: :show) {find_object "tour", "id"}

  def index
    @tours = Tour.all
  end

  def show
    @booking = @tour.bookings.build
  end
end
