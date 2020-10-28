class User < ApplicationRecord
  has_secure_password
  has_many :articles
  has_many :podcasts

  validates :name, presence: true
  validates :email, presence: true

end
