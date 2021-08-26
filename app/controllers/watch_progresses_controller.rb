class WatchProgressesController < ApplicationController
  def create
    # @movie = Movie.find(params[:movie_id])
    # current_user.watch_progresses.create!(movie_id: @movie.id)
    current_user.watch_progresses.create!(movie_id: params[:movie_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # @movie = Movie.find(params[:movie_id])
    # current_user.watch_progresses.find_by(movie_id: @movie.id).destroy!
    current_user.watch_progresses.find_by(movie_id: params[:movie_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
end
