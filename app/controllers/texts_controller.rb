class TextsController < ApplicationController
  def index
    # @texts = Text.where(genre: Text::RAILS_GENRE_LIST)
    @texts = Text.includes(:read_progresses).order(:created_at)
  end

  def show; end
end
