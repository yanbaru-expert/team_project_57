class TextsController < ApplicationController
  def index
    @texts = if params[:genre] == "php"
               Text.where(genre: Text::PHP_GENRE_LIST).includes(:read_progresses).order(:created_at)
             else
               Text.where(genre: Text::RAILS_GENRE_LIST).includes(:read_progresses).order(:created_at)
             end
  end

  def show
    @text = Text.find(params[:id])
  end
end
