class Entry < ActiveRecord::Base

  attr_accessible :title, :url, :etag, :content, :published

  belongs_to :site

  validates :url, presence: true
  validates :etag, presence: true

end
