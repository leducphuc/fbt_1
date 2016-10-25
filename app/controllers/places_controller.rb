class PlacesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_place, only: [:show]

  def index
    q = params[:search]
    if q
      @places = Place.search(name_cont: q).result
    else
      @places = Place.all
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @tours = @place.tours.page(params[:page]).per Settings.show_6
    @place.update_attributes viewer: @place.viewer + Settings.only
  end

  private
  def find_place
    @place = Place.find_by id: params[:id]
    if @place.nil?
      redirect_to root_path
    end
  end
end
