class Article < ApplicationRecord
  has_many_attached :image
  belongs_to :user

  validates_uniqueness_of :id
end
