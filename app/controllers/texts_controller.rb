class TextsController < ApplicationController
  def index
    @texts = Text.where(genre: Text::RAILS_GENRE_LIST).includes(:read_progresses).order(:created_at)
  end

  def show
    @text = Text.find(params[:id])
  end
end
