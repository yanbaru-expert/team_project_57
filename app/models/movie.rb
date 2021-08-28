class Movie < ApplicationRecord
  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }

  RAILS_GENRE_LIST = %w[basic git ruby rails].freeze
  PHP_GENRE_LIST = %w[php].freeze

  def self.filter_by(genre)
    if genre == "php"
      Movie.where(genre: Movie::PHP_GENRE_LIST)
    else
      Movie.where(genre: Movie::RAILS_GENRE_LIST)
    end
  end

  with_options presence: true do
    validates :genre
    validates :title
    validates :url
  end
end
