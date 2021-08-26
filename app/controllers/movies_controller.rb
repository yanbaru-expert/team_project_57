class MoviesController < ApplicationController
  def index
    @movies = if params[:genre] == "php"
                Movie.where(genre: Movie::PHP_GENRE_LIST)
              else
                Movie.where(genre: Movie::RAILS_GENRE_LIST).includes(:watch_progresses).order(:created_at)
              end
  end
end
