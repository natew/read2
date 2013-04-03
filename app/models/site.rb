class Site < ActiveRecord::Base

  attr_accessible :title, :url, :favicon

  has_many :feeds
  has_many :subscribers
  has_many :users, through: :subscribers

  mount_uploader :favicon, FaviconUploader

  validates :title,
    presence: true
    length: { maximum: 200 }

  validates :url,
    presence: true

end