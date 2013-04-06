class Entry < ActiveRecord::Base

  attr_accessible :title, :link, :guid, :description, :published

  belongs_to :site

  validates :link, presence: true
  validates :guid, presence: true

end
