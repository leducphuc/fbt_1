class SearchesController < ApplicationController
  skip_filter :authenticate_user!

  def index
    q = params[:search]
    places = Place.search(name_cont: q).result
    tours = Tour.search(name_or_price_cont: q).result
                 .includes(:place)
    @items = places + tours
    respond_to do |format|
      format.js
      format.html
    end
  end
end
