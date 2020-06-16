class Comment < ApplicationRecord
  belongs_to :campaign
  belongs_to :user

  validates :content, presence: true, uniqueness: true
end
