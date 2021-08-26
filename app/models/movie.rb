class Movie < ApplicationRecord
  has_many :watch_progresses, dependent: :destroy
  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }

  RAILS_GENRE_LIST = %w[basic git ruby rails].freeze

  with_options presence: true do
    validates :genre
    validates :title
    validates :url
  end

  def watched_by?(user)
    watch_progresses.exists?(user_id: user.id)
    # watch_progresses.any? { |watch_progress| watch_progress.user_id == user.id }
  end
end
