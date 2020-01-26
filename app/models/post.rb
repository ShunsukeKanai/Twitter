class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 30}
end
