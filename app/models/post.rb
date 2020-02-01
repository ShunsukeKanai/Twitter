class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 30}

  belongs_to :user
end
