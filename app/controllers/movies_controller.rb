class MoviesController < ApplicationController
  PER_PAGE = 12

  def index
    @movies = Movie.page.where(genre: Movie::RAILS_GENRE_LIST).per(PER_PAGE)
  end
end
