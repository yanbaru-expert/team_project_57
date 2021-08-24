class TextsController < ApplicationController
  def index
    @texts = if params[:genre] == "php"
               Text.where(genre: Text::PHP_GENRE_LIST)
             else
               Text.where(genre: Text::RAILS_GENRE_LIST)
             end
  end

  def show; end
end
