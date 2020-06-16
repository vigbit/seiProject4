class Campaign < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :img_url, format: URI::regexp(%w[http https]), presence: true, uniqueness: true
  validates :content, presence: true, uniqueness: true
end
