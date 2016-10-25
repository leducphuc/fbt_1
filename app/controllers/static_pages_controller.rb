class StaticPagesController < ApplicationController
  skip_filter :authenticate_user!
  before_action :load_place_and_review, only: :home

  def show
    if valid_page?
      render "static_pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist? Pathname
      .new Rails.root + "app/views/static_pages/#{params[:page]}.html.erb"
  end

  def load_place_and_review
    @places = Place.all.order(viewer: :desc).
      limit(Settings.limit_image_view)
    @reviews = Review.all.order(number: :desc).
      limit(6)
  end
end
