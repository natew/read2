# require 'spec_helper_no_rails'

require_relative "../../../lib/use_case/fetch_feed_entries.rb"

describe "FetchFeedEntries" do

  it "doesnt fetch if the HEAD matches last update" do
    # fetch = UseCase::FetchFeedEntries.new(1, 'http://natewienert.com/posts.rss')
  end

end
