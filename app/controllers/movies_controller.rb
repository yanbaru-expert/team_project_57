class MoviesController < ApplicationController
  PER_PAGE = 12

  def index
    @movies = Movie.filter_by(params[:genre]).page(params[:page]).per(PER_PAGE).includes(:watch_progresses)
  end
end
