require 'site_setting_extension'

class SiteSetting < ActiveRecord::Base
  extend SiteSettingExtension

  attr_accessible :description, :name, :value, :data_type

  validates :name, presence: true
  validates :data_type, presence: true

  # settings available in javascript under Read.SiteSettings

  client_setting(:title, 'Read')
  client_setting(:logo_url, '/assets/logo.png')


  # settings only available server side
  setting(:api_key, '')
  setting(:google_analytics_key, '')

end