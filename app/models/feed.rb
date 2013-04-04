class Feed < ActiveRecord::Base

  attr_accessible :url, :site_id

  belongs_to :site
  
  validates :url, presence: true
  validates :site_id,
    inclusion: { in: ->(id) { Site.pluck(:id) } }

  def types
    {
      rss: '',
      rss2: '',
      atom: ''
    }
  end

end
