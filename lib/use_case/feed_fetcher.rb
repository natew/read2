require 'feedzirra'
require 'net/http'
require 'uri'

module UseCase
  class FeedFetcher

    def initialize(feed_id, url)
      @feed_id, @url = feed_id, url
    end

    def call
      Rails.logger.info "Updated? #{feed_url_head_updated?}"
      get_new_entries
    end

    def feed_url_head_updated?
      if last_modified = feed_head_last_modified
        feed.updated_at < Time.parse(last_modified)
      else
        false
      end
    end

    def feed_head_last_modified
      uri = URI.parse(@url)
      req = Net::HTTP.start(uri.host) do |http|
        http.open_timeout = 2
        http.read_timeout = 2
        http.request_head(uri.request_uri)['Last-Modified']
      end
    end

    def get_new_entries
      entries = FeedZirra::Feed.fetch_and_parse(url)
      entries.each do |entry|
        break unless is_new_entry(entry)
        create_entry(entry)
      end
    end

    def create_entry(entry)
      entry.content.sanitize!
      feed.create_entry(entry.permit(:title, :url, :author, :content, :published))
    end

    def is_new_entry(guid, url)
      Entry.exists?('guid = ? or url = ?', guid, url)
    end

    private

      def feed
        @feed ||= Feed.find(feed_id)
      end

  end
end