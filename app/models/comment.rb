class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :content, length: { minimum: 2}, presence: true
end
