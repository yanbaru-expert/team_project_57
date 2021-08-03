class Text < ApplicationRecord
  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }

  with_options presence: true do
    validates :genre
    validates :title
    validates :content
  end
end
