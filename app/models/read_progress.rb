class ReadProgress < ApplicationRecord
  belongs_to :user
  belongs_to :text
  validates :user_id, uniqueness: { scope: :text_id }
end
